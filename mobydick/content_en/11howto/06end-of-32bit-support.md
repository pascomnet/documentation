---
title: 32bit System Support
keywords: 
    - 32bit mobydick phone system
    - 32bit Support
description: End of Life Support for 32bit mobydick phone systems
prev: /howto/service-codes/
url: /howto/end-32bit-support/
linkde: url: /howto/ende-32bit-support/
weight: 126
toc: true
draft: false
---

## Overview

From mobydick version 7.14, 32bit versions are no longer supported. Should you currently operate a 32bit version, you will need to consider the following:

## 32bit Installation on 64bit Hardware/Host

By updating, the phone system will be automatically upgraded to a 64bit system.

## 32bit Installation on 32bit Hardware/Host

When attempting to install a mobydick / pascom phone system from version 7.14 onwards, you will receive an error warning that the update is not possible and the update process will terminate.

### Next Steps?

Should you operate a 32bit appliance, then you will require a new hardware solution. Please contact our sales team for more information (Tel. +44 203 1379-964 /  +49 991 29691-200).

Should your mobydick phone system be installed in a virtual environment with a 32bit host, then the mobydick phone system will need to be migrated to a new 64bit host.

### 64bit System New Install Process

Create a database backup via `Appliance` > `Backup` > `Database Backup`

Download the latest [mobydick Community Version](https://www.pascom.net/de/download/ "pascom / mobydick ISO download") (min. Version 7.14) and install this on your new 64bit compatible hardware / host. Upload and restore your database backup by following these steps: `Appliance` > `Backup` > `Database backup` > `Action` > `Upload and Restore`. 
