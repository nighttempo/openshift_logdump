# OpenShift logdump

Simple bash script that collects all logs from every pod running in the current OpenShift project.
The merged logs are stored in a single file and are prepended by the name of the pod they are from, which should allow for easier debugging of environments with no log aggregation enabled.

## Usage

`collect_all_oc_logs.sh [OC LOGS ARGS]`
eg.
`collect_all_oc_logs.sh --timestamps=true`

## Requires

Tested on OpenShift CLI v3.11.0+0cbc58b (download releases [here](https://github.com/openshift/origin/releases))
