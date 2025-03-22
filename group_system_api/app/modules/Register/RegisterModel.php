<?php

class RegisterModel
{

  private $pdo;

  public function __construct()
  {

    $this->pdo = require_once 'app/config/database.php';
  }

  public function register(
    $name,
    $email,
    $password
  )
  { 
    
    // Verifying if user exists
    $stmt = $this->pdo->prepare("SELECT * FROM Users WHERE email = ?");
    $stmt->execute([$email]);
    $exists = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($exists) > 0) {
      return new ResponseService("User already exists", [], 400);
    }

    // Hashing password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Inserting user
    $insertStmt = $this->pdo->prepare(
      "INSERT INTO Users
        (name, email, password)
       VALUES
        (?, ?, ?)"
    );
    $insertStmt->execute([$name, $email, $hashedPassword]);

    $user = [
      "name" => $name,
      "email" => $email
    ];

    return $user;
  }
}
