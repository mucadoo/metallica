<?php

require_once("Paragrafo.class.php");

class ParagrafoDAO extends CRUD {

    public function __construct() {
        $this->table = "paragrafo";
        $this->bin = "Paragrafo";
    }
    
    public function selFisrtPar($artigoId) {
        $fields = "id, nr, texto, artigo_id";
        $add = "WHERE artigo_id = ? AND nr = 1";
        $params = array($artigoId);
        return $this->readOne($fields, $add, $params);
    }
    
    public function selParagrafos($artigoId) {
        $fields = "id, nr, texto, artigo_id";
        $add = "WHERE artigo_id = ? ORDER BY nr";
        $params = array($artigoId);
        return $this->readAll($fields, $add, $params);
    }
    
    public function insertParagrafo($nr, $txt, $artId) {
        $fields = "nr, texto, artigo_id";
        $params = array($nr, $txt, $artId);
        return $this->create($fields, $params);
    }

}
