<?php

require_once 'app/modules/BaseModule/BaseModuleController.php';
require_once 'app/utils/ResponseService.php';

class BaseModuleRouter
{

  private $route;

  private $controller;

  public function __construct($route)
  {
    $this->route = $route;

    $this->controller = new BaseModuleController();

    $this->handleRequest($route);
  }

  public function handleRequest($route)
  {

    $resource = explode("/",$route["url"]);

    $data = require_once 'app/modules/BaseModule/BaseModuleRequestHandler.php';

    switch ($route["method"]) {

      case "GET":
        if ($resource[2] == "") {
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
