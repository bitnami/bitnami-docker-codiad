#!/bin/bash
set -e

function initialize {
    # Package can be "installed" or "unpacked"
    status=`nami inspect $1`
    if [[ "$status" == *'"lifecycle": "unpacked"'* ]]; then
        # Clean up inputs
        inputs=""
        if [[ -f /$1-inputs.json ]]; then
            inputs=--inputs-file=/$1-inputs.json
        fi
        nami initialize $1 $inputs
    fi
}

# Set default values
export APACHE_HTTP_PORT=${APACHE_HTTP_PORT:-"80"}
export APACHE_HTTPS_PORT=${APACHE_HTTPS_PORT:-"443"}
export CODIAD_USERNAME=${CODIAD_USERNAME:-"user"}
export CODIAD_PASSWORD=${CODIAD_PASSWORD:-"bitnami"}
export CODIAD_PROJECT_NAME=${CODIAD_PROJECT_NAME:-"Sample Project"}
export CODIAD_PROJECT_PATH=${CODIAD_PROJECT_PATH:-"sampleProject"}
export CODIAD_THEME=${CODIAD_THEME:-"default"}
export CODIAD_HOST=${CODIAD_HOST:-"127.0.0.1"}



if [[ "$1" == "nami" && "$2" == "start" ]] ||  [[ "$1" == "/init.sh" ]]; then
   for module in apache codiad; do
    initialize $module
   done
   echo "Starting application ..."
fi

exec /entrypoint.sh "$@"
