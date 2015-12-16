#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/scripts/shared.sh

scm_info="#($CURRENT_DIR/scripts/scm.sh)"
scm_interpolation_string="\#{scm_info}"

do_interpolation() {
  local string="$1"
  local scm_interpolated="${string/$scm_interpolation_string/$scm_info}"
  echo "$scm_interpolated"
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-left"
	update_tmux_option "status-right"
}
main
