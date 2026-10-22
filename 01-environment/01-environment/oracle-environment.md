# Oracle Environment Inventory

## Oracle Software Environment

| Item              | Value                                               |
| ----------------- | --------------------------------------------------- |
| Oracle Database   | Oracle AI Database 26ai Enterprise Edition          |
| Oracle Home       | `/u01/app/oracle/product/26ai/dbhome_1`             |
| Oracle Base       | `/u01/app/oracle`                                   |
| Oracle SID        | `orcl`                                              |
| SQL*Plus Version  | 23.26.1.0.0                                         |
| SQL*Plus Location | `/u01/app/oracle/product/26ai/dbhome_1/bin/sqlplus` |

## Oracle Environment Variables

```bash
ORACLE_SID=orcl
ORACLE_BASE=/u01/app/oracle
ORACLE_HOME=/u01/app/oracle/product/26ai/dbhome_1
```

The Oracle user's `PATH` includes:

```text
$ORACLE_HOME/bin
$ORACLE_HOME/OPatch
```

This allows Oracle utilities such as `sqlplus`, `lsnrctl`, and `opatch` to be executed from the shell.

## Instance

The Oracle instance is:

```text
Instance: orcl
PMON Process: ora_pmon_orcl
Status: Running
```

The PMON process was verified with:

```bash
ps -ef | grep pmon | grep -v grep
```

## Listener

| Item          | Value                                                              |
| ------------- | ------------------------------------------------------------------ |
| Listener      | `listener`                                                         |
| Host          | `oracledb.localdomain`                                             |
| Protocol      | TCP                                                                |
| Port          | `1521`                                                             |
| Status        | Running                                                            |
| Configuration | `/u01/app/oracle/product/26ai/dbhome_1/network/admin/listener.ora` |
| Log           | `/u01/app/oracle/diag/tnslsnr/oracledb/listener/alert/log.xml`     |

The listener has been running since:

```text
28-SEP-2026 12:25:28
```

The listener was verified using:

```bash
lsnrctl status
```

## Registered Services

The listener currently reports services associated with the Oracle CDB and PDB environment, including:

```text
orclpdb1
lab_pdb
hr_root
hr_pdb_a
hr_pdb_c
orclXDB
Orcl
```

The services are primarily registered against the `orcl` instance and report `READY` status.

## Configuration Observation

The listener reports the `Orcl` service with two registered instance entries:

```text
Instance "ORCL", status UNKNOWN
Instance "orcl", status READY
```

This was recorded as an environment observation during the baseline inventory. No configuration changes were made during the inventory process.

## Validation Commands

The following commands were used to validate the Oracle environment:

```bash
echo $ORACLE_SID
echo $ORACLE_BASE
echo $ORACLE_HOME
which sqlplus
sqlplus -v
ps -ef | grep pmon | grep -v grep
lsnrctl status
```

## DBA Notes

* Oracle software is installed under `/u01/app/oracle`.
* The active Oracle instance is `orcl`.
* The Oracle listener is configured on TCP port `1521`.
* PMON confirms that the `orcl` instance is running.
* Multiple PDB services are registered with the listener.
* The listener and database environment will be used for subsequent connectivity, migration, backup/recovery, and high-availability exercises.
