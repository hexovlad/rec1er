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
targets_file=""

# Usage function to display how to use the script
usage() {
  echo "Usage: $0 [-o <output_directory>] [-v] [-p <proxy>] [-t <targets_file>]"
  echo "Options:"
  echo "  -o <output_directory>    Specify the output directory (required)"
  echo "  -v                      Enable verbose mode"
  echo "  -p <proxy>              Specify a proxy server"
  echo "  -t <targets_file>       Specify a file with a list of targets (one per line)"
  exit 1
}

# Parse command-line options
while getopts "o:vp:t:" opt; do
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
    t)
      targets_file="$OPTARG"
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

# Check if the targets file is provided and exists
if [ -z "$targets_file" ]; then
  echo "Error: Targets file is required."
  usage
fi

if [ ! -f "$targets_file" ]; then
  echo "Error: Targets file '$targets_file' not found."
  usage
fi


# Website taking screenshot section

function check_webserver() {  # Checks if a webserver is reachable
  domain=$1

  response_code=$(curl -s -o /dev/null -w "%{http_code}" "http://$domain")

  if [ "$response_code" -eq 200 ]; then
    echo "$domain resolves to a web server with status code 200 OK."
  else
    echo "$domain may not resolve to a web server, or the server returned a different status code ($response_code)."
  fi
}

function take_screenshot() {  # Takes a screenshot of a website
  domain=$1

  google-chrome --headless --disable-gpu --screenshot --window-size=1280,1696 --default-background-color=0 domain
  mv screenshot.png "$output_dir/$domain.png"
}


function main() {  # The main function
  echo "Hello World!"
}

main  # Calling main