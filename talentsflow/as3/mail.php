<?php
$to = "contact@charag.com";
$subject = ($_POST['name']);
$message = ($_POST['message']);
$message .= "\n\n---------------------------\n";
$message .= "E-mail Sent From: " . $_POST['name'] . " <" . $_POST['email']  . ">\n";
$headers = "From: " . $_POST['name'] . " <" . $_POST['email'] . ">\n";
if(@mail($to, $subject, $message, $headers))
{
	echo "answer=ok";
} 
else 
{
	echo "answer=error";
}
?>