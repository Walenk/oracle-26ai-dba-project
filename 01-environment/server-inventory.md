# Server Inventory

## Server Identity

| Item             | Value                              |
| ---------------- | ---------------------------------- |
| Hostname         | `oracledb.localdomain`             |
| IPv4 Address     | `10.0.0.123`                       |
| Operating System | Oracle Linux Server 9.8            |
| Kernel           | `6.12.0-206.104.3.3.el9uek.x86_64` |
| Virtualization   | KVM                                |

## Hardware

| Resource     | Value                               |
| ------------ | ----------------------------------- |
| CPU          | 6 vCPU                              |
| CPU Model    | 13th Gen Intel(R) Core(TM) i7-1355U |
| Architecture | x86_64                              |
| Memory       | 9.3 GiB                             |
| Swap         | 9 GiB                               |

## Storage

| Device / Mount |   Size |        Usage | Filesystem |
| -------------- | -----: | -----------: | ---------- |
| `/`            |  30 GB |          47% | XFS        |
| `/boot`        | 960 MB |          72% | XFS        |
| `/u01`         |  55 GB |          13% | XFS        |
| `/u02`         |  50 GB |          78% | XFS        |
| `/backup`      |  49 GB |           1% | XFS        |
| `/tmp`         |   5 GB |           2% | XFS        |
| Swap           |  9 GiB | 3.4 GiB used | Swap       |

### Disk Layout

The server has a 200 GB virtual disk:

```text
/dev/sda
├── /dev/sda1    1 GB     /boot
└── /dev/sda2    199 GB   LVM
    ├── ol-root      30 GB    /
    ├── ol-swap      10 GB    swap
    ├── ol-backup    49 GB    /backup
    ├── ol-u01       55 GB    /u01
    ├── ol-u02       50 GB    /u02
    └── ol-tmp        5 GB    /tmp
```

## Oracle Environment

| Variable      | Value                                   |
| ------------- | --------------------------------------- |
| `ORACLE_SID`  | `orcl`                                  |
| `ORACLE_BASE` | `/u01/app/oracle`                       |
| `ORACLE_HOME` | `/u01/app/oracle/product/26ai/dbhome_1` |

## Database

| Item            | Value                                      |
| --------------- | ------------------------------------------ |
| Database        | `ORCL`                                     |
| Database Type   | CDB                                        |
| Open Mode       | READ WRITE                                 |
| Instance        | `orcl`                                     |
| Instance Status | OPEN                                       |
| Oracle Database | Oracle AI Database 26ai Enterprise Edition |

## Container Inventory

| CON_ID | Container          | Open Mode  |
| -----: | ------------------ | ---------- |
|      1 | `CDB$ROOT`         | READ WRITE |
|      2 | `PDB$SEED`         | READ ONLY  |
|      3 | `ORCLPDB1`         | READ WRITE |
|      4 | `LAB_PDB`          | READ WRITE |
|      5 | `HR_ROOT`          | READ WRITE |
|      6 | `HR_PDB_A`         | READ WRITE |
|      7 | `HR_PDB_C`         | MOUNTED    |
|      8 | `F2076572923_21_1` | READ WRITE |

## Current Connection

The initial database inventory was performed from:

```text
CDB$ROOT
```

using:

```bash
sqlplus / as sysdba
```

## Baseline Observations

* The database is a multitenant CDB.
* The CDB is currently `READ WRITE`.
* Six PDB-related containers are present in addition to `CDB$ROOT` and `PDB$SEED`.
* `HR_PDB_C` is currently `MOUNTED` rather than open.
* `/u02` is currently at 78% utilization and should be monitored as database storage usage increases.
* `/boot` is at 72% utilization and should also be monitored.
* Oracle software is installed under `/u01/app/oracle`.
* Database storage is primarily associated with `/u02`.
