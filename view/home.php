<?php
require_once("model/ArtigoDAO.class.php");
require_once("model/ParagrafoDAO.class.php");
$artDAO = new ArtigoDAO();
if (isset($_GET['q'])) {
    $arts = $artDAO->searchArtigos($_GET['q']);
    if (count($arts) == 0) {
        $title = "No articles found containing \"" . $_GET['q'] . "\"";
    } else {
        $title = "Displaying articles containing \"" . $_GET['q'] . "\"";
    }
} else {
    $arts = $artDAO->selArtigos();
    $title = "Latest Articles";
}
?>
<section>
    <article>
        <header id="head">
            <h1><?= $title ?></h1>
        </header>
        <?php
        foreach ($arts as $key => $row) {
            $parDAO = new ParagrafoDAO();
            $par = $parDAO->selFisrtPar($row->getId());
            ?>
            <article>
                <a href="<?= BASE_URL ?>/artigo/<?= $row->getId() ?>/">
                    <img class="imagens" src="<?= BASE_URL ?>/media/<?= $row->getImagem() ?>" alt="" style="float:left">
                </a>
                <div class="paragrafo">
                    <header class="titulo">
                        <h1><a href="<?= BASE_URL ?>/artigo/<?= $row->getId() ?>/"><?= $row->getNome() ?></a></h1>
                    </header>
                    <p><?= $par->getTexto() . ".." ?><a href="<?= BASE_URL ?>/artigo/<?= $row->getId() ?>/"> (read more)</a></p>
                </div>
            </article>
            <?php
        }
        ?>
    </article>
</section>