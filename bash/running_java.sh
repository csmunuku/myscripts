#!/bin/bash
ps -ef | grep java | awk '{print $8}'
