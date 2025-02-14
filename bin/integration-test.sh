#!/usr/bin/env bash

set -e

function cleanup {
  docker stop chroma-server || true
}

trap cleanup EXIT

docker run -d --rm --name chroma-server -e ALLOW_RESET=true -p ${CHROMA_PORT}:8000 ${FIRST_TAG}

export CHROMA_INTEGRATION_TEST_ONLY=1
export CHROMA_API_IMPL=chromadb.api.fastapi.FastAPI
export CHROMA_SERVER_HOST=localhost
export CHROMA_SERVER_HTTP_PORT=${CHROMA_PORT}

echo testing: python -m pytest "$@"
cd chroma
python -m pytest "$@"

docker stop chroma-server || true