set -e

# Activate virtualenv && run serivce
SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source $SCRIPTDIR/.venv/bin/activate

# py.test -v tests
# py.test -v ./tests --cov-report term-missing --cov
poetry run py.test -sv ./tests --disable-warnings