<?php
if (!isset($sessUsr)) {
    echo "<h1>Para acessar esta página, você precisa estar logado</h1>";
} else {
    ?>
    <section>
        <article>
            <header id="head">
                <h1 style="left:40px">Postar artigo</h1>
            </header>
            <form method="post" enctype="multipart/form-data">
                <label for="postNome">Nome:</label><br>
                <input type="text" name="postNome" id="postNome" required><br><br>
                <label for="postImg">Imagem:</label><br>
                <input type="file" name="postImg" id="postImg" required><br><br>
                <label for="p1">Parágrafo 1:</label><br>
                <textarea name="p1" id="p1" required></textarea><br><br>
                <button id="delPar">Excluir Último Parágrafo</button>
                <button id="addPar">Adicionar Paragafo</button>
                <input type="submit" value="Postar">
                <p id="demo" style="left:30px"></p>
            </form>
        </article>
    </section>
    <?php
}
?>