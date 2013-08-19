<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Usuario extends DataMapper{
	
	var	$table 		=	"a3m_account";
	
	var	$has_one	=	array(
		"usuario_detalhe"
	);
	var	$has_many	=	array(
		"usuario_local",
		"lista",
		"permissao_pontuacao",
		"produto",
		"preco",
		"marca",
		"estabelecimento",
		"comentario",
		"sessao"
	);
	
	function __construct(){
		parent::__construct();
	}
	
}
?>