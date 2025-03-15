<?php

class UserModel
{

  private $pdo;

  public function __construct()
  {

    $this->pdo = require_once 'app/config/database.php';
  }

  public function getUsers()
  {

    $stmt = $this->pdo->prepare("SELECT * FROM Users");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
}
