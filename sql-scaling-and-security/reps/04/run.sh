#!/bin/sh
set -eu
docker compose -f ../../compose.yaml exec -T app python /work/reps/04/app.py
