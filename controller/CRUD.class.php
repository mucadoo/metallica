<?php

class CRUD extends Conn {

    protected $table;
    protected $bin;

    protected function selectDB($sql, $params = null, $class = null) {
        try {
            $query = $this->connect()->prepare($sql);
            $query->execute($params);
            if (isset($class)) {
                $rs = $query->fetchAll(PDO::FETCH_CLASS, $class);
            } else {
                $rs = $query->fetchAll(PDO::FETCH_OBJ);
            }
            self::__destruct();
            return $rs;
        } catch (PDOException $e) {
            Funcs::throwPDOError($e);
        }
    }

    protected function insertDB($sql, $params = null) {
        try {
            $conexao = $this->connect();
            $query = $conexao->prepare($sql);
            $query->execute($params);
            $rs = $conexao->lastInsertId();
            self::__destruct();
            return $rs;
        } catch (PDOException $e) {
            Funcs::throwPDOError($e);
        }
    }

    protected function updDelDB($sql, $params = null) {
        try {
            $query = $this->connect()->prepare($sql);
            $query->execute($params);
            $rs = $query->rowCount();
            self::__destruct();
            return $rs;
        } catch (PDOException $e) {
            Funcs::throwPDOError($e);
        }
    }

    protected function readAll($fields = "*", $add = "", $params = null) {
        $sql = "SELECT $fields FROM $this->table $add";
        return $this->selectDB($sql, $params, $this->bin);
    }

    protected function readOne($fields = "*", $add = "", $params = null) {
        $sql = "SELECT $fields FROM $this->table $add";
        $rs = $this->selectDB($sql, $params, $this->bin);
        return count($rs) == 1 ? $rs[0] : null;
    }

    protected function create($fields, $params = null) {
        $numparams = "";
        for ($i = 0; $i < count($params); $i++)
            $numparams.=",?";
        $numparams = substr($numparams, 1);
        $sql = "INSERT INTO $this->table ($fields) VALUES ($numparams)";
        return $this->insertDB($sql, $params);
    }

    protected function objCreate($obj) {
        $fields = "";
        $params = [];
        var_dump($comment);
        foreach ($comment as $key => $value) {
            echo $key;
            if ($value) {
                $fields = ", " . $key;
                $params[] = $value;
            }
        }
        $fields = substr($fields, 2);
        $numparams = "";
        for ($i = 0; $i < count($params); $i++)
            $numparams.=",?";
        $numparams = substr($numparams, 1);
        $sql = "INSERT INTO $this->table ($fields) VALUES ($numparams)";
        return $this->insertDB($sql, $params);
    }

    protected function update($fields, $params = null, $where = null) {
        $fields_T = "";
        for ($i = 0; $i < count($fields); $i++)
            $fields_T.=", $fields[$i] = ?";
        $fields_T = substr($fields_T, 2);
        $sql = "UPDATE $this->table SET $fields_T";
        if (isset($where))
            $sql .= " WHERE $where";
        return $this->updDelDB($sql, $params);
    }

    protected function delete($where = null, $params = null) {
        $sql = "DELETE FROM $this->table";
        if (isset($where))
            $sql .= " WHERE $where";
        return $this->updDelDB($sql, $params);
    }

}
