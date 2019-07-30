-- ==================================================== *
/*-- /* Habilitando o xp_cmdshell */                    *
* --                                                    *
* -- exec sp_configure 'show advanced options', 1       *
* -- go                                                 *
* -- reconfigure                                        *
* -- go                                                 *
* -- EXEC sp_configure 'xp_cmdshell', 1                 *
* -- go                                                 *
* -- reconfigure                                        *
* -- go                                                 *
-- ==================================================== */

--========================================================================================================================================--
--> VARIÁVEIS

SET LANGUAGE Português

DECLARE @CAMINHO   VARCHAR(100) = 'C:\'
DECLARE @ARQUIVO_1 VARCHAR(100) = 'Relatório.txt'
DECLARE @ARQUIVO_2 VARCHAR(100)	= 'Relatório_2.txt'

DECLARE @DESTINO_EMAIL VARCHAR(MAX) = N'email_1@outlook.com;email_2@outlook.com'

DECLARE @ARQUIVO VARCHAR(1000) = ''+ @CAMINHO + @ARQUIVO_1 + ';' + @CAMINHO + @ARQUIVO_2 + ''
	  , @ASSUNTO	VARCHAR(255) = 'Relatórios fechamento mensal '
	  , @BODY_EMAIL NVARCHAR(MAX) = 'Segue em anexo o arquivo gerado .' + char(13) +char(10) + 'Duvidas entrar em contato com o TI.'
		
--========================================================================================================================================--
-- DISPARA O EMAIL     

EXEC msdb.dbo.sp_send_dbmail    
@recipients = @DESTINO_EMAIL,    
@BODY = @BODY_EMAIL,    
@BODY_format ='HTML',    
@subject = @ASSUNTO,    
@profile_name ='ProfileName'
,@file_attachments = @ARQUIVO

--========================================================================================================================================--


