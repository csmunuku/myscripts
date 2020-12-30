#!/bin/bash
###################################################################################
# AUTHOR: Chandra Munukutla
# DESC: Given Number of shares, Buying Price per stock and Selling Price per stock,
#       This script calculates the Gain/Loss.
# ASSUMPTIONS: 1. Trading fee is considered to be $0
# USAGE:  ./${0} will give you usage..
###################################################################################

num_regex='^[0-9]+$'
float_regex='^[0-9]+([.][0-9]+)?$'

usage()
{
  echo
  echo "This script \"${0}\" takes three arguments.."
  echo "USAGE: "
  echo "${0} <no_of_shares> <bought_per_stock_price> <sold_per_stock_price>"
  exit 1
}

pre_req_val()
{
  if [[ $# -eq 1 ]]; then
     command -v ${1} &>/dev/null || {
       echo "ERROR: Command \"${1}\" Isn't Installed!!"
       echo "This Command is required for this script to Run!"
       echo "Exiting..!"
       usage
     }
  fi
}

sale_total()
{
  if [[ $# -eq 2 ]]; then
     echo ${1}\*${2} | bc -l
  fi
}

arg_val()
{
  if [[ $# -eq 3 ]]; then
     if [[ ${1} =~ ${num_regex} ]]; then
        shares="${1}"
        if [[ ${2} =~ ${float_regex} ]]; then
           bought_for="${2}"
         if [[ ${3} =~ ${float_regex} ]]; then
              sold_for="${3}"
         else
            echo "ERROR: \"${3}\" needs to be a Number - either an Integer OR a Float"
            usage
         fi
        else
         echo "ERROR: \"${2}\" needs to be a Number - either an Integer OR a Float"
         usage
        fi
     else
        echo "ERROR: \"${1}\" needs to be a Number"
        usage
     fi
  else
     usage
  fi
}

main()
{
  bought_price=$(sale_total ${shares} ${bought_for})
  sold_price=$(sale_total ${shares} ${sold_for})
  echo -e "Bought $shares stocks for \$$bought_for \t- by spending = \$$bought_price"
  echo -e "Sold   $shares stocks for \$$sold_for \t- sale price  = \$$sold_price"
  echo
  val=$(echo ${bought_price}\<${sold_price}|bc -l)
  if [[ $val -eq 0 ]]; then
     echo "LOSS = \$ $(echo "$sold_price - $bought_price" | bc -l)"
  else
     echo "GAIN = \$ $(echo "$sold_price - $bought_price" | bc -l)"
  fi
}
#####################
pre_req_val "bc"
arg_val $*
main
