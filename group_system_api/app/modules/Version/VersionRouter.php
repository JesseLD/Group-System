<?php

require_once 'app/modules/Version/VersionController.php';
require_once 'app/utils/ResponseService.php';

class VersionRouter
{

  private $route;

  private $controller;

  public function __construct($route)
  {
    $this->route = $route;

    $this->controller = new VersionController();

    $this->handleRequest($route);
  }

  public function handleRequest($route)
  {

    $resource = explode("/", $route["url"]);

    $data = require_once 'app/modules/Version/VersionRequestHandler.php';

    switch ($route["method"]) {

      case "GET":
        if ($resource[2] == "") {
          // return $this->controller->getAny();
          // echo "HERE";
          // exit;
          $productionVersion = "1.0.1";
          $developmentVersion = "1.0.1";
          $updateUrl = "http://localhost:3000/update";

          $respose = [
            "productionVersion" => $productionVersion,
            "developmentVersion" => $developmentVersion,
            "updateUrl" => $updateUrl
          ];
          return new ResponseService("Getting Version", $respose);
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
