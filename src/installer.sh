#!/bin/bash

# #############
# Nice printing
# #############

# Prints ok message
function print_ok (){
	echo -en "[\e[92m*\e[0m] $1"
}

# Prints warn message
function print_warn (){
	echo -en "[\e[93m*\e[0m] $1"
}

# Prints err message
function print_err (){
	echo -en "[\e[91m*\e[0m] $1"
}



function main() {
  print_ok "Installation started\n"
}

main # Calling main
