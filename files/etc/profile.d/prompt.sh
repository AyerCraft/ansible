# vi: ft=bash

# Make sure 'checkwinsize' is on
shopt -s checkwinsize

# Make sure $EUID and $UID are set
if [ -x /usr/bin/id ]; then
    if [ -z "$EUID" ]; then
        # ksh workaround
        EUID=`/usr/bin/id -u`
        UID=`/usr/bin/id -ru`
    fi
fi

colordefs() {
	RESET="\[\017\]"
	NC="\[\e[0m\]"

	# Base Color Codes
	_BLACK="30"
	_RED="31"
	_GREEN="32"
	_YELLOW="33"
	_BLUE="34"
	_PURPLE="35"
	_LGRAY="37"
	_CYAN="36"
	_ORANGE="202"

	# Light Color Codes
	_LRED="91"
	_LGREEN="92"
	_LYELLOW="93"
	_LBLUE="94"
	_LPURPLE="95"
	_LCYAN="96"
	_WHITE="97"

	# Base Colors
	BLACK="\[\e[${_BLACK}m\]"
	RED="\[\e[${_RED}m\]"
	GREEN="\[\e[${_GREEN}m\]"
	YELLOW="\[\e[${_YELLOW}m\]"
	BLUE="\[\e[${_BLUE}m\]"
	PURPLE="\[\e[${_PURPLE}m\]"
	CYAN="\[\e[${_CYAN}m\]"
	LGRAY="\[\e[${_LGRAY}m\]"
	WHITE="\[\e[${_WHITE}m\]"
	ORANGE="\[\e[38;5;${_ORANGE}m\]"
	URED="\[\e[38;5;201m\]"

	# Light Colors
	LRED="\[\e[${_LRED}m\]"
	LGREEN="\[\e[${_LGREEN}m\]"
	LYELLOW="\[\e[${_LYELLOW}m\]"
	LBLUE="\[\e[${_LBLUE}m\]"
	LPURPLE="\[\e[${_LPURPLE}m\]"
	LCYAN="\[\e[${_LCYAN}m\]"

	# Bold Colors
	BRED="\[\e[1;${_RED}m\]"
	BGREEN="\[\e[1;${_GREEN}m\]"
	BYELLOW="\[\e[1;${_YELLOW}m\]"
	#BBLUE="\[\e[1;${_BLUE}m\]"
	BBLUE="\[\e[38;5;33m\]"
	BPURPLE="\[\e[1;${_PURPLE}m\]"
	BCYAN="\[\e[1;${_CYAN}m\]"

	# Italic Colors
	IRED="\[\e[3;${_RED}m\]"
	IGREEN="\[\e[3;${_GREEN}m\]"
	IYELLOW="\[\e[3;${_YELLOW}m\]"
	IBLUE="\[\e[3;${_BLUE}m\]"
	IPURPLE="\[\e[3;${_PURPLE}m\]"
	ICYAN="\[\e[3;${_CYAN}m\]"
}

colorprompt() {
	colordefs
	#[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
	#[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="\[\e[35m\](\e[31m\]\D{%T}\e[35m\]) [\u@\h \W]\\$ "
	if [[ ${UID} -eq 0 ]];then
		#[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="${PURPLE}(${ORANGE}\D{%T}${PURPLE}) ${YELLOW}[${BRED}\u${NC}${YELLOW}@${GREEN}\h ${BBLUE}\W${NC}${YELLOW}]${NC}\\$ "
		PS1="${PURPLE}(${ORANGE}\D{%T}${PURPLE}) ${YELLOW}[${BRED}\u${NC}${YELLOW}@${GREEN}\h ${BBLUE}\W${NC}${YELLOW}]${NC}\\$ "
	else
		#[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="${PURPLE}(${ORANGE}\D{%T}${PURPLE}) ${YELLOW}[${URED}\u${NC}${YELLOW}@${GREEN}\h ${BBLUE}\W${NC}${YELLOW}]${NC}\\$ "
		PS1="${PURPLE}(${ORANGE}\D{%T}${PURPLE}) ${YELLOW}[${URED}\u${NC}${YELLOW}@${GREEN}\h ${BBLUE}\W${NC}${YELLOW}]${NC}\\$ "
	fi
}

colorprompt
export PS1
