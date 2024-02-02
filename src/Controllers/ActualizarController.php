<?php
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response ;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use App\Models\Productos;

class ActualizarController {
    function index (Request $request, Response $response, array $args) {
        $view = Twig::fromRequest($request);
        $datos = $request->getParsedBody();
        $id = $datos['id'];
        $params = ['titulo' => 'Pagina slim','msj' => 'Hoka', 'categorias' => '/', 'producto' => $id];
        return $view->render($response,'actualizar.html',$params);
    }
}

?>