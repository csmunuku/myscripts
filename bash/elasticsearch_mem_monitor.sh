#!/bin/bash
# AUTHOR: Chandra Munukutla
# DESC: Monitor ElasticSearch Memory and send Alert email when Mem usage >= 85(warn) > 95(restart)
# jq is a pre-req for this script

es_nodes="mynode1 mynode2 mynode3"
MAIL_FROM="from_email@test.com"
MAIL_TO="to_email@test.com"
WARN_PERCENT=85
RESTART_PERCENT=95

jq_check()
{
  command -v jq &>/dev/null || {
    echo "ERROR: \"jq\" NOT FOUND! - this script will not work"
	echo "Try installing \"jq\" using below command.."
	echo "sudo yum install -y jq"
	exit 1
  }
}
jq_check

for es_node in ${es_nodes}
do
  node_name="${es_node}"
  heap_used_percent=$(curl -s http://${es_node}:9200/_nodes/${node_name}/stats/jvm | jq '.nodes[].jvm.mem.heap_used_percent')

  if [[ $heap_used_percent -ge ${RESTART_PERCENT} ]]; then
     ALERT_MSG="ALERT: Please RESTART ElasticSearch OOM -- on Node - \"${es_node}\" - HEAP used is ${heap_used_percent}%"
     echo -e "${ALERT_MSG}" | mailx -s "${ALERT_MSG}" -r $MAIL_FROM $MAIL_TO
  elif [[ $heap_used_percent -ge ${WARN_PERCENT} ]]; then
     ALERT_MSG="ALERT: ElasticSearch on Node - \"${es_node}\" - HEAP used is ${heap_used_percent}%"
     echo -e "${ALERT_MSG}" | mailx -s "${ALERT_MSG}" -r $MAIL_FROM $MAIL_TO
     # commenting out restart command.
     # /etc/init.d/elasticsearch restart
  else
     echo "ElasticSearch on Node - \"${es_node}\" - HEAP % used is ${heap_used_percent}%"
  fi
done
