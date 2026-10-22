# Network Inventory

## Server Network Identity

| Item              | Value                  |
| ----------------- | ---------------------- |
| Hostname          | `oracledb.localdomain` |
| IPv4 Address      | `10.0.0.123`           |
| Network Interface | `enp0s3`               |
| Network           | `10.0.0.0/24`          |
| Loopback          | `127.0.0.1`            |

## Oracle Listener

| Item     | Value                  |
| -------- | ---------------------- |
| Listener | `listener`             |
| Protocol | TCP                    |
| Port     | `1521`                 |
| Host     | `oracledb.localdomain` |
| IP       | `10.0.0.123`           |
| Status   | LISTENING              |

The listener was verified at the Linux network layer using:

```bash
ss -lntp | grep 1521
```

Result:

```text
LISTEN ... *:1521 ... tnslsnr
```

## Local Connectivity

### Localhost

The following test was successful:

```bash
tnsping localhost
```

Oracle resolved `localhost` to:

```text
127.0.0.1:1521
```

Result:

```text
OK
```

### Hostname

The following test was successful:

```bash
tnsping oracledb.localdomain
```

Oracle resolved the hostname to:

```text
10.0.0.123:1521
```

Result:

```text
OK
```

## TNS Configuration

The Oracle Net configuration directory is:

```text
/u01/app/oracle/product/26ai/dbhome_1/network/admin/
```

The `TNS_ADMIN` environment variable is not explicitly set, so the default Oracle Net configuration location under `ORACLE_HOME/network/admin` is being used.

The following TNS aliases are configured:

* `ORCLCONN`
* `LISTENER_1521_1522`
* `ORCLPDB1`
* `TGT_CDB_TNS`

## ORCLPDB1 Connectivity

The `ORCLPDB1` TNS alias points to:

```text
HOST = oracledb.localdomain
PORT = 1521
SERVICE_NAME = orclpdb1
```

Connectivity was verified using:

```bash
tnsping orclpdb1
```

Result:

```text
OK
```

## Remote Database Connectivity Configuration

The `TGT_CDB_TNS` alias is configured to connect to:

```text
HOST = remotedb.localdomain
PORT = 1522
SERVICE_NAME = orclcdb
```

This provides the Oracle Net configuration used for future remote database connectivity and migration exercises.

## Network Flow

### Local PDB Connection

```text
TNS Alias
   |
   v
ORCLPDB1
   |
   v
oracledb.localdomain
   |
   v
10.0.0.123:1521
   |
   v
Oracle Listener
   |
   v
orclpdb1 service
```

### Remote Database Connection

```text
TGT_CDB_TNS
   |
   v
remotedb.localdomain
   |
   v
TCP 1522
   |
   v
orclcdb service
```

## Connectivity Tests Performed

| Test                           | Result     |
| ------------------------------ | ---------- |
| `tnsping localhost`            | Successful |
| `tnsping oracledb.localdomain` | Successful |
| `tnsping orclpdb1`             | Successful |
| Listener TCP 1521 check        | Listening  |

## DBA Observations

* The Oracle listener is actively listening on TCP port `1521`.
* Localhost connectivity is functional.
* Hostname-based connectivity is functional.
* The `ORCLPDB1` TNS alias resolves successfully.
* A remote database TNS alias named `TGT_CDB_TNS` is configured for `remotedb.localdomain` on port `1522`.
* The remote TNS configuration will be validated during the remote connectivity and database migration exercises.
