# Github Action for Yarn


Use yarn as workflow actions to enable the repository which need to use 
yarn-only features such as `workspaces`


## Usage

You can use this repository using published yarn packages:

### Use Github Repo Scheme (Recommend)

```workflow
workflow "Build and test on push" {
  on = "push"
  resolves = ["Unit Test"]
}

action "Install Dependencies" {
  uses = "aquariuslt/github-actions-yarn@master"
  runs = "yarn"
  args = "install"
}

action "Unit Test" {
  uses = "aquariuslt/github-actions-yarn@master"
  needs = ["Install Dependencies"]
  args = "test"
  runs = "yarn"
}

```



### Use `docker://` Scheme

Sadly, I haven't see any success example on github official action repo `.workflow` file use this scheme.

```workflow
workflow "Build and test on push" {
  on = "push"
  resolves = ["Unit Test"]
}

action "Install Dependencies" {
  uses = "docker://aquariuslt/yarn@master"
}

action "Unit Test" {
  uses = "docker://aquariuslt/yarn@master"
  needs = ["Install Dependencies"]
  args = "test"
}
```



## Example

You can refer to [my blog repo actions](https://github.com/aquariuslt/blog/actions).
