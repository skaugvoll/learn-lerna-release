# Github Environments

When adding a workflow with a job that has `jobs.<job_id>.environment: x` there pops up a new tile on the pull_request that did the deploy job, and shows. `This branch was successfully | failed  deployed`
it states, `1 active deployent`
also links to `see environments`

![pull request tile](.resources/gh-env-pull_request_tile.png)

There is also a new Tile in the right-menu on the front-page (<>code) of the repository

![<>Code right menu tile](.resources/gh-env-code_page_tile.png)

the Tile is clickable and takes you to a new page `Deployments/History`

![Deployment/history tile](.resources/gh-env-deployment_history_page_tile.png)

## Giving undefined environment
This works, github creates the environment for you :smile:

## Jobs with Strategy.Matrix
This example is done using a matrix with package-a and package-b as value, and passing the matrix values as suffix to environment
Github creates the dev-${{matrix.package}} environment for us

It actually does all the deployments. this is equal to having one environment for each package. Which in turn would be to have just one environment dev.

![Matrix deploy, different envs](.resources/gh-env-matrix_deploy_diff_envs_tile.png)

Resulting on different environments on code page (repo frontpage)

![Matrix deploy, different envs, code page](.resources/gh-env-matrix_deploy_diff_envs_code_page_tile.png)
