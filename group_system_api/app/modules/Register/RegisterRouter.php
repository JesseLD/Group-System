<?php

require_once 'app/modules/Register/RegisterController.php';
require_once 'app/utils/ResponseService.php';

class RegisterRouter
{

  private $route;

  private $controller;

  public function __construct($route)
  {
    $this->route = $route;

    $this->controller = new RegisterController();

    $this->handleRequest($route);
  }

  public function handleRequest($route)
  {

    $resource = explode("/", $route["url"]);

    $data = require_once 'app/modules/Register/RegisterRequestHandler.php';

    switch ($route["method"]) {

      // case "GET":
      //   if ($resource[2] == "") {
      //     return $this->controller->getAny();
      //   } else {

      //     return new ResponseService("Resource not found", [], 404);
      //   }

      case "POST":
        // $this->controller->getAny();
        if($resource[2] == ""){
          validateRegister($data);

          return $this->controller->register(
            $data['name'],
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
