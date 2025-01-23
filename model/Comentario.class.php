<?php

class Comentario {

    private $id;
    private $texto;
    private $artigo_id;
    private $usuario_id;
    private $data;

    public function __construct() {
        
    }

    public function __destruct() {
        foreach ($this as $key => $value) {
            unset($this->$key);
        }
        foreach (array_keys(get_defined_vars()) as $var) {
            unset(${"$var"});
        }
        unset($var);
    }

    public function getId() {
        return $this->id;
    }

    public function getTexto() {
        return $this->texto;
    }

    public function getArtigoId() {
        return $this->artigo_id;
    }

    public function getUsuarioId() {
        return $this->usuario_id;
    }

    public function getData() {
        return $this->data;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setTexto($texto) {
        $this->texto = $texto;
    }

    public function setArtigoId($artigo_id) {
        $this->artigo_id = $artigo_id;
    }

    public function setUsuarioId($usuario_id) {
        $this->usuario_id = $usuario_id;
    }

    public function setData($data) {
        $this->data = $data;
    }

}
