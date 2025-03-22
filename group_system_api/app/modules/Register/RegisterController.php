<?php

require_once 'app/modules/Register/RegisterModel.php';
require_once 'app/utils/ResponseService.php';

class RegisterController {

  public function register(
    $name,
    $email,
    $password
  ) {

    $registerModel = new RegisterModel();
    $registerData = $registerModel->register($name, $email, $password);
    return new ResponseService("User Created!", $registerData);

  }
}