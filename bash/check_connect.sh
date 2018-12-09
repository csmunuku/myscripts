#!/bin/bash
check()
{
  if [[ $# -eq 3 ]]; then
     program="${1}"
     c_env="${2}"
	 prop_file="${3}"
	 if [[ -f ${3} ]]; then
        c_domain="$(grep $program ${prop_file} | grep $c_env | awk -F, '{print $3}')"
        c_port="$(grep $program ${prop_file} | grep $c_env | awk -F, '{print $4}')"
        if [[ -z $program ]]; then "program name is Empty!.. exiting.."; exit 1; fi
		if [[ -z $c_env ]]; then "c_env name is Empty!.. exiting.."; exit 1; fi
		if [[ -z $c_domain ]]; then "c_domain name is Empty!.. exiting.."; exit 1; fi
		if [[ -z $c_port ]]; then "c_port name is Empty!.. exiting.."; exit 1; fi
		
		nc -w 2 -z $c_domain $c_port 2>&1
        if [ $? -eq 0 ]; then
            echo "SUCCESS: Connected to $c_domain on port $c_port"
        else
            echo "ERROR  : Failed to connect to $c_domain on port $c_port"
        fi
	 else
	    echo "\"${3}\" is NOT a file!"
	 fi
  fi
}

check_nc()
{
  hash nc 2>/dev/null || { echo >&2 "This Script needs NetCat (nc) but it's not installed. So, Aborting."; exit 1; }
}

check_nc
check prog dev prog.properties
check prog qa prog.properties
check prog uat prog.properties
check prog prod prog.properties

# Format of the "prog.properties" properties file is below..
#prog,dev,dev.prog.com,80
#prog,qa,qa.prog.com,80
#prog,uat,uat.prog.com,443
#prog,uat,prod.prog.com,443



