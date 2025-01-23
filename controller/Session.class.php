<?php

require_once("model/UsuarioDAO.class.php");

final class Session {

    public function autUser($user, $pass) {
        $userDAO = new UsuarioDAO();
        $userObj = $userDAO->selLogin($user, $pass);
        global $msg;
        if ($userObj) {
            $_SESSION['user'] = serialize($userObj);
            $msg = "Login successful!";
        } else {
            $msg = "Incorrect username or password!";
        }
    }

    public function updSession($idUser) {
        $userDAO = new UsuarioDAO();
        $userObj = $userDAO->selUsuario($idUser);
        $_SESSION['user'] = serialize($userObj);
        return $_SESSION['user'];
    }

    public function logout() {
        unset($_SESSION['user']);
    }

}
