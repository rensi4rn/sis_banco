CREATE OR REPLACE FUNCTION "bn"."ft_bancos_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_bancos_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'bn.tbancos'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'bn.ft_bancos_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_BAN_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:18
	***********************************/

	if(p_transaccion='bn_BAN_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						ban.id_banco,
						ban.estado_reg,
						ban.ciudad,
						ban.nombre,
						ban.fecha_reg,
						ban.usuario_ai,
						ban.id_usuario_reg,
						ban.id_usuario_ai,
						ban.id_usuario_mod,
						ban.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from bn.tbancos ban
						inner join segu.tusuario usu1 on usu1.id_usuario = ban.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ban.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'bn_BAN_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		04-04-2016 23:09:18
	***********************************/

	elsif(p_transaccion='bn_BAN_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_banco)
					    from bn.tbancos ban
					    inner join segu.tusuario usu1 on usu1.id_usuario = ban.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = ban.id_usuario_mod
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
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
ALTER FUNCTION "bn"."ft_bancos_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
