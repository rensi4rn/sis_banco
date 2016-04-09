CREATE OR REPLACE FUNCTION "bn"."ft_tipo_mov_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_tipo_mov_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'bn.ttipo_mov'
 AUTOR: 		 (admin)
 FECHA:	        08-04-2016 23:03:56
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
	v_id_tipo_mov	integer;
			    
BEGIN

    v_nombre_funcion = 'bn.ft_tipo_mov_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_TPM_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:56
	***********************************/

	if(p_transaccion='bn_TPM_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into bn.ttipo_mov(
			descripcion,
			tipo,
			estado_reg,
			codigo,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.descripcion,
			v_parametros.tipo,
			'activo',
			v_parametros.codigo,
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_tipo_mov into v_id_tipo_mov;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Movimiento almacenado(a) con exito (id_tipo_mov'||v_id_tipo_mov||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_mov',v_id_tipo_mov::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'bn_TPM_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:56
	***********************************/

	elsif(p_transaccion='bn_TPM_MOD')then

		begin
			--Sentencia de la modificacion
			update bn.ttipo_mov set
			descripcion = v_parametros.descripcion,
			tipo = v_parametros.tipo,
			codigo = v_parametros.codigo,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tipo_mov=v_parametros.id_tipo_mov;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Movimiento modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_mov',v_parametros.id_tipo_mov::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'bn_TPM_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:56
	***********************************/

	elsif(p_transaccion='bn_TPM_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from bn.ttipo_mov
            where id_tipo_mov=v_parametros.id_tipo_mov;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Movimiento eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_mov',v_parametros.id_tipo_mov::varchar);
              
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
ALTER FUNCTION "bn"."ft_tipo_mov_ime"(integer, integer, character varying, character varying) OWNER TO postgres;
