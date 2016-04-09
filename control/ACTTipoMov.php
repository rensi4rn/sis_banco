<?php
/**
*@package pXP
*@file gen-ACTTipoMov.php
*@author  (admin)
*@date 08-04-2016 23:03:56
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipoMov extends ACTbase{    
			
	function listarTipoMov(){
		$this->objParam->defecto('ordenacion','id_tipo_mov');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipoMov','listarTipoMov');
		} else{
			$this->objFunc=$this->create('MODTipoMov');
			
			$this->res=$this->objFunc->listarTipoMov($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipoMov(){
		$this->objFunc=$this->create('MODTipoMov');	
		if($this->objParam->insertar('id_tipo_mov')){
			$this->res=$this->objFunc->insertarTipoMov($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipoMov($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipoMov(){
			$this->objFunc=$this->create('MODTipoMov');	
		$this->res=$this->objFunc->eliminarTipoMov($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>