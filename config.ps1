#include trailing slash
$location= "c:\temp\send\"
#your smtp username
$username= "stmpusername"
#your smtp password
$pass = "yourpassword"
#who shall the email header say mail is from?
$from = "you@youremail.com"
#smtp server address
$smtpServer = "smtp.mailgun.org"
#smtp port
$smtpPort = "587"
#use ssl?
$useSsl = $true
#use HTML in body of message?
$useHtml = $true
#send path text file location with destination list, one email per line
$sendPath = "c:\mailer\emailto.txt"
#message subject
$msgSubject = "Daily E-mail Attachment"
#message body
$msgBody = "<h2> Here are your daily attachments. Thanks! </h2><br><br>Please do not respond to this e-mail, no one will respond."

