<?php
/**
*@package pXP
*@file gen-MODTipoMov.php
*@author  (admin)
*@date 08-04-2016 23:03:56
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipoMov extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipoMov(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='bn.ft_tipo_mov_sel';
		$this->transaccion='bn_TPM_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipo_mov','int4');
		$this->captura('descripcion','varchar');
		$this->captura('tipo','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('codigo','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTipoMov(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_tipo_mov_ime';
		$this->transaccion='bn_TPM_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipoMov(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_tipo_mov_ime';
		$this->transaccion='bn_TPM_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipo_mov','id_tipo_mov','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('codigo','codigo','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipoMov(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_tipo_mov_ime';
		$this->transaccion='bn_TPM_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipo_mov','id_tipo_mov','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>