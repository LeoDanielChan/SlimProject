<?php
namespace App\Controllers;

use App\Models\Productos;
use Psr\Http\Message\ResponseInterface as Response ;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;


class HomeController {
    function index (Request $request, Response $response, array $args) {
        $view = Twig::fromRequest($request);
        $pro = Productos::get();
        $params = ['titulo' => 'Pagina slim','msj' => 'Hoka', 'categorias' => 'home', 'productos' => $pro];
        //$response->getBody()->write('Mensaje desde control!');
        //return $response;
        return $view->render($response,'home.html',$params);
    }
}

?>