#Include the config to be modified by installer
. ./Config.ps1
#create the SMTP class object instance
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$smtp.EnableSsl = $useSsl
$smtp.Port = $smtpPort
#create the message object to begin the details of communication
$msg = new-object Net.Mail.MailMessage
#get the content of a folder we want to send, it must not contain other dirs
$to = Get-Content -Path $sendPath
#tell the message object the email users we want to use as destinations
Foreach($row in $to){
    $msg.To.Add("$row");
}
$msg.From = "$from"
#Set message encoding
$msg.BodyEncoding = [system.Text.Encoding]::Unicode 
$msg.SubjectEncoding = [system.Text.Encoding]::Unicode
#shall we use HTML for the body?
$msg.IsBodyHTML = $useHtml
$msg.Subject = $msgSubject
$msg.Body = $msgBody 
#collect all of the paths to files in the specified location that we will attach files from
$items = Get-ChildItem -Path "$location" -Name
Foreach($item in $items){
	#concatenate location path and item path
	$path = $location + $item
	#create a new mail attachment object
	$attach = new-object Net.Mail.Attachment($path)
	#attach the file to the message
	$msg.Attachments.Add($attach)
} 
#pass in the network credentials object to login to the SMTP server
$smtp.Credentials = new-object System.Net.NetworkCredential("$username", "$pass");
#send the message we created
$smtp.Send($msg)