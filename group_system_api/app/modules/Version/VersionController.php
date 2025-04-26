<?php

require_once 'app/modules/Version/VersionModel.php';
require_once 'app/utils/ResponseService.php';

class VersionController {

  public function getAny() {

    $baseModuleModel = new VersionModel();
    $baseModuleData = $baseModuleModel->getAny();
    return new ResponseService("Getting All any", $baseModuleData);

  }
}