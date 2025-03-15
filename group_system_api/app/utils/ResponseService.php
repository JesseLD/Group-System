<?php

/**
 * 
 * This class is responsible for sending the response to the client in JSON format.
 * 
 * The send method will send the response to the client and terminate the script.
 * 
 * It will set the HTTP status code, the success status, the message and the data to be sent.
 * 
 * 
 */

class ResponseService
{
  public $httpCode;
  public $success;
  public $message;
  public $exception;
  public $data;

  public function __construct( $message, $data = [], $httpCode = 200, $exception = null)
  {
    $this->httpCode = $httpCode;
    $this->message = $message;
    $this->exception = $exception;
    $this->data = $data;
    $this->send();
  }

  public function send()
  {
    header('Content-Type: application/json');
    http_response_code($this->httpCode);
    if ($this->exception != null) {
      echo json_encode(array(
        "message" => $this->message,
        "data" => $this->data,
        "exception" => $this->exception
      ));
      exit;
    } else {

      echo json_encode(array(
        "message" => $this->message,
        "data" => $this->data,
      ));
      exit;
    }
  }
}
