<?php
require_once("model/ArtigoDAO.class.php");
require_once("model/ParagrafoDAO.class.php");
require_once("model/ComentarioDAO.class.php");
require_once("model/UsuarioDAO.class.php");

$artDAO = new ArtigoDAO();
$parDAO = new ParagrafoDao();
$comDAO = new ComentarioDAO();
$userDAO = new UsuarioDAO();

$artID = isset($_GET["sub"]) ? $_GET["sub"] : 0;
$art = $artDAO->selArtigo($artID);
if (!$art) {
    echo "<h1 style='top: 200px;'>Essa página não existe, seu otário</h1>";
} else {
    $pars = $parDAO->selParagrafos($art->getId());
    $coms = $comDAO->selComentarios($art->getId());
    $userArt = $userDAO->selUsuario($art->getUsuarioId());
    ?>
    <section>
        <article>
            <header class="head">
                <h1><?= $art->getNome() ?></h1>
                <p>Por <?= $userArt->getNome() ?> em <?= date("j/m/Y \à\s H:i", strtotime($art->getData())); ?></p>
            </header>
            <img src="<?= BASE_URL ?>/media/<?= $art->getImagem() ?>" class="imagens">
            <section class="paragrafo">
                <?php foreach ($pars as $key => $row) { ?>
                    <p><?= $row->getTexto() ?></p>
                <?php } ?>
            </section>
            <section class="paragrafo" style="margin-top: -40px">
                <h1>Comentários:</h1>
                <?php if (isset($sessUsr)) { ?>
                    <form id="postCom" method="post">
                        <p class="paragrafo" style="top:0px">Escreva seu comentário:</p><br>
                        <textarea style="float: left; margin-top:-15px" rows="2" name="comTexto" cols="70"></textarea>
                        <input type="hidden" name="artigo_id" value="<?= $art->getId() ?>">
                        <input style="margin-left: 20px" type="submit" value="Enviar">
                    </form>
                    <?php
                }
                if (count($coms) == 0) {
                    ?>
                    <p>Ainda não existem comentários para este artigo.</p>
                    <?php
                }
                foreach ($coms as $key => $row) {
                    $userCom = $userDAO->selUsuario($row->getUsuarioId());
                    ?>
                    <p><?= $userCom->getNome() ?> em <?= date("j/m/Y \à\s H:i", strtotime($row->getData())); ?> diz: 
                        <?php if (isset($sessUsr) && $sessUsr->getId() == $row->getUsuarioId()) { ?>
                            <button class="editarCom">Editar</button>
                            <button class="excluirCom">Excluir</button>
                            <button class="atualizarCom" style="display: none">Atualizar</button>
                            <button class="cancelarCom" style="display: none">Cancelar</button>
                        <?php } ?>
                    </p>
                    <form method="post">
                        <input type="hidden" name="id" value="<?= $row->getId() ?>">
                        <input type="hidden" name="actionCom">
                        <textarea name="texto" disabled><?= $row->getTexto() ?></textarea>
                    </form>
                <?php } ?>
            </section>
        </article>
    </section>
    <?php
}
?>