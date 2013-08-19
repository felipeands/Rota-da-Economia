<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Preco extends DataMapper{
	
	var	$table 		=	"precos";
	
	var	$has_one	=	array(
		"produto",
		"estabelecimento",
		"usuario"
	);
	var	$has_many	=	array(
		"comentario"
	);
	
	function __construct(){
		parent::__construct();
	}
	
}
?>