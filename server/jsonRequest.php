<?php

header("Access-Control-Allow-Origin: *");
header('Content-type: application/json');
header('Content-Type: text/html; charset=utf-8');



if (isset($_GET["apprequestkey"])) {

    require_once './Keys.php';

    //request coming from app
    if ($_GET["apprequestkey"] == APP_REQUEST_KEY) {
        
        require_once './DBoperations.php';
        require_once './config.php';
        $response = new DBoperations();
        
        if(isset($_GET["destination"])){
           switch ($_GET["destination"]) {
            case "homeitem":
                echo json_encode( $response->getItems(10), JSON_UNESCAPED_UNICODE );
                break;

            default:
                break;
        } 
        }
        
        
    }
}


