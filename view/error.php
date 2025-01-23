<?php
$erroCode = isset($_GET["sub"]) ? $_GET["sub"] : 0;
?>
<h1>Error <?= $erroCode ?> occurred</h1>
