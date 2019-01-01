# Github Action for Yarn


Use yarn as workflow actions to enable the repository which need to use 
yarn-only features such as `workspaces`


## Usage

You can use this repository using published yarn packages:


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



