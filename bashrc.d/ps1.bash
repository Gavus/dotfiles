# shellcheck disable=2016,1091

PROMPT_COMMAND=_prompt_command # Function to generate PS1 after CMDs.

function _ps1_color() {
    local bold=""
    local color=""

    color_code="$1"
    bold="$(tput bold)"
    color="$(tput setaf "$color_code")"
    echo "${bold}${color}"
}

PS1_RED="$(_ps1_color 1)"
PS1_GREEN="$(_ps1_color 2)"
PS1_YELLOW="$(_ps1_color 3)"
PS1_BLUE="$(_ps1_color 4)"
PS1_PURPLE="$(_ps1_color 5)"
PS1_CYAN="$(_ps1_color 6)"
PS1_STOP_COLOR="$(tput sgr0)"
PS1_CONTAINER=""
PS1_USER="\u"
PS1_DISTRO=""
PS1_CONTAINER_ID=""
PS1_HOSTNAME="\h"
PS1_BRANCH=""
PS1_WORKDIR=" \w"
PS1_MACHINE=""
PS1_NEWLINE="\n➤ "

if [[ -f "/run/.containerenv" || -f "/.dockerenv" ]]; then
    PS1_CONTAINER="🐋 "
    PS1_CONTAINER_ID=" ${CONTAINER_ID}"
fi

if [[ -f "/etc/os-release" ]]; then
    source /etc/os-release
    PS1_DISTRO=" ${ID}-${VERSION_ID}"
fi

if [[ -f "$HOME/.bashrc.d/git-prompt.bash" ]]; then
    source "$HOME/.bashrc.d/git-prompt.bash"
    PS1_BRANCH='$(__git_ps1 "  %s ")'
fi

function _prompt_command() {
    local _exit="$?"

    if [[ ! -z "$MACHINE" ]]; then
        PS1_MACHINE=" $MACHINE"
    fi

    PS1="${PS1_CONTAINER}\
${PS1_PURPLE}${PS1_USER}@${PS1_HOSTNAME}\
${PS1_BLUE}${PS1_CONTAINER_ID}${PS1_CYAN}${PS1_DISTRO}\
${PS1_RED}${PS1_MACHINE}${PS1_GREEN}${PS1_WORKDIR}\
${PS1_YELLOW}${PS1_BRANCH}${PS1_RED}${_exit}\
${PS1_STOP_COLOR}${PS1_NEWLINE}"
}
