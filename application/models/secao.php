<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Secao extends CI_Model {
	
	private	$table 		=	"secoes";
	
	function __construct($id=NULL){
		parent::__construct($id);
	}
	
	public function getAllRecursive(){
		
		$this->db->select('s.*','i.arquivo');
		$this->db->from($this->table.' s');
		
		//$this->db->join('imagens i','i.relativo_id = s.id','left');
		//$this->db->where('i.relativo_tabela',$this->table);
		
		$query = $this->db->get();
		$result = $query->result();
		
		return $result;
		
	}
	
	public function getByNode($secao_id){
		
		$this->db->select('s.*','i.arquivo');
		$this->db->from($this->table.' s');
		$this->db->where('secao_id', $secao_id);
		
		$query = $this->db->get();
		$result = $query->result();
		
		return $result;
		
		
	}
	
}