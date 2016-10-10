
---
title: Task Automation
url: /server/automatation/
prev: /server/update-and monitoring/
weight: 18
toc: true
linkde: /server/automasierung/
keywords:
    - Automating tasks
    - Cron Job Automation
    - Database Backup automation
description: Automate phone system tasks (cron jobs) to reduce administrative hassle
lang: en
---

## Overview
A few administrative tasks must be undertaken and completed on a regular basis. A classic example of this is Data backup, recovery and resetting.
By using Cronjobs, you can setup schedules for individual tasks, which are then regularly executed through the use of Daemons.
Your telephone uses the Cron service from Debian Linux Distribution as the scheduler from time plans.  However, you do not need to manually edit the Cron files as you can use the System's Web User Interface to manage them. The central hub then forms the list of Cronjobs. The Time plans which have been added, will then, through the application of the Cron Jobs, be synchronised and immediately activated. 

## Creation of Jobs
You cannot create any number of jobs, rather you are restricted to a reasonable selection of jobs. In order to setup a new time plan, select the desired function in the menu (e.g. ***Appliance > Backups > Database Backups > Creation > Automation***). The next step is to configure the necessary parameters and then lastly click on the automate button in the Toolbar. The system is now linked into the Cron jobs editing tool and you can enter descriptions for the time plans as well as the parameters. 

## Job Parameters
A few jobs require corresponding parameters in order to be executed. To do this first use the original start screen of the corresponding job, as the parameters are already pre-populated. 
For all jobs with work with files, which you would normally upload in your browser, it is necessary to define a path within the parameters. With newly created job, a sample path is provided as a help tool, in order to highlight the correct spot within the parameter string.
.

{{% notice info %}}
If you would like to automate a data import, you must ensure that data to be imported must be stored on the Telephone System Server during the scheduled time frame.
{{% /notice %}}


To this end, we recommend such as scp or a ftp client. As an alternative you can also use a Pre-Script:


## Pre-/Post-script
The before/after fields are used for example to copy files to and from the system via smbclient/scp etc. An exit value not equal to 0 in your script will cause the job to appear as failed, as this causes a premature break in the Pre-script. The Post-script will notice the first call up argument of the job status, whereby the following applies: 1 = Job Successful, 0 = *Job ended with errors*.
