<?php

class VersionModel
{

  private $pdo;

  public function __construct()
  {

    $this->pdo = require_once 'app/config/database.php';
  }

  public function getAny()
  {

    $stmt = $this->pdo->prepare("SELECT * FROM any");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}
