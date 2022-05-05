# learn-lerna-release
repo to lern the Lerna release cycle, commands and configuration


# Troubles
1. needed to run npm install --legacy-peer-deps, to get the commitizen cz-lerna-changelog to install with lerana version >=4.x.x

2. TEST OUT: for lerna versioning and publish command in workflow, we either need to assign permissions to github.token in the workflow file, or we can just change the default permission for github workflows to be read and write, instead of only read (default)