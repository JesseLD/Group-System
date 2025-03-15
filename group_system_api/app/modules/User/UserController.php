<?php

require_once 'app/modules/User/UserModel.php';
require_once 'app/services/ResponseService.php';

class UserController {


  public function getAny() {

    $userModel = new UserModel();
    $userData = $userModel->getAny();
    return new ResponseService("Getting All Users", $userData);

  }
}