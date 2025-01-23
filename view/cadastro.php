<?php
if (isset($sessUsr)) {
    $title = "Update Data";
    $subtitle = "Update your data";
    $action = "edit";
    $actText = "Update";
    $nome = $sessUsr->getNome();
    $login = $sessUsr->getLogin();
    $email = $sessUsr->getEmail();
    $senha = $sessUsr->getSenha();
} else {
    $title = "Register";
    $subtitle = "Register";
    $action = "register";
    $actText = "Register";
    $nome = "";
    $login = "";
    $email = "";
    $senha = "";
}
?>
<section>
    <article>
        <header id="head">
            <h1 style="left:40px"><?= $title ?></h1>
        </header>
        <form method="post">
            <p class="paragrafo"><?= $subtitle ?> by filling out the form below:</p><br><br>
            <label for="cadNome"> Name:<br> </label>
            <input type="text" name="cadNome" id="cadNome" value="<?= $nome ?>" required><br><br>
            <label for="cadLogin"> Login:<br> </label>
            <input type="text" name="cadLogin" id="cadLogin" value="<?= $login ?>" required><br><br>
            <label for="cadEmail"> Email:<br> </label>
            <input type="email" name="cadEmail" id="cadEmail" value="<?= $email ?>" required><br><br>
            <label for="cadSenha"> Password:<br> </label>
            <input type="password" name="cadSenha" id="cadSenha" value="<?= $senha ?>" required><br><br>
            <input type="hidden" name="actionUsr" value="<?= $action ?>">
            <input type="submit" style="left:30px" value="<?= $actText ?>" />
            <p id="demo" style="left:30px"></p>
        </form>
    </article>
</section>
