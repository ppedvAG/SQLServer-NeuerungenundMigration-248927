
DROP database IF EXISTS oldstyle;
DROP database IF EXISTS NewStyle;

--1 DB mit ADR
EXEC sys.sp_configure N'show advanced options', N'1'  RECONFIGURE WITH OVERRIDE
GO
EXEC sp_configure 'ADR Cleaner Thread Count', '1'
RECONFIGURE WITH OVERRIDE;


CREATE DATABASE OldStyle;
GO
CREATE DATABASE NewStyle;
ALTER  DATABASE NewStyle SET ACCELERATED_DATABASE_RECOVERY = ON;
GO


--https://docs.microsoft.com/de-de/sql/relational-databases/accelerated-database-recovery-concepts?view=sql-server-ver15