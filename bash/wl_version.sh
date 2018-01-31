#!/bin/bash
# Find WebLogic Server Version
###################################
# Define current env specific variables for WebLogic

MY_DOMAIN_HOME="${DOMAIN_HOME}"
MY_WL_HOME="${WL_HOME}"
MY_MW_HOME="${MW_HOME}"
MY_ADMIN_SERVER_LOG="$MY_DOMAIN_HOME/servers/AdminServer/admin/AdminServer.log"

if [[ -d ${MY_MW_HOME} && -f ${MY_MW_HOME}/registry.xml ]]; then
   grep "component name=\"WebLogic Server\"" ${MY_MW_HOME}/registry.xml | grep version
fi
if [[ -f ${MY_ADMIN_SERVER_LOG} ]]; then
   grep "WebLogic Server" ${MY_ADMIN_SERVER_LOG} | awk '{print $3}'
fi
if [[ -d ${MY_WL_HOME}/server/lib ]]; then
   cd ${MY_WL_HOME}/server/lib
   command -v java >/dev/null 2>&1 || { echo "java NOT FOUND!!.  Aborting." >&2; exit 1; }
   java -cp weblogic.jar weblogic.version
fi
