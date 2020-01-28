# Ecosia Cypress Base

This image is almost identical to [`cypress/base:10.15.3`](https://github.com/cypress-io/cypress-docker-images/blob/master/base/10.15.3/Dockerfile), except it uses the `slim` variant of `node:10.15.3` to reduce the uncompressed image size by about 600MB.

## IMPORTANT: Pushing to Docker Hub

If you're pushing a new version of this image, make sure to tag it with the Cypress version it installs, so that images using it as a base can pick the Cypress version they want to use - e.g. `docker tag my_image_id ecosiadev/cypress-base:3.4.1`.
