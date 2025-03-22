<?php

require_once 'app/modules/User/UserModel.php';
require_once 'app/utils/ResponseService.php';

class UserController {


  public function getUsers() {

    $userModel = new UserModel();
    $userData = $userModel->getUsers();
    return new ResponseService("Getting All Users", $userData);

  }
  public function getUser(
    $id
  ) {

    $userModel = new UserModel();
    $userData = $userModel->getUser($id);
    return new ResponseService("Getting User", $userData);

  }

}