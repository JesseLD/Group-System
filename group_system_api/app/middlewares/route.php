<?php

$index = 0;

$route = substr($_SERVER['REQUEST_URI'], $index);
$method = $_SERVER['REQUEST_METHOD'];

return [
  "url" => $route,
  "method" => $method
];
