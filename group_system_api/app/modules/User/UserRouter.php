<?php

require_once 'app/modules/User/UserController.php';
require_once 'app/utils/ResponseService.php';

class UserRouter
{

  private $route;

  private $controller;

  public function __construct($route)
  {
    $this->route = $route;

    $this->controller = new UserController();

    // $this->handleRequest();
    // $this->controller = );
  }

  public function handleRequest($route)
  {

    $resource = explode("/", $this->$route["url"]);

    $data = require_once 'app/modules/User/UserRequestHandler.php';


    switch ($route["method"]) {

      case "GET":
        if ($resource[2] == "edit") {
          return $this->controller->getAny();
        } else {

          return new ResponseService("Resource not found", [], 404);
        }

        // case "POST":
        //   $this->controller->getAny();
        //   break;

      default:
        return new ResponseService("Method not Allowed", [], 405);
    }
  }
}
