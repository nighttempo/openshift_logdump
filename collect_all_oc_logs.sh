#!/usr/bin/env bash

function divider(){
  echo "##################"
}

function mainHeader(){
  tput setaf 2
  echo "===> ${1}"
  tput sgr0
}

function header(){
  tput setaf 4
  echo "===> ${1}"
  tput sgr0
}

mainHeader "Using OpenShift project: $(oc projects | grep "*" | awk '{print $2}')"
DATE=$(date | awk '{print $2 $3 $5}' | sed 's/\ /_/g' | sed 's/:/_/g')
COUNTER=1

for POD in $(oc get pods | grep -v "NAME" | awk '{print $1}' | xargs)
do
  PODNAME=$(echo ${POD} | awk "{print $1}")
  FILE=oc_logs_${DATE}

  header "Collecting logs from ${PODNAME}..."
  echo "" >> ${FILE}
  divider >> ${FILE}
  echo "OC LOGDUMP - POD#${COUNTER}: ${PODNAME}" >> ${FILE}
  divider >> ${FILE}
  echo "" >> ${FILE}
  while read -r LINE; do
    echo "${PODNAME} | ${LINE}" >> ${FILE}
  done <<< $(oc logs ${PODNAME} --all-containers "$@")
  ((COUNTER++))
done

[ ! -z ${FILE} ] && mainHeader "All logs saved to \`${FILE}\` (size: $(ls -lh ${FILE} | awk '{print $5}'))"
