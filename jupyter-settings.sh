#!/bin/bash

jupyter lab path | sed -n 's/Application directory:\s*\(.*\)/mkdir -p \1\/settings/p' | sh

jupyter lab path | sed -n 's/Application directory:\s*\(.*\)/cp overrides.json \1\/settings/p' | sh
