<?php
/**
*@package pXP
*@file gen-ACTCuentasBancarias.php
*@author  (admin)
*@date 04-04-2016 23:09:22
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTCuentasBancarias extends ACTbase{    
			
	function listarCuentasBancarias(){
		$this->objParam->defecto('ordenacion','id_cuenta_bancaria');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODCuentasBancarias','listarCuentasBancarias');
		} else{
			$this->objFunc=$this->create('MODCuentasBancarias');
			
			$this->res=$this->objFunc->listarCuentasBancarias($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarCuentasBancarias(){
		$this->objFunc=$this->create('MODCuentasBancarias');	
		if($this->objParam->insertar('id_cuenta_bancaria')){
			$this->res=$this->objFunc->insertarCuentasBancarias($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarCuentasBancarias($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarCuentasBancarias(){
			$this->objFunc=$this->create('MODCuentasBancarias');	
		$this->res=$this->objFunc->eliminarCuentasBancarias($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>