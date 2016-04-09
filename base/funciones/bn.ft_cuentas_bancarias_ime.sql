CREATE OR REPLACE FUNCTION "bn"."ft_cuentas_bancarias_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_cuentas_bancarias_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'bn.tcuentas_bancarias'
 AUTOR: 		 (admin)
 FECHA:	        04-04-2016 23:09:22
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
	v_id_cuenta_bancaria	integer;
			    
BEGIN

    v_nombre_funcion = 'bn.ft_cuentas_bancarias_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_CUB_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:22
	***********************************/

	if(p_transaccion='bn_CUB_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into bn.tcuentas_bancarias(
			estado_reg,
			id_banco,
			id_moneda,
			numero_cuenta,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.id_banco,
			v_parametros.id_moneda,
			v_parametros.numero_cuenta,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_cuenta_bancaria into v_id_cuenta_bancaria;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cuentas Bancarias almacenado(a) con exito (id_cuenta_bancaria'||v_id_cuenta_bancaria||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cuenta_bancaria',v_id_cuenta_bancaria::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'bn_CUB_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:22
	***********************************/

	elsif(p_transaccion='bn_CUB_MOD')then

		begin
			--Sentencia de la modificacion
			update bn.tcuentas_bancarias set
			id_banco = v_parametros.id_banco,
			id_moneda = v_parametros.id_moneda,
			numero_cuenta = v_parametros.numero_cuenta,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_cuenta_bancaria=v_parametros.id_cuenta_bancaria;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cuentas Bancarias modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cuenta_bancaria',v_parametros.id_cuenta_bancaria::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'bn_CUB_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:22
	***********************************/

	elsif(p_transaccion='bn_CUB_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from bn.tcuentas_bancarias
            where id_cuenta_bancaria=v_parametros.id_cuenta_bancaria;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Cuentas Bancarias eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_cuenta_bancaria',v_parametros.id_cuenta_bancaria::varchar);
              
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
ALTER FUNCTION "bn"."ft_cuentas_bancarias_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
