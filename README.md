# OpenShift logdump

Simple bash script that collects all logs from every pod running in the current OpenShift project.
The merged logs are stored in one file and are prepended by the name of the pod they are from, which should allow for easier debugging of environments with no log aggregation enabled.

