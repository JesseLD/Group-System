<?php

require_once 'app/modules/Login/LoginModel.php';
require_once 'app/utils/ResponseService.php';

class LoginController {

  public function login(
    $email,
    $password
  ) {

    $loginModel = new LoginModel();
    $loginData = $loginModel->login($email, $password);
    return new ResponseService("Login Successful", $loginData);

  }
}