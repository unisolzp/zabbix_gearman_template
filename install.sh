#!/bin/bash

chmod +x get_gearman_jobs get_gearman_queues get_gearman_workers
cp get_gearman_jobs /usr/sbin/get_gearman_jobs
cp get_gearman_queues /usr/sbin/get_gearman_queues
cp get_gearman_workers /usr/sbin/get_gearman_workers
cp get_gearman_names.py /usr/sbin/get_gearman_names.py

zabbix_config_dir=$(cat /etc/zabbix/zabbix_agentd.conf | grep "^Include" | cut -d "=" -f2- | cut -d "*" -f1)
cp gearman.conf $zabbix_config_dir/gearman.conf
service zabbix-agent restart
