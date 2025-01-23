<?php

abstract class Conn {

    private static $arq;
    private static $dbtype;
    private static $host;
    private static $port;
    private static $user;
    private static $password;
    private static $db;

    public function __destruct() {
        $this->disconnect();
        $refclass = new ReflectionClass($this);
        foreach ($refclass->getProperties() as $key => $value) {
            unset($this->$key);
        }
    }

    private function getArq() {
        return self::$arq;
    }

    private function getDBType() {
        return self::$dbtype;
    }

    private function getHost() {
        return self::$host;
    }

    private function getPort() {
        return self::$port;
    }

    private function getUser() {
        return self::$user;
    }

    private function getPassword() {
        return self::$password;
    }

    private function getDB() {
        return self::$db;
    }

    private function setArq($arq) {
        self::$arq = $arq;
    }

    private function setDbtype($dbtype) {
        self::$dbtype = $dbtype;
    }

    private function setHost($host) {
        self::$host = $host;
    }

    private function setPort($port) {
        self::$port = $port;
    }

    private function setUser($user) {
        self::$user = $user;
    }

    private function setPassword($password) {
        self::$password = $password;
    }

    private function setDb($db) {
        self::$db = $db;
    }

    protected function connect() {
        if (is_null($this->getArq())) {
            $this->setArq(BASE_DIR . "/config/db.ini");
            $this->setParamsFile();
        } else if (is_null($this->getDBType())) {
            $this->setParamsFile();
        }
        try {
            $this->conexao = new PDO($this->getDBType() . ":host=" . $this->getHost() . ";port=" . $this->getPort() . ";dbname=" . $this->getDB() . ";charset=utf8", $this->getUser(), $this->getPassword());
        } catch (PDOException $e) {
            Funcs::throwPDOError($e);
        }
        $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return ($this->conexao);
    }

    private function setParamsFile() {
        $conf = parse_ini_file($this->getArq());
        $this->setDbtype($conf['sgbd']);
        $this->setHost($conf['host']);
        $this->setPort($conf['port']);
        $this->setUser($conf['user']);
        $this->setPassword($conf['pass']);
        $this->setDb($conf['db']);
    }

    private function disconnect() {
        $this->conexao = null;
    }

}
