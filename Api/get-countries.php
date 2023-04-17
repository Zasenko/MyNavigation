<?php
require_once('languages.php');
$lang = isset($_GET['lang']) && in_array($_GET['lang'], $languages) ? $_GET['lang'] : 'en';
$con = require __DIR__ . "/dbconfig.php";
$sql = "SELECT id, name_$lang, about_$lang, flag_emoji, photo, is_active FROM Country";
if ($result = $conn->query($sql)) {
    $countries = array();
    while ($row = $result->fetch_assoc()) {
        $country = array(
            'id' => $row['id'],
            'name' => $row["name_$lang"],
            'about' => $row["about_$lang"],
            'flag' => $row['flag_emoji'],
            'photo' => $row['photo'],
            'regions' => [],
            'places' => [],
            'events' => [],
            'isActive' => $row['is_active'],
            'lastUpdate' => ""
        );
        array_push($countries, $country);
    }
    $json = array('countries' => $countries);
    echo json_encode($json, JSON_NUMERIC_CHECK | JSON_UNESCAPED_UNICODE);
} else {
    $json = array('error' => 'Failed to get Results from DataBase');
    echo json_encode($json);
}
$conn->close();
