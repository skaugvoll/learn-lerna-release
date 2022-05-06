# learn-lerna-release
repo to lern the Lerna release cycle, commands and configuration
[Docs](https://github.com/lerna/lerna/blob/main/commands/version/README.md#--allow-branch-glob)

# Strategy
- Pre-release
    - On `closed` `merge request` to main
        - Server pre-release
        - Create pr to production
- release
    - On `open` `merge_request` to `production`
      - Sem-ver release 
    - On `closed` `merge_request` to `production`
      - auto deploy to production 


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

4. `lerna publish` Lerna will never publish packages which are marked as `private` ("private": true in the package.json). [docs](https://github.com/lerna/lerna/issues/2111)

5. When using the built in GITHUB.TOKEN secret to update repository, the action will never trigger a new workflow to start. This is by design, thus using a custom personal access token would be a good way to go! [DOCS](https://docs.github.com/en/actions/using-workflows/triggering-a-workflow#triggering-a-workflow-from-a-workflow)
