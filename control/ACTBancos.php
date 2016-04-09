<?php
/**
*@package pXP
*@file gen-ACTBancos.php
*@author  (admin)
*@date 04-04-2016 23:09:18
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTBancos extends ACTbase{    
			
	function listarBancos(){
		$this->objParam->defecto('ordenacion','id_banco');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODBancos','listarBancos');
		} else{
			$this->objFunc=$this->create('MODBancos');
			
			$this->res=$this->objFunc->listarBancos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarBancos(){
		$this->objFunc=$this->create('MODBancos');	
		if($this->objParam->insertar('id_banco')){
			$this->res=$this->objFunc->insertarBancos($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarBancos($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarBancos(){
			$this->objFunc=$this->create('MODBancos');	
		$this->res=$this->objFunc->eliminarBancos($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>