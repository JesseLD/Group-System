<?php

require_once 'app/utils/ResponseService.php';
require_once 'app/middlewares/api_key.php';

require_once 'app/modules/User/UserRouter.php';

class Router 
{
  public function handleRequest() {


    validateApiKeyV1();

    $route = require_once 'app/middlewares/route.php';

    if (!$route || !isset($route["url"], $route["method"])) {
      throw new Exception("Erro: 'route.php' não retornou os valores esperados.");
    }

    $resourceParts = explode("/", $route["url"]);

    $resource = strtolower($resourceParts[1]);


    switch ($resource) {

      case "users":
        // new ResponseService("Getting All Users");
        new UserRouter($route);
        break;

      default:
        return new ResponseService("Resource not found", [], 404);
    }




  }

}