-- ============================================================
-- Oracle Database Inventory
-- Purpose: Capture core database, instance, and PDB details
-- Environment: Oracle Database 26ai
-- ============================================================

SET LINESIZE 180
SET PAGESIZE 100
SET FEEDBACK ON
SET VERIFY OFF
SET HEADING ON
SET TRIMSPOOL ON

PROMPT
PROMPT ============================================================
PROMPT ORACLE DATABASE INVENTORY
PROMPT ============================================================

PROMPT
PROMPT === Database Information ===

SELECT
    name,
    db_unique_name,
    open_mode,
    database_role,
    cdb,
    log_mode,
    force_logging
FROM v$database;

PROMPT
PROMPT === Instance Information ===

SELECT
    instance_name,
    host_name,
    version,
    status,
    startup_time
FROM v$instance;

PROMPT
PROMPT === Oracle Database Version ===

SELECT banner
FROM v$version
WHERE banner LIKE 'Oracle%';

PROMPT
PROMPT === Current Container ===

SHOW CON_NAME

PROMPT
PROMPT === Container / PDB Inventory ===

SELECT
    con_id,
    name,
    open_mode,
    restricted
FROM v$containers
ORDER BY con_id;

PROMPT
PROMPT ============================================================
PROMPT INVENTORY COMPLETE
PROMPT ============================================================

