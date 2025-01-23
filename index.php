<?php

date_default_timezone_set('Europe/Paris');

define("BASE_DIR", $_SERVER['DOCUMENT_ROOT']);
define("BASE_URL", "http://localhost");

require_once("controller/Funcs.class.php");
require_once("controller/Conn.class.php");
require_once("controller/CRUD.class.php");
require_once("controller/Actions.php");

//Include Page
$page = isset($_GET["page"]) ? $_GET["page"] : "home";
include "view/header.php";
$page = "view/" . str_replace("-", "_", $page) . ".php";
if (file_exists($page)) {
    include $page;
} else {
    echo "<h1>An error occurred</h1>";
}
include "view/footer.php";