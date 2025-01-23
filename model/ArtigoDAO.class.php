<?php

require_once("Artigo.class.php");

class ArtigoDAO extends CRUD {

    public function __construct() {
        $this->table = "artigo";
        $this->bin = "Artigo";
    }

    public function selArtigos() {
        $fields = "id, nome, imagem, usuario_id";
        $add = "ORDER BY data DESC";
        return $this->readAll($fields, $add);
    }

    public function searchArtigos($q) {
        $fields = "id, nome, imagem, usuario_id";
        $q = "%" . $q . "%";
        $add = "WHERE nome LIKE ?";
        $params = array($q);
        return $this->readAll($fields, $add, $params);
    }

    public function selArtigo($id) {
        $fields = "id, nome, imagem, usuario_id, data";
        $add = "WHERE id = ?";
        $params = array($id);
        return $this->readOne($fields, $add, $params);
    }
    
    public function InsertArtigo($nome, $img, $usrId) {
        $fields = "nome, imagem, usuario_id";
        $params = array($nome, $img, $usrId);
        return $this->create($fields, $params);
    }

}
