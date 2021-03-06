#!/usr/bin/env bash

source common.sh || source scripts/common.sh || echo "No common.sh script found..."

PROFILE="${PROFILE:-finchley}"
BOM_VERSION="${BOM_VERSION:-Finchley.BUILD-SNAPSHOT}"
ADDITIONAL_MAVEN_OPTS="${ADDITIONAL_MAVEN_OPTS:--Dspring-cloud.version=$BOM_VERSION -Dspring.cloud.release.version=$BOM_VERSION}"

set -o errexit
set -o errtrace
set -o pipefail

cd $ROOT_FOLDER

echo -e "\nRunning the build with additional options [$ADDITIONAL_MAVEN_OPTS] and profile [$PROFILE]"

# Packages all apps in parallel using 6 cores
./mvnw clean package $ADDITIONAL_MAVEN_OPTS -P$PROFILE -U --batch-mode -Dmaven.test.redirectTestOutputToFile=true
