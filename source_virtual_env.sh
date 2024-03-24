#!/bin/bash
set -e

# euiyoung.hwang@US-5CD4021CL1-L MINGW64 ~/Git_Workspace/python-fastapi-basic (master)
# $ source ./source_virtual_env.sh 

export PYTHONDONTWRITEBYTECODE=1

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

VENV=".venv"

# Python 3.11.7 with Window
if [ -d "$VENV/bin" ]; then
    source $SCRIPTDIR/$VENV/bin/activate
else
    source $SCRIPTDIR/$VENV/Scripts/activate
fi
    