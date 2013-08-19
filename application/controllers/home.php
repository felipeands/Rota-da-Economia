<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {
	
	private $data;
	
	function __construct(){
		
		parent::__construct();
		
		// Load the necessary stuff...
		$this->load->helper(array('language', 'url', 'form', 'account/ssl'));
        $this->load->library(array('account/authentication'));
		$this->load->model(array('account/account_model'));
		$this->lang->load(array('general'));
	}
	
	function index(){

		// print_r($this->config);
		
		//testando Datamapper com tabela produto
		$p = new Produto();
		$p->like('nome','coca');
		$p->get();

		// foreach($p as $obj)
		// 	echo $obj->nome;
		
		maintain_ssl();
		
		if ($this->authentication->is_signed_in()){
			$this->data['account'] = $this->account_model->get_by_id($this->session->userdata('account_id'));
		}
		
		$this->load->view('home/index',$this->data);
	}
}