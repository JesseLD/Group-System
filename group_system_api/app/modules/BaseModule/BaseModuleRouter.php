<?php

require_once 'app/modules/BaseModule/BaseModuleController.php';

class BaseModuleRouter {
  
    private $route;

    private $controller;

    public function __construct($route) {
      $this->route = $route;

      $this->controller = new BaseModuleController();

      $this->handleRequest();
      // $this->controller = );
    }

    public function handleRequest() {

      
    }


}