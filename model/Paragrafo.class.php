<?php

class Paragrafo {

    private $id;
    private $nr;
    private $texto;
    private $artigo_id;

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

    public function getNr() {
        return $this->nr;
    }

    public function getTexto() {
        return $this->texto;
    }

    public function getArtigoId() {
        return $this->artigo_id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setNr($nr) {
        $this->nr = $nr;
    }

    public function setTexto($texto) {
        $this->texto = $texto;
    }

    public function setArtigoId($artigo_id) {
        $this->artigo_id = $artigo_id;
    }

}
