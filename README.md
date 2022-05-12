# learn-lerna-release
Repo to lern the Lerna release cycle, commands and configuration
[Docs](https://github.com/lerna/lerna/blob/main/commands/version/README.md#--allow-branch-glob)

# Strategy
- Pre-release
    - On `closed` `merge request` to `main`
        - Server pre-release
        - Create pr to production
- Release
    - On `closed` `merge_request` to `production`
      - Sem-ver release & publish
    - On `tag` `release`
      - Deploy


# Pre-requisits:
1. run `npm install --legacy-peer-deps`, to get the commitizen `cz-conventional-changelog` to install with lerna version >=4.x.x
2. Create a Github Personal Access Token, 
   1. permissions to read and write to repository, and trigger workflows
   2. Add token to Github action secrets, so we can use it in github actions/workflows
3. allow versioning on other branches than main, `lerna.json`
   1. `{
  "command": {
    "version": {
      "allowBranch": ["main","master","production",..., "feature/*"]
    }
  }
}`

# Noteworthy
1. `lerna publish` Lerna will never publish packages which are marked as `private` ("private": true in the package.json). [docs](https://github.com/lerna/lerna/issues/2111)

2. When using the `built in` `GITHUB.TOKEN` secret to update repository, the action will **never** trigger a new workflow to start. This is by design, thus using a custom personal access token would be a good way to go! [DOCS](https://docs.github.com/en/actions/using-workflows/triggering-a-workflow#triggering-a-workflow-from-a-workflow)

3. If no changes found, sem-ver workflow will fail