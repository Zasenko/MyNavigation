<?php
$countries = array();
$tempArray = array();

$sql = "SELECT * FROM Country ORDER BY name";
$con = require __DIR__ . "/database.php";

if ($result = mysqli_query($con, $sql)) {
    while ($row = $result->fetch_object()) {
        $tempArray = $row;
        $tempArray->regions = [];
        array_push($countries, $tempArray);
    }
    echo json_encode($countries, JSON_NUMERIC_CHECK | JSON_UNESCAPED_UNICODE); 
}
mysqli_close($con);
