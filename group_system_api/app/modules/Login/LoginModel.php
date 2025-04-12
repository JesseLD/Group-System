<?php

class LoginModel
{

  private $pdo;

  public function __construct()
  {

    $this->pdo = require_once 'app/config/database.php';
  }

  public function login(
    $email,
    $password
  )
  {

    $stmt = $this->pdo->prepare("SELECT * FROM Users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
      return new ResponseService("User not found", [], 404);
    }

    if (!password_verify($password, $user['password'])) {
      return new ResponseService("Invalid password", [], 400);
    }

    $user['password'] = ""; // Remove password from the response

    $data = [
      "user" => $user,
      
    ];

    return $data;
    
  }
}
