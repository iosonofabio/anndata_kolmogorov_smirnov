#!/bin/bash
# Wheels are already tested in docker image
if [ $DOCKER_IMAGE ]; then
  docker run --rm -v $(pwd):/io $DOCKER_IMAGE /io/testwheels.sh
  exit $?
fi

if [ "$TRAVIS_OS_NAME" == 'osx' ]; then
  export PATH="$HOME/miniconda/bin:$PATH"
  source $HOME/miniconda/bin/activate
  conda activate travis
  PYTHON=$(which python)
  PYTEST=$(which pytest)
else
  PYTHON=${PYTHON:-python}
  PYTEST=${PYTEST:-"pytest"}
fi

echo "python: ${PYTHON}"

echo 'Running tests...'

# LOCAL TESTING:
# PYTHONPATH=$(pwd)/build/lib:PYTHONPATH pytest -rxXs test

${PYTEST} "test"

echo 'done!'

