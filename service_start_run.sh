#!/bin/bash
set -e

source read_config.sh
# --
# Call this function from './read_config.yaml.sh' to get ES_HOST value in config.yaml file
get_value_from_yaml
# --

export PYTHONDONTWRITEBYTECODE=1

# cd /Users/euiyoung.hwang/ES/Python_Workspace/python-django
SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTDIR

VENV=".venv"

# Python 3.11.7 with Window
if [ -d "$VENV/bin" ]; then
    source $VENV/bin/activate
else
    source $VENV/Scripts/activate
fi

# --
# Waiting for ES
./wait_for_es.sh $ES_HOST

uvicorn main:app --reload --host=0.0.0.0 --port=5555 --workers 4