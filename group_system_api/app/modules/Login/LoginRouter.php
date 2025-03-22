<?php

require_once 'app/modules/Login/LoginController.php';
require_once 'app/utils/ResponseService.php';

class LoginRouter
{

  private $route;

  private $controller;

  public function __construct($route)
  {
    $this->route = $route;

    $this->controller = new LoginController();

    $this->handleRequest($route);
  }

  public function handleRequest($route)
  {

    $resource = explode("/",$route["url"]);

    $data = require_once 'app/modules/Login/LoginRequestHandler.php';

    switch ($route["method"]) {

      // case "GET":
      //   if ($resource[2] == "") {
      //     return $this->controller->getAny();
      //   } else {

      //     return new ResponseService("Resource not found", [], 404);
      //   }

        case "POST":
          if($resource[2] == ""){
            validateLogin($data);

            return $this->controller->login(
              $data['email'],
              $data['password']
            );

          }
          else {
            return new ResponseService("Resource not found", [], 404);
          }
          break;

      default:
        return new ResponseService("Method not Allowed", [], 405);
    }
  }
}
