# Keptn Prepare project

Dockerized script that will perform the logic to perform a [Keptn Onboard Project](https://keptn.sh/docs/0.7.x/manage/project/)

Use Cases:
* Add task prior to sending calling the keptn quality gate task

Script logic:
1. Valiate the passed in shipyard, sli, and slo files exists
1. Download the Keptn CLI
1. Authenticate the Keptn CLI for the passed in api and token
1. If keptn project does not exist, then call `keptn cli create project`
1. If keptn service does not exist, then call `keptn cli create service`
1. If pass in `DYNATRACE_MONITORING` as `true`, then call `keptn configure monitoring dynatrace` for the project and call `keptn add-resource` for the passed in sli file
1. Always call `keptn add-resource` for the passed in slo file

# Usage

Assumption for setup:
* The `docker run` command assumes a single `volume` that contained all the input files 

Call the `docker run` command as shown in this example. 

*NOTE: the path to the files are in the VOLUME that was specified in the docker run command. In this example mapped to the `/tmp` directory within docker.*

```
#!/bin/bash

image=dtdemos/keptn-docker-task:0.1.0
keptnApiUrl=https://api.keptn.<YOUR KEPTN DOMAIN>
keptnApiToken=<YOUR KEPTN TOKEN>
project=demo
service=simplenodeservice
stage=dev
source=local
shipyardFile=/tmp/testing/shipyard.yaml
sloFile=/tmp/testing/slo.yaml
jmeterFile=
dynatraceMonitoring=true
dynatraceSliFile=/tmp/testing/dynatrace/sli.yaml
dynatraceConfFile=/tmp/testing/dynatrace/dynatrace.conf.yaml
debug=true

docker run --rm \
    --env API_URL=$keptnApiUrl \
    --env KEPTN_TOKEN=$keptnApiToken \
    --env PROJECT=$project \
    --env SERVICE=$service \
    --env STAGE=$stage \
    --env SOURCE=$source \
    --env SHIPYARD_FILE=$shipyardFile \
    --env SLO_FILE=$sloFile \
    --env DYNATRACE_MONITORING=$dynatraceMonitoring \
    --env DYNATRACE_SLI_FILE=$dynatraceSliFile \
    --env DYNATRACE_CONF_FILE=$dynatraceConfFile \
    --env DEBUG=$debugx \
    -v ${PWD}:/tmp \
    $image prepareproject
```

Refer to the table below for parameters:

| Required | Name | Description | Valid Values | Default |
|:---:|---|---|---|---|
| Y | KEPTN_URL | URL to Keptn API (1) | example https://api.keptn.11.22.33.44/api  |  |
| Y | KEPTN_TOKEN | Keptn API Token (2) |  |  |
| Y | PROJECT | Keptn Project Name | example: keptnorders  |  |
| Y | SERVICE | Keptn Service Name | example: frontend  |  |
| Y | STAGE | Keptn Stage Name | example: staging  |  |   
| Y | SHIPYARD_FILE | Keptn project file path within docker | example: /tmp/shipyard.yaml  |  |   
| Y | SLO_FILE | Keptn SLO path within docker | example: /tmp/slo.yaml  |  |  
|   | SOURCE | Description for the evaluation request | example: Azure-DevOps  | unknown |
|   | DEBUG | Detailed Messsage | true, false  | false |
|   | DYNATRACE_MONITORING | Configure Dynatrace monitoring for Keptn | true, false  | true |
|   | DYNATRACE_CONF_FILE | File path for custom tagged entities | example: /tmp/dynatrace/dynatrace.conf.yaml |
|   | DYNATRACE_SLI_FILE | Keptn sli file path within docker | example: /tmp/dynatrace/shipyard.yaml  |  |
|   | JMETER_FILE | Keptn jmeter file path within docker | example: /tmp/myscript.jmx  |  |

*Footnotes:*

(1) Use this command to get your Keptn API URL

```
keptn status
```

(2) Use this command to get your Keptn Token.  If not unix, then refer to [keptn docs](https://keptn.sh/docs/0.7.x/operate/install/#authenticate-keptn-cli).

```
echo "$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)"
```
