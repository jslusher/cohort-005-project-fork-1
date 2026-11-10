#!/bin/bash
# A fresh named volume mounted at /workspace/node_modules is owned by root.
# Hand it to the non-root "node" user so npm can install into it.
set -euo pipefail
chown node:node /workspace/node_modules
