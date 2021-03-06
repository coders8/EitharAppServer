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

        if (isset($_GET["destination"])) {
            switch ($_GET["destination"]) {
                case "homeitem": {
                        echo json_encode($response->getItems(10), JSON_UNESCAPED_UNICODE);
                    }break;
                case "signin": {
                    require_once '../class/cryptpass.php';
//                    echo json_encode($response->getItems(10), JSON_UNESCAPED_UNICODE);
                        echo json_encode($response->SignIn($_GET["useremail"], $_GET["pass"]), JSON_UNESCAPED_UNICODE);
                    }break;
                case "accountypes": {
                    echo json_encode($response->getAccountTypes(), JSON_UNESCAPED_UNICODE);
                    }break;
                default:
                    break;
            }
        }
    }
}

//require_once './DBoperations.php';
//require_once './config.php';
//$response = new DBoperations();
//echo json_encode($response->getAccountTypes(), JSON_UNESCAPED_UNICODE);

