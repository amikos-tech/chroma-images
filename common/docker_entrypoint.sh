#!/bin/bash
set -e

export IS_PERSISTENT=1
export CHROMA_SERVER_NOFILE=${CHROMA_SERVER_NOFILE:-65536}
export CHROMA_LOG_LEVEL=${CHROMA_LOG_LEVEL:-DEBUG}
export UVICORN_LOG_LEVEL_UVICORN=${UVICORN_LOG_LEVEL_UVICORN:-INFO}
export ROOT_LOG_LEVEL=${ROOT_LOG_LEVEL:-WARN}


sed -i "s/__CHROMA_LOG_LEVEL__/${CHROMA_LOG_LEVEL}/g" /chroma/log_config.yaml
sed -i "s/__UVICORN_LOG_LEVEL_UVICORN__/${UVICORN_LOG_LEVEL_UVICORN}/g" /chroma/log_config.yaml
sed -i "s/__ROOT_LOG_LEVEL__/${ROOT_LOG_LEVEL}/g" /chroma/log_config.yaml

args="$@"

if [[ $args =~ ^uvicorn.* ]]; then
    echo "Starting server with args: $(eval echo "$args")"
    echo -e "\033[31mWARNING: Please remove 'uvicorn chromadb.app:app' from your command line arguments. This is now handled by the entrypoint script."
    exec $(eval echo "$args")
else
    echo "Starting 'uvicorn chromadb.app:app' with args: $(eval echo "$args")"
    exec uvicorn chromadb.app:app $(eval echo "$args")
fi
