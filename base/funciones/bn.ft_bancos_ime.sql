CREATE OR REPLACE FUNCTION "bn"."ft_bancos_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_bancos_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'bn.tbancos'
 AUTOR: 		 (admin)
 FECHA:	        04-04-2016 23:09:18
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
	v_id_banco	integer;
			    
BEGIN

    v_nombre_funcion = 'bn.ft_bancos_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_BAN_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:18
	***********************************/

	if(p_transaccion='bn_BAN_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into bn.tbancos(
			estado_reg,
			ciudad,
			nombre,
			fecha_reg,
			usuario_ai,
			id_usuario_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			'activo',
			v_parametros.ciudad,
			v_parametros.nombre,
			now(),
			v_parametros._nombre_usuario_ai,
			p_id_usuario,
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_banco into v_id_banco;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Bancos almacenado(a) con exito (id_banco'||v_id_banco||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_banco',v_id_banco::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'bn_BAN_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:18
	***********************************/

	elsif(p_transaccion='bn_BAN_MOD')then

		begin
			--Sentencia de la modificacion
			update bn.tbancos set
			ciudad = v_parametros.ciudad,
			nombre = v_parametros.nombre,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_banco=v_parametros.id_banco;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Bancos modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_banco',v_parametros.id_banco::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'bn_BAN_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:18
	***********************************/

	elsif(p_transaccion='bn_BAN_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from bn.tbancos
            where id_banco=v_parametros.id_banco;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Bancos eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_banco',v_parametros.id_banco::varchar);
              
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
ALTER FUNCTION "bn"."ft_bancos_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
