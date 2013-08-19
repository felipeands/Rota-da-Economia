<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Marca extends DataMapper{
	
	var	$table 		=	"marcas";
	
	var	$has_one	=	array(
		"usuario"
	);
	var	$has_many	=	array(
		"comentario",
		"tag_item",
		"imagem"
	);
	
	function __construct(){
		parent::__construct();
	}
	
}