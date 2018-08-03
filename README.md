backup.sh
=================

USAGE
-----------------

    ./backup.sh DB_NAME[ TAG]

### DB_NAME:
name of mysql database to backup

### TAG:
label to describe backup (used in backup filename,
so use hyphens rather than spaces).
Makes finding a particular backup easier via restore.sh
If not specified, default value is "last"

PURPOSE
-----------------

Creates a backup of the specified database for restore at a later
time.



restore.sh
=================

USAGE
-----------------

    ./restore.sh DB_NAME[ TAG]

### DB_NAME:
name of mysql database to restore

### TAG:
label to narrow selection of backup to restore.
If not specified, selection is not restricted.

PURPOSE
-----------------

Restores latest backup matching the selection criteria provided,
by DB NAME and the optional TAG argument.


Example use case
=================

Zboot into an older version, e.g. Calgary.  Database name is "calgary".

Create a backup of the zboot, after shutting down instance:

	./backup.sh calgary fresh-zboot

This creates a backup file in the snapshots/ dir:

	29M Feb 11 13:59 calgary.140211.1358.fresh-zboot.sql.gz

Install various plugins and otherwise prepare instance for investigative task.

Create a backup of the current state:

	./backup.sh calgary test-prep

Current backup list includes:

	30M Feb 11 14:08 calgary.140211.1408.test-prep.sql.gz
	29M Feb 11 13:59 calgary.140211.1358.fresh-zboot.sql.gz

Conduct testing, which creates many configuration changes and record updates across a variety of tables.

Decide to repeat the steps, from a clean slate.  Execute restore:

	./restore.sh calgary test-prep

Repeat test activities.
