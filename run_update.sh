#!/usr/bin/env bash
docker run -v "$(pwd)"/visuals:/data/visuals \
  jhu-process-data
