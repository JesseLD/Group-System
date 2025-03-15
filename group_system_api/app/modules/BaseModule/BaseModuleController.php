<?php

require_once 'app/modules/BaseModule/BaseModuleModel.php';
require_once 'app/services/ResponseService.php';

class BaseModuleController {


  public function getAny() {

    $baseModuleModel = new BaseModuleModel();
    $baseModuleData = $baseModuleModel->getAny();
    return new ResponseService("Getting All Users", $baseModuleData);

  }
}