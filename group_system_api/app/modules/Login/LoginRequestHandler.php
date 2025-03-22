<?php

$jsonData = file_get_contents("php://input");

$decoded = json_decode($jsonData, true);

function validateLogin($decoded)
{
  $requiredFields = [
    "email",
    "password",
  ];

  foreach ($requiredFields as $field) {
    if (!isset($decoded[$field])) {
      return new ResponseService("Invalid request. Missing field: $field", [], 400);
    }
  }
}

return $decoded;