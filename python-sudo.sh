#!/bin/bash

if [ -f "__init__.py" ]; then
  # pytest runs from the `test` directory.
  source  ../venv/bin/activate
  echo "INFO - Entered venv for test. ($(which python))"
elif [ -f "python-sudo.sh" ]; then
  # Live runs execute from project root, which MUST contain `python-sudo.sh`
  source ./venv/bin/activate
  echo "INFO - Entered venv for live run. ($(which python))"
else
  # Catch an edge case
  echo "ERROR - Did not enter venv. Check file locations."
  exit 1;
fi

sudo $(which python) "$@"