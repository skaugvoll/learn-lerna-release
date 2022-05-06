# learn-lerna-release
repo to lern the Lerna release cycle, commands and configuration
(test)[https://github.com/lerna/lerna/blob/main/commands/version/README.md#--allow-branch-glob]

# Troubles
1. needed to run `npm install --legacy-peer-deps`, to get the commitizen `cz-conventional-changelog` to install with lerna version >=4.x.x

2. For lerna versioning and publish command in workflow, we either need to assign `permissions` to github.token in the workflow file, or we can just change the default permission for github workflows to be read and write, instead of only read (default). This is done through repository settings

3. For learna to `allow versioning on other branches than main` (new default) we need to add some configuration to `lerna.json`
   1. `{
  "command": {
    "version": {
      "allowBranch": ["main","master","production",..., "feature/*"]
    }
  }
}`