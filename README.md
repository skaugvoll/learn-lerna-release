# learn-lerna-release
![deploy-to-gh-env](https://github.com/skaugvoll/learn-lerna-release/actions/workflows/simulate-deploy-to-environment.yml/badge.svg?branch=sisk-environments)
![sem-ver](https://github.com/skaugvoll/learn-lerna-release/actions/workflows/sem-ver.yml/badge.svg?branch=sisk-environments)
![create-release-deploy](https://github.com/skaugvoll/learn-lerna-release/actions/workflows/create-release-deploy.yml/badge.svg)
![deploy-prod](https://github.com/skaugvoll/learn-lerna-release/actions/workflows/deploy-prod.yml/badge.svg)

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

4. If there exists an merge request between master and production and we try to create another one. It will fail silenty, becuase there can only be one merge request between two branches at the same time. But the merge request code content will be updatet.
   1. So only thing is that PR title can be misleading if specifying version number, as it's the initial version that created pull_request that will be shown, but it can actually be the very last. Thus PR title should be deploy to production environment and not state version, unless there is a way to update the PR_title ? don't think the repo-sync/pull-request@v2 has this functionality