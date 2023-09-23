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

# Here are the options
# Initialize default values for options
output_dir=""
verbose=false
proxy=""

# Usage function to display how to use the script
usage() {
  echo "Usage: $0 [-o <output_directory>] [-v] [-p <proxy>]"
  echo "Options:"
  echo "  -o <output_directory>    Specify the output directory (required)"
  echo "  -v                      Enable verbose mode"
  echo "  -p <proxy>              Specify a proxy server"
  exit 1
}

# Parse command-line options
while getopts "o:vp:" opt; do
  case "$opt" in
    o)
      output_dir="$OPTARG"
      ;;
    v)
      verbose=true
      ;;
    p)
      proxy="$OPTARG"
      ;;
    \?)
      usage
      ;;
  esac
done

# Check if the output directory is provided and exists
if [ -z "$output_dir" ]; then
  echo "Error: Output directory is required."
  usage
fi

# Create the output directory if it doesn't exist
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi


function check_webserver() {
  domain=$1

  response_code=$(curl -s -o /dev/null -w "%{http_code}" "http://$domain")

  if [ "$response_code" -eq 200 ]; then
    echo "$domain resolves to a web server with status code 200 OK."
  else
    echo "$domain may not resolve to a web server, or the server returned a different status code ($response_code)."
  fi
}


function main() {  # The main function
  echo "Hello World!"
}

main  # Calling main