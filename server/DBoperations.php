<?php

class DBoperations {

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
            $arrayobj = new ArrayObject(array("items"=>$data));
            
        } catch (ErrorException $e) {
            
        } finally {
            $dbh = NULL;
            return $arrayobj;
        }
    }

}
