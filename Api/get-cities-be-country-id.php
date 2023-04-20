<?php
require_once('languages.php');
require_once("dbconfig.php");

$lang = $_GET['lang'];
$lang = trim($lang);
$lang = stripslashes($lang);
$lang = htmlspecialchars($lang);

$lang = isset($lang) && in_array($lang, $languages) ? $lang : 'en';


$country_id = $_GET['country_id'];
$country_id = trim($country_id);
$country_id = stripslashes($country_id);
$country_id = htmlspecialchars($country_id);

$country_id = isset($_GET['country_id'])  ? $_GET['country_id']  : '';

$sql = "SELECT City.id, City.name_$lang as name, City.about_$lang as about, City.photo, City.is_active, TIMESTAMP(City.updated_at) AS updated_at, Region.id as region_id, Region.name_$lang as region_name FROM City INNER JOIN Region on City.region_id = Region.id WHERE City.country_id = 1 ORDER BY City.name_$lang;";
if ($result = $conn->query($sql)) {
    $cities = array();
    while ($row = $result->fetch_assoc()) {
        $city = array(
            'id' => $row['id'],
            'name' => $row["name"],
            'about' => $row["about"],
            'photo' => $row['photo'],
            'isActive' => $row['is_active'],
            'lastUpdate' => $row['updated_at'],
            'regionId' => $row['region_id'],
            'regionName' => $row['region_name']
        );
        array_push($cities, $city);
    }
    $json = array('cities' => $cities);
    echo json_encode($json, JSON_NUMERIC_CHECK | JSON_UNESCAPED_UNICODE);
} else {
    $json = array('error' => 'Failed to get Results from DataBase');
    echo json_encode($json);
}
$conn->close();
