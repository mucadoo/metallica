<?php

require_once("Usuario.class.php");

class UsuarioDAO extends CRUD {

    public function __construct() {
        $this->table = "usuario";
        $this->bin = "Usuario";
    }

    public function selUsuario($id) {
        $fields = "id, login, nome, senha, email, nivel_id";
        $add = "WHERE id = ?";
        $params = array($id);
        return $this->readOne($fields, $add, $params);
    }

    public function selLogin($user, $pass) {
        $fields = "id, login, nome, senha, email, nivel_id";
        $add = "WHERE (login = ? or email = ?) and senha = ?";
        $params = array($user, $user, $pass);
        return $this->readOne($fields, $add, $params);
    }

    public function insertUsuario($nome, $login, $email, $senha) {
        $fields = "nome, login, email, senha, nivel_id";
        $params = array($nome, $login, $email, $senha, 3);
        return $this->create($fields, $params);
    }

    public function atualizaUsuario($nome, $login, $email, $senha, $id) {
        $fields = array("nome", "login", "email", "senha");
        $where = "id = ?";
        $params = array($nome, $login, $email, $senha, $id);
        return $this->update($fields, $params, $where);
    }

}
