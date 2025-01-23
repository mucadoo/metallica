<?php

session_start();
require_once("controller/Session.class.php");

//Loga
if (isset($_POST['login']) && isset($_POST['senha'])) {
    Session::autUser($_POST['login'], $_POST['senha']);
}

//Desloga
if (isset($_POST['sair'])) {
    Session::logout();
}

//Se logado guarda sessão num objeto
if (isset($_SESSION['user'])) {
    require_once("model/Usuario.class.php");
    $sessUsr = unserialize($_SESSION['user']);
}

//Insere Comentário
if (isset($_POST['comTexto'])) {
    require_once("model/ComentarioDAO.class.php");
    $comDAO = new ComentarioDAO();
    $comDAO->InsertComentario($_POST['comTexto'], $_POST['artigo_id'], $sessUsr->getId());
    $msg = "Comentário enviado com sucesso";
}

//Edita Comentário
if (isset($_POST['actionCom']) && $_POST['actionCom'] == "editar") {
    require_once("model/ComentarioDAO.class.php");
    $comDAO = new ComentarioDAO();
    $comDAO->updateComentario($_POST['id'], $_POST['texto']);
    $msg = "Comentário atualizado!";
}

//Exclui Comentário
if (isset($_POST['actionCom']) && $_POST['actionCom'] == "excluir") {
    require_once("model/ComentarioDAO.class.php");
    $comDAO = new ComentarioDAO();
    $comDAO->excluiComentario($_POST['id']);
    $msg = "Comentário excluído!";
}

//Cria Usuário
if (isset($_POST['actionUsr']) && $_POST['actionUsr'] == "cadastrar" && isset($_POST['cadNome']) && isset($_POST['cadLogin']) && isset($_POST['cadEmail']) && isset($_POST['cadSenha'])) {
    require_once("model/UsuarioDAO.class.php");
    $usrDAO = new UsuarioDAO();
    $usrDAO->insertUsuario($_POST['cadNome'], $_POST['cadLogin'], $_POST['cadEmail'], $_POST['cadSenha']);
    $msg = "Usuário cadastrado!";
    $url = BASE_URL;
}

//Edita Usuário
if (isset($_POST['actionUsr']) && $_POST['actionUsr'] == "editar" && isset($_POST['cadNome']) && isset($_POST['cadLogin']) && isset($_POST['cadEmail']) && isset($_POST['cadSenha'])) {
    require_once("model/UsuarioDAO.class.php");
    $usrDAO = new UsuarioDAO();
    $usrDAO->atualizaUsuario($_POST['cadNome'], $_POST['cadLogin'], $_POST['cadEmail'], $_POST['cadSenha'], $sessUsr->getId());
    $msg = "Dados atualizados!";
    $sessUsr = Session::updSession($sessUsr->getId());
    $url = BASE_URL;
}

//Cria artigo
if (isset($_POST['postNome']) && isset($_POST['p1']) && isset($_FILES['postImg'])) {
    require_once("model/ArtigoDAO.class.php");
    require_once("model/ParagrafoDAO.class.php");
    $artDAO = new ArtigoDAO();
    $parDAO = new ParagrafoDAO();
    $uploadfile = BASE_DIR . '/media/' . basename($_FILES['postImg']['name']);
    move_uploaded_file($_FILES['postImg']['tmp_name'], $uploadfile);
    $artId = $artDAO->InsertArtigo($_POST['postNome'], basename($_FILES['postImg']['name']), $sessUsr->getId());
    $nrPar = 1;
    while (isset($_POST['p' . $nrPar])) {
        $parDAO->insertParagrafo($nrPar, $_POST['p' . $nrPar], $artId);
        $nrPar++;
    }
    $msg = "Artigo postado!";
}