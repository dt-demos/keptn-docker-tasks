# Overview

Dockerized set of scripts to support Keptn use case integration into CI/CD pipelines as tasks.

# Keptn Compatibility Matrix

Refer to the image tagging for Keptn version compatibility

| Keptn Version    | Image                                    |
|:----------------:|:----------------------------------------:|
|      0.7.0       | dtdemos/keptn-docker-tasks:0.1.0         |

# Usage

Use the `docker run` command with a `task type` argument. General syntax is:

```
docker run --rm \
    --env [VARIABLE-1]=[VALUE-1] \
    --env [VARIABLE-2]=[VALUE-2] \
    run dtdemos/keptn-docker-tasks:0.1.0 [TASK TYPE]
```

Valid `task types` are: 

1. **keptn**

    This task does use any ENVIRONMENT variables.  Instead, this task just calls the [Keptn CLI](https://keptn.sh/docs/0.7.x/reference/cli/) that is build into the image with any addition command arguments.  For example:

    ```
    # authenticate Keptn CLI
    docker run dtdemos/keptn-docker-tasks:0.1.0 keptn auth --api-token $TOKEN --endpoint $URL
    
    # get Keptn status
    docker run dtdemos/keptn-docker-tasks:0.1.0 keptn status
    ```

1. **prepareproject**

    This task will perform the logic to [Onboard a Project and Service to Keptn](https://keptn.sh/docs/0.7.x/manage/project/). This task does uses a Docker volume as to gain access to the various files required to create a project, onboard a service, and add various resource files.  See this [README](./PREPAREPROJECT.md) for details.

1. **qualitygate**

    This task performs the logic to perform a [Keptn SLO evaluation](https://keptn.sh/docs/0.7.x/quality_gates/) often referred to as a `quality gate`.  See this [README](./QUALITYGATE.md) for details.

# Development

Use the following helper unix bash scripts to build and test the docker image

* `buildpush.sh` builds local docker image and then pushes it to registry
* `buildtest.sh` builds local docker image and then calls the `test.sh` script

The image tag will be read from the `version` file.  When you publish a new version update the 'Keptn Compatibility Matrix' in this README.

Testing

1. Copy the example from the `usage` sections in the README files into a file called `test.sh` and then adjust the values for your testing. Note that `test.sh` is part of `.gitignore` so fill in your unique arguments and they won't be saved to the repo.

1. After you save the file run `chmod +x test.sh`

1. Test by just calling `./test.sh` and review the results in your Keptn Bridge UI
