<aside>
    <?php if (isset($sessUsr)) { ?>
        <h1>Bem vindo, <?= $sessUsr->getNome() ?></h1>
        <form action="" method="post">
            <input type="hidden" name="sair" value="true">
            <input type="submit" value="Sair">
        </form>
        <p><a href="<?= BASE_URL ?>/cadastro/">Atualize seus dados</a></p>
        <p><a href="<?= BASE_URL ?>/postar/">Postar artigo</a></p>
    <?php } else { ?>
        <h1>Entrar</h1>
        <form action="" method="post">
            <input type="text" name="login" placeholder="Login" required><br><br>
            <input type="password" name="senha" placeholder="Senha" required><br><br>
            <input type="submit" value="Entrar">
        </form>
        <p><a href="<?= BASE_URL ?>/cadastro/">Ainda não é usuário?</a></p>
    <?php } ?>        
    <h1>Buscar Artigo</h1>
    <form action="<?= BASE_URL ?>" method="get">
        <input type="search" name="q" placeholder="Buscar" style="width:100%" required><br><br>
        <input type="submit" value="Buscar">
    </form>
    <h1 style="left:10px;font-family:palatino linotype;">Networking</h1>
    <article id="artic">
        <a href="https://instagram.com/metallica/" target="_blank"><img style="border: 10px; border-style:solid; border-color:black" src="<?= BASE_URL ?>/media/instagram.png" width="70px" height="70px" name="instagram"></a>
        <a href="https://www.facebook.com/Metallica/" target="_blank"><img src="<?= BASE_URL ?>/media/facebook.png" width="60px" height="60px" style="top:-15px"></a>
        <a href="https://twitter.com/metallica/" target="_blank"><img src="<?= BASE_URL ?>/media/twitter.png" width="85px" height="85px"></a>
        <a href="https://metallica.com" target="_blank"><img src="<?= BASE_URL ?>/media/site.png" width="70px" height="70px" ></a>
        <a href="https://play.spotify.com/artist/2ye2Wgw4gimLv2eAKyk1NB" target="_blank"><img src="<?= BASE_URL ?>/media/spotify.png" width="70px" height="70px" style="left:10px"></a>
        <a href="https://www.youtube.com/user/MetallicaTV/" target="_blank"><img src="<?= BASE_URL ?>/media/youtube.png" width="80px" height="80px" style="top:10px; left:10px"></a>
    </article>
</aside>
</div>
</body>
</html>