<?php
require_once './libs/Router.php';
require_once './app/controller/autos.controller.php';

$router = new Router();

// Tabla de routeo
$router->addRoute("autos", "GET", "AutosController", "autos");
$router->addRoute("autos/:ID", "GET", "AutosController", "getAuto");
$router->addRoute("autosAdd", "POST", "AutosController", "addAuto");
$router->addRoute("autos/:ID", "DELETE", "AutosController", "deleteAuto"); 
$router->addRoute("autos/:ID", "PUT", "AutosController", "updateAuto");

$router->setDefaultRoute('AutosController', 'defaultRouter');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);


?>