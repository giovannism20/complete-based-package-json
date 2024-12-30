#!/bin/bash

_npm_run_autocomplete() {
  local package_json="package.json"

  if [ ! -f "$package_json" ]; then
    return 1
  fi

  local scripts
  scripts=$(jq -r '.scripts | keys | .[]' "$package_json")

  COMPREPLY=($(compgen -W "$scripts" -- "${COMP_WORDS[COMP_CWORD]}"))
}

complete -F _npm_run_autocomplete npm run
