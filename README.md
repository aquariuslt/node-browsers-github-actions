# Github Action for Yarn/NPM with Bundled Browsers Environment

Use yarn as workflow actions to enable the repository which need to use 
yarn-only features such as `workspaces`

And with browsers environment support (Headless Chrome)


## Usage

You can use this repository using published yarn packages:

### Use Marketplace Alias (Recommend)



### Use Github Repo Scheme 

```workflow
workflow "Build and test on push" {
  on = "push"
  resolves = ["Unit Test"]
}

action "Install Dependencies" {
  uses = "aquariuslt/node-browsers-github-actions@master"
  runs = "yarn"
  args = "install"
}

action "Unit Test" {
  uses = "aquariuslt/node-browsers-github-actions@master"
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
  uses = "docker://aquariuslt/node-10-browsers@master"
}

action "Unit Test" {
  uses = "docker://aquariuslt/node-10-browsers@master"
  needs = ["Install Dependencies"]
  args = "test"
}
```



## Example

You can refer to [my blog repo actions](https://github.com/aquariuslt/blog/actions).
