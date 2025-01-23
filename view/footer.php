<aside>
    <?php if (isset($sessUsr)) { ?>
        <h1>Welcome, <?= $sessUsr->getNome() ?></h1>
        <form action="" method="post">
            <input type="hidden" name="sair" value="true">
            <input type="submit" value="Logout">
        </form>
        <p><a href="<?= BASE_URL ?>/cadastro/">Update your data</a></p>
        <p><a href="<?= BASE_URL ?>/postar/">Post article</a></p>
    <?php } else { ?>
        <h1>Login</h1>
        <form action="" method="post">
            <input type="text" name="login" placeholder="Login" required><br><br>
            <input type="password" name="senha" placeholder="Password" required><br><br>
            <input type="submit" value="Login">
        </form>
        <p><a href="<?= BASE_URL ?>/cadastro/">Not a user yet?</a></p>
    <?php } ?>
    <h1>Search Article</h1>
    <form action="<?= BASE_URL ?>" method="get">
        <input type="search" name="q" placeholder="Search" style="width:100%" required><br><br>
        <input type="submit" value="Search">
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
