<?php
use Slim\Factory\AppFactory;
use Psr\Http\Message\ResponseInterface as Response ;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use App\Controllers\TiendaController;
use App\Controllers\HomeController;
use App\Controllers\EliminarController;
use App\Controllers\ActualizarController;
use Slim\Views\TwigMiddleware;
use App\Models\Productos;

require __DIR__ . "/vendor/autoload.php";

$capsule = new \Illuminate\Database\Capsule\Manager;
$capsule->addConnection([
    "driver" => "mysql",
    "host"=> "127.0.0.1",
    "port" => "3306",
    "username"=> "root", //nombre de usuario
    "password"=> "", //contraseña
    "database"=> "tienda", //base de datos
    "charsert"=> "utf8",
    "collation"=> "utf8_general_ci",
    "prefix"=> ""
]);

//Hacer globar el capsule
$capsule->setAsGlobal();
//carga el capsule a eloquent
$capsule->bootEloquent();


$app = AppFactory::create();
$twig = Twig::create('Templates', ['cache' => false]);
$app ->add(TwigMiddleware::create($app,$twig));


$app->setBasePath('/slimproject');
$app->get('/home', HomeController::class . ':index');
$app->get('/tienda', TiendaController::class . ':index');
$app->get('/elimProduc', EliminarController::class .':index');
$app->post('/actualProduc', ActualizarController::class .':index');

//$app->get('/', function (Request $request, Response $response, array $args) {
//    $response->getBody()->write('Pasado!');
//    return $response;
//});

//Ingresar un registro
$app->post('/nuevo', function(Request $request, Response $response, array $args){
    $datos = $request->getParsedBody();
    $Producto = new Productos();
    $Producto->nombre = $datos['nombre'];
    $Producto->descripcion = $datos['descripcion'];
    $Producto->categoria = $datos['categoria'];
    $Producto->codigo = $datos['codigo'];
    $Producto->save();
    header("location: home");
});

//eliminar un registro
$app->post('/eliminar', function(Request $request, Response $response, array $args){
    $data = $request->getParsedBody();
    $id = $data['id'];
    $user = Productos::find($id);
    $user->delete();
    header("location: home");
});

//Actualizar un registro
$app->post('/modificar', function(Request $request, Response $response, array $args){
    $datos = $request->getParsedBody();
    $resultado = Productos::find($datos['id']);
    $resultado->nombre = $datos['nombre'];
    $resultado->descripcion = $datos['descripcion'];
    $resultado->categoria = $datos['categoria'];
    $resultado->codigo = $datos['codigo'];
    $resultado->save();
    header('location: home');
});

$app->run();

?>