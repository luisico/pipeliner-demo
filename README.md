# Pipeliner Demo

[Pipeliner](https://github.com/luisico/pipeliner) is a set of CICD pipeline templates for GitLab based on [Trunk-Based Development](https://trunkbaseddevelopment.com) git workflows to be deployed in Docker Swarm clusters maintained by CCE.

This demo provides a minimal template to explore CICD workflows with [Pipeliner](https://github.com/luisico/pipeliner).

## How to use this demo

Note: instructions are for GitLab, where this project was developed.

First you need to fork this repo so your CICD pipelines, pushes and merges do not conflict with other demo users:

   1. Fork this repo by clicking in the `Fork` button (top right) and selecting a destination namespace.
   1. Once the new forked repo is ready, change the Merge Request target by clicking in `Settings | General` (right sidebar) and expanding section `Merge request`. Scroll to the bottom to find `Target project` and select `This project`, then save the chagnes. This will prevent merge request to default merging back to the upstream project you forked from.

      Alternatively, you can remove the fork relationship in `Settings | General`, expand section `Advanced` and click on `Remove fork relationship` at the bottom.

Second, you need to setup a CICD variables and runners:
   - Configure your CICD variables for deployment to the swarm cluster.
   - Activate specialized CICD runners for your pipeline's build stage.

Finally, read [Pipeliner's documenation](https://github.com/luisico/pipeliner) to familiarize yourself with the pipelines offered (`release-from-trunk`, `release-from-tag` and `continuous-release`), as well as environments, jobs, variables, and how to customize them. Now you can add a pipeline to this project by renaming `.gitlab-ci.yml.sample` to `.gitlab-ci.yml`, and customizing it. Note to personalize the `APP_NAME` with your `INITIALS` to avoid conflicting URLs among demo users. Replace `example.com` through out the code with your own repository and image URLs.

After pushing to your GitLab instance, you should see your pipeline running. Feel free to customize your pipelines and see the results. Remember that different jobs run depending on the pipeline and how the code was pushed, for example: is it a branch? which branch? a tag? is a merge request open? ...). Deployments are pushed to live staging environments only when a merge request is open, and to production only on pushes to the default branch (`master` in this case) or a tag, when using `release-from-trunk` and `release-from-tag`, respectively.

When creating your pipeline, you can use GitLab's Pipeline Editor in `CI/CD | Editor` to visualize pipeline stages and jobs, as well as immediate validation.

## Pipeliner overrides

Note this demo overrides production jobs to provide a way to stop the production deployment. While this is not needed in real-world application, this is needed here to avoid accumulating demo "production" deployment and allow demo users to stop the environment on demand. Note that any deployment from this demo will auto-stop in 3 days to further prevent accumulation of containers in the swarm clusters.

This customization can be found in `.pipeliner-overrides`.

## Author Information

Luis Gracia while at [The Rockefeller University](https://www.rockefeller.edu):
- lgracia [at] rockefeller.edu
- GitHub at [luisico](https://github.com/luisico)
