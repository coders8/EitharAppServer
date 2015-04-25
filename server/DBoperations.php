<?php

class DBoperations {

    public function SignIn($useremail, $userpass) {
        $data = array("status" => "false", "message" => "", "information" => "");
        $user = array();
        try {

            $dbh = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . "", DB_USERNAME, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $dbh->prepare('SELECT count(*) as find FROM '
                    . 'user WHERE user.email = :useremail');
            $stmt->bindParam(':useremail', $useremail, PDO::PARAM_STR);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $find;
            foreach ($result as $row) {
                $find = ($row['find'] == 0) ? false : true;
            }

            if ($find == FALSE) {
                $data["message"] = "email not found on the database";
            } else {
                $stmt = $dbh->prepare("SELECT user.password FROM user WHERE user.email = :useremail");
                $stmt->bindParam(':useremail', $useremail, PDO::PARAM_STR);
                $stmt->execute();
                $pass = $stmt->fetch(PDO::FETCH_ASSOC);

                if (decrypt_pass($userpass, $pass['password'])) {

                    $query = 'SELECT
                                user.email,
                                user.name,
                                user.user_id AS userid,
                                user.phone,
                                user.address,
                                user.user_type AS usertypeid,
                                user_type.type_title AS usertypetitle,
                                user.create_date AS createdate,
                                user.about
                              FROM user
                                INNER JOIN user_type
                                  ON user.user_type = user_type.id_user_type
                              WHERE user.email = :useremail';

                    $stmt = $dbh->prepare($query);
                    $stmt->bindParam(':useremail', $useremail, PDO::PARAM_STR);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);

                    $user = array();
                    $user["email"] = $row["email"];
                    $user["name"] = $row["name"];
                    $user["userid"] = $row["userid"];
                    $user["phone"] = $row["phone"];
                    $user["address"] = $row["address"];
                    $user["usertypeid"] = $row["usertypeid"];
                    $user["usertypetitle"] = $row["usertypetitle"];
                    $user["createdate"] = $row["createdate"];
                    $user["about"] = $row["about"];
                    
                    
                    $data["information"] = $user;

                    $data["status"] = "true";
                } else {
                    $data["message"] = "password is wrong";
                }
            }
//            close the database connection
        } catch (PDOException $e) {
            $data["message"] = $e->getMessage();
            $data["status"] = "false";
        } finally {
            $dbh = null;
            $arrayobj = new ArrayObject(array("signin" => $data));
            return $arrayobj;
        }
    }

    
    
    public function getAccountTypes() {
        $types = array();
        try {

            $dbh = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . "", DB_USERNAME, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            $sql = "SELECT id_user_type, type_title FROM user_type WHERE 1";
            $types = array();
            $type = array();
            foreach ($dbh->query($sql) as $row) {
                $type["id"] = $row['id_user_type'];
                $type["title"] = $row['type_title'];
                array_push($types, $type);
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }  finally {
            $dbh = null;
            $arrayobj = new ArrayObject(array("usertype" => $types));
            return $arrayobj;
        }
    }
    
    public function getOmanState() {
          $states = array();
        try {
            $dbh = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . "", DB_USERNAME, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            $sql = "SELECT id_oman_states, state_name FROM oman_states WHERE 1";
            $state = array();
            foreach ($dbh->query($sql) as $row) {
                $state["id"] = $row['id_oman_states'];
                $state["name"] = $row['state_name'];
                array_push($states, $state);
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }  finally {
            $dbh = null;
            $arrayobj = new ArrayObject(array("omanstate" => $states));
            return $arrayobj;
        }
    }
    
    public function getItems($limit) {
        $data = array();
        $itemsobject;
        try {
            $dbh = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . "", DB_USERNAME, DB_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $limit = intval($limit);

            $query = "SELECT
                    item.id_item AS itemid,
                    item.name AS itemname,
                    item.type AS itemtypeid,
                    item_type.title AS itemtypetitle,
                    item.create_date AS createdate,
                    item.user_creator AS creatorid,
                    item.quantity,
                    item_image.image_path AS imagepath,
                    item_image.image_name AS imagename,
                    item.description,
                    oman_states.state_name AS state,
                    user.name AS creatorname
                  FROM item_image,
                       item
                         INNER JOIN item_type
                           ON item.type = item_type.id_item_type
                         INNER JOIN oman_states
                           ON item.location_State = oman_states.id_oman_states
                         INNER JOIN user
                           ON item.user_creator = user.user_id
                  WHERE item.identefire = item_image.item_identefire
                  AND item_image.image_index = 1
                  ORDER BY item.create_date DESC
                  LIMIT " . $limit . "";

            $stmt = $dbh->prepare($query);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $row) {
                array_push($data, $row);
            }
            $arrayobj = new ArrayObject(array("items" => $data));
        } catch (ErrorException $e) {
            
        } finally {
            $dbh = NULL;
            return $arrayobj;
        }
    }

}
