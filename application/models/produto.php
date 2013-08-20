<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Produto extends CI_Model {
	
	var	$table 		=	"produtos";
	
	function __construct($id=NULL){
		parent::__construct($id);
	}
	
}