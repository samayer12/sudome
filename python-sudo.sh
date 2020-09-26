#!/bin/bash

echo "INFO  - Running $0 from ($(pwd))"

if [ -f "__init__.py" ]; then
  # pytest runs from the `test` directory. Check for module declaration.
  RUNTYPE="Test"
  source  ../venv/bin/activate
elif [ -f "python-sudo.sh" ]; then
  # Live runs execute from project root, which MUST contain `python-sudo.sh`
  RUNTYPE="Live"
  source ./venv/bin/activate
fi

# Confirm that `python` is from the virtual environment
if [[ "$(which python)" = *"/venv/bin/"* ]]; then
  echo "INFO  - Entered venv for $RUNTYPE run. ($(which python))."
  sudo $(which python) "$@" # Run as root
else
  echo "ERROR - Script could not source the virtual environment."
  echo "      - Found ($(which python)) instead."
  exit 1
fi
