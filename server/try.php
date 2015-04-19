<?php
require_once './DBoperations.php';
require_once './config.php';
$response = new DBoperations();
echo "<pre>".json_encode( $response->getItems(10), JSON_UNESCAPED_UNICODE )."</pre>";

