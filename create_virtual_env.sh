#!/bin/bash
set -e

export PYTHONDONTWRITEBYTECODE=1

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

VENV=".venv"

function activate_virtual_env() {
    # Create virtualenv
    python -m venv $SCRIPTDIR/$VENV
    
    # Python 3.11.7 with Window
    source $SCRIPTDIR/$VENV/Scripts/activate
    # source $SCRIPTDIR/$VENV/bin/activate
    echo "Created virtual enviroment >>" + $SCRIPTDIR/$VENV/bin/activate
    
    echo "Create Poetry Environment"
    # Python 3.11.7 with Window
    pip install poetry
    poetry install
    echo "Finish Poetry Environment Completely.."
}

if [ -d $SCRIPTDIR/$VENV ]; then
  echo "VirtualEnv exists."
  rm -rf $SCRIPTDIR/$VENV
fi

activate_virtual_env
