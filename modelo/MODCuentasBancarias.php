<?php
/**
*@package pXP
*@file gen-MODCuentasBancarias.php
*@author  (admin)
*@date 04-04-2016 23:09:22
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODCuentasBancarias extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarCuentasBancarias(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='bn.ft_cuentas_bancarias_sel';
		$this->transaccion='bn_CUB_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_cuenta_bancaria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('id_banco','int4');
		$this->captura('id_moneda','int4');
		$this->captura('numero_cuenta','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_ai','int4');
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
			
	function insertarCuentasBancarias(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_cuentas_bancarias_ime';
		$this->transaccion='bn_CUB_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_banco','id_banco','int4');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('numero_cuenta','numero_cuenta','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarCuentasBancarias(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_cuentas_bancarias_ime';
		$this->transaccion='bn_CUB_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_cuenta_bancaria','id_cuenta_bancaria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('id_banco','id_banco','int4');
		$this->setParametro('id_moneda','id_moneda','int4');
		$this->setParametro('numero_cuenta','numero_cuenta','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarCuentasBancarias(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_cuentas_bancarias_ime';
		$this->transaccion='bn_CUB_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_cuenta_bancaria','id_cuenta_bancaria','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>