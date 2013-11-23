<?php

$emailTo = "multimedia99@gmail.com";
$name = $_POST["name"];
$emailFrom = $_POST["email"];
$message = $_POST["message"];
$subject = "New Message from TalentFlow!";

if( !empty( $_POST ) ) {
	$body  = "Name: " . $name . "\n\n";
	$body .= "Email: " . $emailFrom . "\n\n";
	$body .= "Message:\n" . $message;
	$body  = wordwrap($body, 70);
	$header = "From: " . $emailFrom . "\nReply-To: " . $emailFrom. "\n\n";
	
	if( mail( $emailTo, $subject, $body, $header ) ) {
		echo( "result=Successful" );
		
	} else {
		echo( "result=Unsuccessful" );
	}
}
?>