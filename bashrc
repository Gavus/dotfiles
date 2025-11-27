# shellcheck disable=1091,1090

# Source global definitions.
if [[ -f "/etc/bashrc" ]]; then
  source "/etc/bashrc"
fi

if [[ -n "$PS1" ]]; then
  mapfile -t sourcefiles < <(find ~/.bashrc.d/ -not -type d -exec realpath {} \;)
  for rc in "${sourcefiles[@]}"; do
    source "$rc"
  done
  unset rc
fi
