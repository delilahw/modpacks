#!/usr/bin/env bash

# cat mods.txt | xargs -d '\n' -t -o  -I{} ../packwiz modrinth install {}

# jq -r '.[].url' mods-cuties.json | grep modr | xargs -d '\n' -t -o  -I{} ../packwiz modrinth install {}
