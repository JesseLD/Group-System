<?php

require_once 'app/modules/User/UserModel.php';
require_once 'app/utils/ResponseService.php';

class UserController {


  public function getUsers() {

    $userModel = new UserModel();
    $userData = $userModel->getUsers();
    return new ResponseService("Getting All Users", $userData);

  }
}