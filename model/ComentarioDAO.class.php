<?php

require_once("Comentario.class.php");

class ComentarioDAO extends CRUD {

    public function __construct() {
        $this->table = "comentario";
        $this->bin = "Comentario";
    }

    public function selComentarios($artigoId) {
        $fields = "id, texto, artigo_id, usuario_id, data";
        $add = "WHERE artigo_id = ? ORDER BY data DESC";
        $params = array($artigoId);
        return $this->readAll($fields, $add, $params);
    }

    public function InsertComentario($texto, $artigo_id, $usuario_id) {
        $fields = "texto, artigo_id, usuario_id";
        $params = array($texto, $artigo_id, $usuario_id);
        return $this->create($fields, $params);
    }

    public function updateComentario($id, $texto) {
        $fields = array("texto");
        $params = array($texto, $id);
        $where = "id = ?";
        return $this->update($fields, $params, $where);
    }

    public function excluiComentario($id) {
        $where = "id = ?";
        $params = array($id);
        return $this->delete($where, $params);
    }

}
