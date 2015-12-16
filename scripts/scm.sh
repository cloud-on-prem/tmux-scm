#!/usr/bin/env bash

main(){
  tmux show-option -gqv "@scm_info"
}
main
