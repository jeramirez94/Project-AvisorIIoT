
USE [master]
GO
CREATE USER [AswUsr] FOR LOGIN [AswUsr]
GO
USE [master]
GO
GRANT EXECUTE ON sp_OACreate TO [AswUsr];
GRANT EXECUTE ON sp_OASetProperty TO [AswUsr];
GRANT EXECUTE ON sp_OAMethod TO [AswUsr];
GRANT EXECUTE ON sp_OADestroy TO [AswUsr];
GRANT EXECUTE ON sp_OACreate TO [AswUsr];
GO