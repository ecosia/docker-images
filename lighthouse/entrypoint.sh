#!/bin/sh
set -e

lighthouse-ci \
    --chrome-flags='--headless --no-sandbox --disable-gpu' \
    --output json --quiet \
    --config-path=./.lighthouse.config.json \
    $@

