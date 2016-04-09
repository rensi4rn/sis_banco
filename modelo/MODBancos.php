<?php
/**
*@package pXP
*@file gen-MODBancos.php
*@author  (admin)
*@date 04-04-2016 23:09:18
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODBancos extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarBancos(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='bn.ft_bancos_sel';
		$this->transaccion='bn_BAN_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_banco','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('ciudad','varchar');
		$this->captura('nombre','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_reg','int4');
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
			
	function insertarBancos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_bancos_ime';
		$this->transaccion='bn_BAN_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ciudad','ciudad','varchar');
		$this->setParametro('nombre','nombre','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarBancos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_bancos_ime';
		$this->transaccion='bn_BAN_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_banco','id_banco','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('ciudad','ciudad','varchar');
		$this->setParametro('nombre','nombre','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarBancos(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='bn.ft_bancos_ime';
		$this->transaccion='bn_BAN_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_banco','id_banco','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>