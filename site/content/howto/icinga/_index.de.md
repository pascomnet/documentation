---
title: Überwachung mit Nagios oder Icinga
description: Überwachung eines pascom Servers mit Hilfe von Nagios oder Icinga
weight: 10
---

{{< doctype "self" >}}

{{< description >}}

## Funktionsweise
Auf jedem pascom Server ist ein Dienst names prometheus installiert. Dieser sammelt alle Metriken des Systems. Hierzu zählen unter anderem die Auslastung von CPU, RAM und HDD. Mittels eines Plugins können diese Werte von extern abgefragt werden.

{{% notice info %}}
Der Icinga oder Nagios Server benötigt Zugriff auf den Management Port (8443) der Anlage.
{{% /notice %}}

## Prometheus Nagios Plugin
Damit die Metriken abfragt werden können wird ein Plugin benötigt. Dieses kann über ein check command integriert werden.

https://github.com/prometheus/nagios_plugins

## Beispiele

**Überprüfen ob der CSD Dienst läuft**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'up{job="csd"}'  -n "Running CSD Service" -w 0 -c 0 -C "-k" -t vector -m eq

**Überprüfen ob der Datenbank Dienst läuft**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'container_up{name="pg"}'  -n "Container PG up" -w 0 -c 0 -C "-k" -t vector -m eq

**RAM Auslastung (Critical < 90%, Warning < 75%)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q '100-(node_memory_MemAvailable/node_memory_MemTotal*100)'  -n "Memory used in %" -w 75 -c 90 -C "-k" -t vector

**Auslastung der SYSTEM Disk (Critical < 3GB, Warning < 8GB)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_filesystem_free{mountpoint="/SYSTEM"}/1024/1024/1024'  -n "Number of free diskspace in GB" -w 8000 -c 3000 -C "-k" -t vector -m lt

**Auslastung der RAM Disk (Critical < 400MB, Warning < 200MB)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_filesystem_free{mountpoint="/"}/1024/1024'  -n "Number of free diskspace in MB" -w 8000 -c 3000 -C "-k" -t vector -m lt

**Aulsatung der CPU (load1)  (Critical < 10, Warning < 5. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load1*10'  -n "Load average 1m" -w 50 -c 100 -C "-k" -t vector

**Aulsatung der CPU (load5) (Critical < 6, Warning < 4. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load5*10'  -n "Load average 5m" -w 40 -c 60 -C "-k" -t vector

**Aulsatung der CPU (load15) (Critical < 4, Warning < 3. Values are multiplied by 10)**

    ./check_prometheus_metric.sh -H 'https://_PASCOM-IP_:8443/prometheus' -q 'node_load15*10'  -n "Load average 15m" -w 30 -c 40 -C "-k" -t vector
