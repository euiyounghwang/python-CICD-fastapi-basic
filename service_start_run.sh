#!/bin/bash
set -e

# Activate virtualenv && run serivce

# cd /Users/euiyoung.hwang/ES/Python_Workspace/python-django
SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTDIR
source .venv/bin/activate

uvicorn main:app --reload --host=0.0.0.0 --port=5555 --workers 4