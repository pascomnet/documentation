---
title: Monitoring via Nagios or Icinga
description: Monitor a pascom server via Nagios or Icinga
weight: 10
---

{{< doctype "self" >}}

{{< description >}}

## General
The pascom server includes a service called prometheus. It collects all the metrics of the system. These include, among other things, the utilisation of CPU, RAM and HDD. By means of a plugin, these values can be queried externally.

{{% notice info %}}
The Icinga oder Nagios server needs access to the pascom management port (8443).
{{% /notice %}}

## Prometheus Nagios Plugin
To query the metrics a plugin is needed. This can be integrated via a check command.

https://github.com/prometheus/nagios_plugins

## Examples

**Check if CSD service is running**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'up{job="csd"}'  -n "Running CSD Service" -w 0 -c 0 -C "-k" -t vector -m eq

**Check if database service is running**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'container_up{name="pg"}'  -n "Container PG up" -w 0 -c 0 -C "-k" -t vector -m eq

**RAM usage (Critical < 90%, Warning < 75%)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q '100-(node_memory_MemAvailable/node_memory_MemTotal*100)'  -n "Memory used in %" -w 75 -c 90 -C "-k" -t vector

**Usage of the SYSTEM Disk (Critical < 3GB, Warning < 8GB)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_filesystem_free{mountpoint="/SYSTEM"}/1024/1024/1024'  -n "Number of free diskspace in GB" -w 8000 -c 3000 -C "-k" -t vector -m lt

**Usage of the RAM Disk (Critical < 400MB, Warning < 200MB)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_filesystem_free{mountpoint="/"}/1024/1024'  -n "Number of free diskspace in MB" -w 8000 -c 3000 -C "-k" -t vector -m lt

**CPU utilisation (load1)  (Critical < 10, Warning < 5. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load1*10'  -n "Load average 1m" -w 50 -c 100 -C "-k" -t vector

**CPU utilisation (load5) (Critical < 6, Warning < 4. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load5*10'  -n "Load average 5m" -w 40 -c 60 -C "-k" -t vector

**CPU utilisation (load15) (Critical < 4, Warning < 3. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load15*10'  -n "Load average 15m" -w 30 -c 40 -C "-k" -t vector
