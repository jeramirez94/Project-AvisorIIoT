 
use master 
go 
sp_configure 'show advanced options',1 
go 
reconfigure with override 
go 
sp_configure 'Database Mail XPs',1 
--go 
--sp_configure 'SQL Mail XPs',0 
go 
reconfigure 
go 
 
-------------------------------------------------------------------------------------------------- 
-- BEGIN Mail Settings Avisor 
-------------------------------------------------------------------------------------------------- 
IF NOT EXISTS(SELECT * FROM msdb.dbo.sysmail_profile WHERE  name = 'Avisor')  
  BEGIN 
    --CREATE Profile [Avisor] 
    EXECUTE msdb.dbo.sysmail_add_profile_sp 
      @profile_name = 'Avisor', 
      @description  = 'Profile para el envio de alertas Avisor'; 
  END --IF EXISTS profile 
   
  IF NOT EXISTS(SELECT * FROM msdb.dbo.sysmail_account WHERE  name = 'A1SRVHOUBD01@DEACERO.COM') 
  BEGIN 
    --CREATE Account [A1SRVHOUBD01@DEACERO.COM] 
    EXECUTE msdb.dbo.sysmail_add_account_sp 
    @account_name            = 'A1SRVHOUBD01@DEACERO.COM', 
    @email_address           = 'A1SCADAPOPMC@DEACERO.COM', 
    @display_name            = 'ASW Houston', 
    @replyto_address         = 'no-replay@DEACERO.COM', 
    @description             = 'Administrador de automatizacion midcontinent Poplar', 
    @mailserver_name         = '10.1.13.60', 
    @mailserver_type         = 'SMTP', 
    @port                    = '25', 
    @username                =  NULL , 
    @password                =  NULL ,  
    @use_default_credentials =  1 , 
    @enable_ssl              =  0 ; 
  END --IF EXISTS  account 
   
IF NOT EXISTS(SELECT * 
              FROM msdb.dbo.sysmail_profileaccount pa 
                INNER JOIN msdb.dbo.sysmail_profile p ON pa.profile_id = p.profile_id 
                INNER JOIN msdb.dbo.sysmail_account a ON pa.account_id = a.account_id   
              WHERE p.name = 'Avisor' 
                AND a.name = 'A1SRVHOUBD01@DEACERO.COM')  
  BEGIN 
    -- Associate Account [A1SRVHOUBD01@DEACERO.COM] to Profile [Avisor] 
    EXECUTE msdb.dbo.sysmail_add_profileaccount_sp 
      @profile_name = 'Avisor', 
      @account_name = 'A1SRVHOUBD01@DEACERO.COM', 
      @sequence_number = 1 ; 
  END  
--IF EXISTS associate accounts to profiles 
--------------------------------------------------------------------------------------------------- 
-- Drop Settings For Avisor 
-------------------------------------------------------------------------------------------------- 
/* 
IF EXISTS(SELECT * 
            FROM msdb.dbo.sysmail_profileaccount pa 
              INNER JOIN msdb.dbo.sysmail_profile p ON pa.profile_id = p.profile_id 
              INNER JOIN msdb.dbo.sysmail_account a ON pa.account_id = a.account_id   
            WHERE p.name = 'Avisor' 
              AND a.name = 'A1SRVHOUBD01@DEACERO.COM') 
  BEGIN 
    EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = 'Avisor',@account_name = 'A1SRVHOUBD01@DEACERO.COM' 
  END  
IF EXISTS(SELECT * FROM msdb.dbo.sysmail_account WHERE  name = 'A1SRVHOUBD01@DEACERO.COM') 
  BEGIN 
    EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'A1SRVHOUBD01@DEACERO.COM' 
  END 
IF EXISTS(SELECT * FROM msdb.dbo.sysmail_profile WHERE  name = 'Avisor')  
  BEGIN 
    EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'Avisor' 
  END 
*/ 
  