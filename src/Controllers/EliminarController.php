<?php
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response ;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class EliminarController {
    function index (Request $request, Response $response, array $args) {
        //$response->getBody()->write('Soy tienda');
        //return $response;
        $view = Twig::fromRequest($request);
        $params = ['titulo' => 'Pagina slim','msj' => 'Hoka', 'categorias' => '/'];
        return $view->render($response,'eliminar.html',$params);
    }
}

?>