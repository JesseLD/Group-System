<?php

/*

  This is a middleware that will validate the API Key. It will check if the API Key is present in the headers and if it is valid.

  If the API Key is valid, the middleware will return a ResponseService object with status code 200 and a message saying that the API Key is valid.

  If the API Key is invalid, the middleware will return a ResponseService object with status code 401 and a message saying that the API Key is invalid.

  If the API Key is missing, the middleware will return a ResponseService object with status code 401 and a message saying that the API Key is missing.
  
  The API Key is stored in the config file.
*/

require_once 'app/utils/ResponseService.php';

function validateApiKeyV1()
{

  if (isset(array_change_key_case(apache_request_headers(), CASE_LOWER)['authorization'])) {

    $authorizationHeader =  array_change_key_case(apache_request_headers(), CASE_LOWER)['authorization'];

    $api_key = $authorizationHeader;

    require_once 'app/config/config.php';

    $valid_api_key = API_KEY;

    if ($api_key != $valid_api_key) {

      return new ResponseService("API Key is invalid", [], 401);
    }
  } else {

    return new ResponseService ("API Key is missing", [], 401);
  }
}
