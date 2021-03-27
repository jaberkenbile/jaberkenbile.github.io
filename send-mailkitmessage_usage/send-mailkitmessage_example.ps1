<# SMTP Setup #>
$smtpUserName = 'SMTPUSER'
$smtpPassword = ConvertTo-SecureString 'SMTPPASS' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($smtpUserName, $smtpPassword)
$smtpServer = 'SMTPSRV'
$port = 25
$fromaddress = (hostname -s) + "@" + (hostname -d)
$recipientList = $to = 'alerts@abc.org'

<# 
WARNING: The command 'Send-MailMessage' is obsolete. This cmdlet does not guarantee secure connections to SMTP servers. 
While there is no immediate replacement available in PowerShell, we recommend you do not use Send-MailMessage at this time. 
See https://aka.ms/SendMailMessage for more information.
#>
Send-MailMessage -Credential $credential -smtpServer  $smtpServer -port $port -from $fromaddress -to $to `
-subject 'Send-MailMessage Alert' -body 'Alert sent with Send-MailMessage cmdlet' -UseSsl

<# 
Send-MailKitMessage Requires the Send-MailKitMessage module to be installed 
Install-Module -Name Send-MailKitMessage
#>
Send-MailKitMessage -Credential $credential -smtpServer $smtpServer -port $port -from $fromaddress -RecipientList $recipientList `
-subject 'Send-MailKitMessage Alert' -TextBody 'Alert sent with the Send-MailKitMessage cmdlet'