<?php
/**
*@package pXP
*@file gen-MODMovimientoCuenta.php
*@author  (admin)
*@date 08-04-2016 23:03:50
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODMovimientoCuenta extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarMovimientoCuenta(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='bn.ft_movimiento_cuenta_sel';
		$this->transaccion='bn_MVC_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_movimiento_cuenta','int4');
		$this->captura('id_cuenta_bancaria','int4');
		$this->captura('id_estado_wf','int4');
		$this->captura('glosa','varchar');
		$this->captura('id_tipo_mov','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_proceso_wf','int4');
		$this->captura('fecha','date');
		$this->captura('tipo','varchar');
		$this->captura('estado','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarMovimientoCuenta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_movimiento_cuenta_ime';
		$this->transaccion='bn_MVC_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_cuenta_bancaria','id_cuenta_bancaria','int4');
		$this->setParametro('id_estado_wf','id_estado_wf','int4');
		$this->setParametro('glosa','glosa','varchar');
		$this->setParametro('id_tipo_mov','id_tipo_mov','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_proceso_wf','id_proceso_wf','int4');
		$this->setParametro('fecha','fecha','date');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('estado','estado','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarMovimientoCuenta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_movimiento_cuenta_ime';
		$this->transaccion='bn_MVC_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_movimiento_cuenta','id_movimiento_cuenta','int4');
		$this->setParametro('id_cuenta_bancaria','id_cuenta_bancaria','int4');
		$this->setParametro('id_estado_wf','id_estado_wf','int4');
		$this->setParametro('glosa','glosa','varchar');
		$this->setParametro('id_tipo_mov','id_tipo_mov','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_proceso_wf','id_proceso_wf','int4');
		$this->setParametro('fecha','fecha','date');
		$this->setParametro('tipo','tipo','varchar');
		$this->setParametro('estado','estado','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarMovimientoCuenta(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_movimiento_cuenta_ime';
		$this->transaccion='bn_MVC_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_movimiento_cuenta','id_movimiento_cuenta','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>