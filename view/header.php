<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="Home do site do Metallica">
        <meta name="keywords" content="Metallica, metallica, Home, James Hetfield, Kirk Hammet, Robert Trujillo, Lars Ulrich">
        <meta name="author" content="Eduardo Magalhães Gusmão">
        <meta charset="utf-8">
        <title>Metallica Brasil</title>
        <?php
        if (strpos($page, "biografia") !== false) {
            $css = "biografia";
        } else if (strpos($page, "contato") !== false || strpos($page, "cadastro") !== false || strpos($page, "post") !== false) {
            $css = "contato";
        } else if (strpos($page, "shows") !== false) {
            $css = "shows";
        } else if (strpos($page, "artigos") !== false) {
            $css = "artigos";
        } else if (strpos($page, "discografia") !== false) {
            $css = "discografia";
        } else {
            $css = "geral";
        }
        ?>
        <link rel="stylesheet" href="<?= BASE_URL ?>/style/<?= $css ?>.css">
        <link rel="shortcut icon" type="image/x-icon" href="<?= BASE_URL ?>/media/favicon.ico">
        <script type="text/javascript" src="<?= BASE_URL ?>/script/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="<?= BASE_URL ?>/script/main.js"></script>
        <?php
        if (isset($msg)) {
            ?>
            <script type="text/javascript">alert('<?= $msg ?>');</script>
            <?php
        }
        if (isset($url)) {
            ?>
            <script type="text/javascript">location.assign('<?= $url ?>');</script>
            <?php
        }
        ?>
    </head>
    <body>
        <div id="container">
            <header>
                <img src="<?= BASE_URL ?>/media/HEADER1.jpg" id="header">
                <a href="<?= BASE_URL ?>/" id="logo"><img src="<?= BASE_URL ?>/media/metallicalogo.png"></a>
            </header>
            <nav>
                <ul>
                    <li><a href="#">BIOGRAFIA</a>
                        <ul class="dropdown">
                            <li><a href="<?= BASE_URL ?>/biografia_banda/">Banda</a></li>
                            <li><a href="<?= BASE_URL ?>/biografia_integrantes/">Integrantes</a></li>
                        </ul></li>
                    <li><a href="#">DISCOGRAFIA</a>
                        <ul class="dropdown">
                            <li><a href="<?= BASE_URL ?>/discografia-kill_em_all/">Kill'em all</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-ride_the_lightning/">Ride the Lightning</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-master_of_puppets/">Master of Puppets</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-and_justice_for_all/">And Justice for All</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-black/">Metallica(Black album)</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-load/">Load</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-reload/">Reload</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-garage/">Garage</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-st_anger/">St.Anger</a></li>
                            <li><a href="<?= BASE_URL ?>/discografia-death_magnetic/">Death Magnetic</a></li>
                        </ul>
                    </li>
                    <li><a href="<?= BASE_URL ?>/shows/">AGENDA DE SHOWS</a></li>
                    <li><a href="<?= BASE_URL ?>/contato/">FALE CONOSCO</a></li>
                </ul>
            </nav>