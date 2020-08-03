# Overview

Dockerized set of scripts to support Keptn use case integration into CI/CI pipelines as tasks.

# Keptn Compatibility Matrix

Refer to the image tagging for Keptn version compatibility

| Keptn Version    | Image                                    |
|:----------------:|:----------------------------------------:|
|      0.7.0       | dtdemos/keptn-docker-tasks:0.1.0         |

# Usage

1. Keptn CLI

    The keptn CLI is build into the image can can can be run with any parameters it supports.  For example
    ```
    # authenticate
    docker run dtdemos/keptn-docker-tasks keptn auth --api-token $TOKEN --endpoint $URL
    # get keptn statuss
    docker run dtdemos/keptn-docker-tasks keptn status
    ```

1. [Keptn Prepare Project](./PREPAREPROJECT.md)
1. [Keptn Quality Gate](./QUALITYGATE.md)

# Development

Use the following helper unix bash scripts to build and test the docker image

* `buildpush.sh` builds local docker image and then pushes it to registry
* `buildtest.sh` builds local docker image and then calls the `test.sh` script

The image tag will be read from the `version` file.  When you publish a new version update the 'Keptn Compatibility Matrix' in this README.

Local setup

1. Copy the example from the `usage` section above into a file called `test.sh` and then adjust the values for your testing. Note that `test.sh` is part of `.gitignore` so fill in your unique arguments and they won't be saved to the repo.

1. After you save the file run `chmod +x test.sh`

1. Test by just calling `./test.sh` and review the results in your Keptn Bridge UI
