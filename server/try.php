<?php
require_once './DBoperations.php';
require_once './config.php';
require_once '../class/cryptpass.php';

echo encrypt_pass('12345');

//$response = new DBoperations();

//echo json_encode($response->getOmanState(), JSON_UNESCAPED_UNICODE);

//echo json_encode($response->SignIn("ghak@gmail.com", "12345"), JSON_UNESCAPED_UNICODE);

//echo "<pre>".json_encode( $response->getItems(10), JSON_UNESCAPED_UNICODE )."</pre>";



