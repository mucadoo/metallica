<?php

final class Funcs {

    public function throwPDOError(PDOException $e) {
        ob_clean();
        die(print_r($e));
    }

}
