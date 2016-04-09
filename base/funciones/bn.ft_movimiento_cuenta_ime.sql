CREATE OR REPLACE FUNCTION "bn"."ft_movimiento_cuenta_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_movimiento_cuenta_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'bn.tmovimiento_cuenta'
 AUTOR: 		 (admin)
 FECHA:	        08-04-2016 23:03:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_movimiento_cuenta	integer;
			    
BEGIN

    v_nombre_funcion = 'bn.ft_movimiento_cuenta_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_MVC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:50
	***********************************/

	if(p_transaccion='bn_MVC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into bn.tmovimiento_cuenta(
			id_cuenta_bancaria,
			id_estado_wf,
			glosa,
			id_tipo_mov,
			estado_reg,
			id_proceso_wf,
			fecha,
			tipo,
			estado,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.id_cuenta_bancaria,
			v_parametros.id_estado_wf,
			v_parametros.glosa,
			v_parametros.id_tipo_mov,
			'activo',
			v_parametros.id_proceso_wf,
			v_parametros.fecha,
			v_parametros.tipo,
			v_parametros.estado,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_movimiento_cuenta into v_id_movimiento_cuenta;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movimiento Cuenta almacenado(a) con exito (id_movimiento_cuenta'||v_id_movimiento_cuenta||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_movimiento_cuenta',v_id_movimiento_cuenta::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'bn_MVC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:50
	***********************************/

	elsif(p_transaccion='bn_MVC_MOD')then

		begin
			--Sentencia de la modificacion
			update bn.tmovimiento_cuenta set
			id_cuenta_bancaria = v_parametros.id_cuenta_bancaria,
			id_estado_wf = v_parametros.id_estado_wf,
			glosa = v_parametros.glosa,
			id_tipo_mov = v_parametros.id_tipo_mov,
			id_proceso_wf = v_parametros.id_proceso_wf,
			fecha = v_parametros.fecha,
			tipo = v_parametros.tipo,
			estado = v_parametros.estado,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_movimiento_cuenta=v_parametros.id_movimiento_cuenta;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movimiento Cuenta modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_movimiento_cuenta',v_parametros.id_movimiento_cuenta::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'bn_MVC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:50
	***********************************/

	elsif(p_transaccion='bn_MVC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from bn.tmovimiento_cuenta
            where id_movimiento_cuenta=v_parametros.id_movimiento_cuenta;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movimiento Cuenta eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_movimiento_cuenta',v_parametros.id_movimiento_cuenta::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "bn"."ft_movimiento_cuenta_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
