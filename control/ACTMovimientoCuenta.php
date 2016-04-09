<?php
/**
*@package pXP
*@file gen-ACTMovimientoCuenta.php
*@author  (admin)
*@date 08-04-2016 23:03:50
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTMovimientoCuenta extends ACTbase{    
			
	function listarMovimientoCuenta(){
		$this->objParam->defecto('ordenacion','id_movimiento_cuenta');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODMovimientoCuenta','listarMovimientoCuenta');
		} else{
			$this->objFunc=$this->create('MODMovimientoCuenta');
			
			$this->res=$this->objFunc->listarMovimientoCuenta($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarMovimientoCuenta(){
		$this->objFunc=$this->create('MODMovimientoCuenta');	
		if($this->objParam->insertar('id_movimiento_cuenta')){
			$this->res=$this->objFunc->insertarMovimientoCuenta($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarMovimientoCuenta($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarMovimientoCuenta(){
			$this->objFunc=$this->create('MODMovimientoCuenta');	
		$this->res=$this->objFunc->eliminarMovimientoCuenta($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>