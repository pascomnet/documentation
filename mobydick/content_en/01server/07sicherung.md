---
title: Backup and Restore
url: /server/backups/
prev:  /server/services/
next: /server/update/
weight: 17
toc: true
keywords:
    - Create Backups
    - Full System Backups
    - Database Backups
    - System Restore
description: How to create and restore mobydick phone system backups
lang: en
linkde: /server/sicherung/
---




## Concept

//FixMe

mobydick can perform a full system backup while the system is running. Mobydick first creates a snapshot of the file system and then uses it to create a bootable ISO file.

![Illustration - mobydick Backup](../../images/backup_iso.png "ISO Backup mobydick")

This file can then be copied to another system either automatically or manually. If a system needs to be restored in case of disaster, the ISO can be burned onto a CD/DVD or saved onto a USB stick, which can be booted. Alternatively, the ISO can directly be mounted and booted in a virtual machine. The backup allows the user to either use a live disc or to recover a system by copying it to the hard disk.
The most recently created ISO will always remain available on the mobydick system. The boot menu allows you to start from the normal hard disk as well as directly from the backup ISO image, which can be used to as a restore. This can be useful if, for example, all user accounts were accidentally deleted and a working system is needed again.

### Database Backups
In addition, mobydick can also periodically perform a database backup allowing you to maintain multiple generations of backups of your local storage disks. This backup can be used for restore purposes directly via mobydick Web UI as well as being downloaded and later imported into a different (or the same) Appliance.

Database backups will be automatically deleted should the predefined number of generations, per default 100, is reached. However, you can create any number of specifically named backups and therefore create a permanent backup history. 

## Configuration

### Full System Backups

#### Manually creating a backup
To create a backup using the web interface, select ***Appliance > Backup > Entire system***:

![Screenshot - mobydick Backup in Detail](../../images/backup_system_entire.png?width=90% "Manual Backup in detail")

To avoid an overly large ISO file, individual components can be excluded from the backup:

|Parameter|Description|
|---------|---------|
|exclude voicemail| All voice messages stored on the system will not be saved. In most cases, voice messages are sent via e-mail anyway and only a copy remains on the system.|
|exclude records| All records, whether created manually or automatically, will not be saved.|
|exclude received faxes| All fax messages stored on the system will not be saved. In most cases, faxes are sent via e-mail anyway and only a copy remains on the system.|
|exclude log files| All log files produced by mobydick will not be saved. This can also apply to log files that are needed for historical analysis. This selection does not apply to journal entries and chat archives..|

Now select **Start backup**. mobydick will create a task and execute it. When the task is completed successfully, the backup ISO can be found in the file **/BACKUP/appliance.iso**.

#### Automating the backup process
You can setup mobydick so that the system automatically creates periodic backups. Prepare the backup using the same steps as if manually **creating a backup** and then press **Automate**:
![Screenshot - Cronjobs](../../images/backup_cronjob.png?width=90% "automation with cronjobs")

The system will suggest both a suitable **title** as well as recommended **parameters**. In addition, the following settings can be adjusted (following the crontab logic)::

|Parameter|Description|
|---------|---------|
|Weekday|  The weekday when the job should be executed. Accepted values are ***1-7*** where 1 means Monday and 7 means Sunday. * means every day.|
|Month| The month when the job should be executed. Accepted values are ***1-12*** (January - December). * means every month.  |
|Day| The day when the job should be executed. Accepted values are ***1-31.*** * means every day of the month.  |
|Hour| The hour when the job should be executed. Accepted values are ***0-23.*** * means every hour.  |
|Minute| The minute when the job should be executed. Accepted values are ***0-59.*** * means every minute.  |

The **Proposals** button gives some examples that could be used.

|Parameter|Description|
|---------|---------|
|Script before| This command will be executed before the backup. Bash Syntax.|
|Script after| This command will be executed after the backup. Bash Syntax. Useful if the backup should be copied to an FTP server.|

#### Retrieving a backup from the server
The most recently created backup is stored in /BACKUP/appliance.iso on the mobydick Server.

If the system you want to copy the backup to, has the **scp** command, you can use the following command

    scp admin@IP_DER_mobydick:/BACKUP/appliance.iso .

to copy the backup into the folder you executed the scp command from. The **system password** (default: mobydick) will be required.

On Windows systems, WinSCP can be used as an alternative. Log on as **admin** and enter the **system password** (default: mobydick)  chosen during setup.

#### Restoring a backup
Copy the ISO file onto a CD / DVD or mount it as a boot drive in a virtual machine. After booting you will be asked whether you want to restore the system on the **hard disk** or boot using **LiveDisk** mode.

### Database Backups
#### Manually Create a Database Backup

In order to create a database backup, go to the mobydick Commander (web UI) and select the following menu options:
***Appliance > Backup > Database Backup***.

Click on the //FixMe to create a new database backup.

There, you have the option of including additional file data from recordings, faxes and voicemails.

{{% notice note  %}}
From mobydick version 7.12 onwards, customised prompts and music on hold are automatically included in database backups as standard.
{{% /notice %}}

Should you wish to store this database backup long-term, then you can enter a specific name for the backup (optional). 

Click on **perform action**  and mobydick will immediately start creating the database backup.
As soon as the **create database** backup job has been successfully completed, then a new entry in the backup list will appear.

#### Automated Database Backups
For automated database backups, a predefined backup was set up during the mobydick system installation and is performed daily at 23.47 per cronjob. Should you wish to modify these timings, your can do so under **Appliance > Crobjobs**.

#### Changing the number of Backup Generations
Using the mobydick commander search box, search for the term maxbackups. This will take you the system settings and will enable you to automatically edits the sys.mdc.backup.db.maxgenerations setting. Per default the maximum value is set to 100, but this can be altered by double clicking on the number 100 in the value column and entering a new maximum. 
By the next database backup, the new max. number of backups will be taken into account.

#### Renaming Database Backups
Should you have an automatically generated backup that you wish to keep for a longer period of time, then you can rename this backup at any time. To do so, go to ***Appliance > Backups > Database Backups*** and select the desired backup and press the **Rename** button.
 
#### Downloading Database Backups
From within the Database Backups list, it is possible to download any backup using the **download link**. Additionally, it is also possible to download backups using the ssh protocol as described above by full system backups. The backup archive is stored in the /BACKUP/ directory.

#### Restoring Backups
To restore a backup, simply go to the backups list, select the desired backup and via the Action > Restore function, the backup restore mask will be opened:

In order to actually restore this backup, then the ***Really restore database backup?*** check box will need to be ticked. To start the restore process, simply click on the **Restore** button. mobydick will now create a job and will log you out of the web UI after a second or two, however you will be able to immediately log back in and the restore process will have completed. As standard, the actual system stand is backed up before the restore process.

#### Importing & Restoring from a Downloaded Backup Files 

A previously downloaded database backup file can be imported into the same or a new mobydick Appliance. Should the
mobydick version between the source and destination systems differ, an automatic migrations process will start when the
destination system is a newer mobydick version. Importing into an older mobydick version is not possible.

If you would like to restore mobydick from a downloaded backup file, simply go to the ***Appliance > Import`*** menu and select Restore Database.

Select your desired database backup and press Upload. 
