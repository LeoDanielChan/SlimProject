<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model as Eloquent;

//creamos la clase del modelo y heredamos las propiedades de la clase Modelo
class Productos extends Eloquent{
    protected $table = "productos"; //nombre de la tabla 
    protected $fillable = [
        "nombre","descripcion","categoria","codigo" //campos de la tabla
    ];

    public $timestamps = [];
    
}

?>