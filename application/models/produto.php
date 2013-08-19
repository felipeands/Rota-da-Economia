<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Produto extends DataMapper{
	
	var	$table 		=	"produtos";
	
	var	$has_one	=	array(
		"secao",
		"marca",
		"usuario"
	);
	var	$has_many	=	array(
		"tag_item",
		"preco",
		"comentario",
		"lista_item"
	);
	
	function __construct($id=NULL){
		parent::__construct($id);
	}
	
}