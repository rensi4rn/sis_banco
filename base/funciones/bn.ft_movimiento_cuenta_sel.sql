CREATE OR REPLACE FUNCTION "bn"."ft_movimiento_cuenta_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Banco
 FUNCION: 		bn.ft_movimiento_cuenta_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'bn.tmovimiento_cuenta'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'bn.ft_movimiento_cuenta_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'bn_MVC_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:50
	***********************************/

	if(p_transaccion='bn_MVC_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						mvc.id_movimiento_cuenta,
						mvc.id_cuenta_bancaria,
						mvc.id_estado_wf,
						mvc.glosa,
						mvc.id_tipo_mov,
						mvc.estado_reg,
						mvc.id_proceso_wf,
						mvc.fecha,
						mvc.tipo,
						mvc.estado,
						mvc.id_usuario_reg,
						mvc.fecha_reg,
						mvc.usuario_ai,
						mvc.id_usuario_ai,
						mvc.fecha_mod,
						mvc.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from bn.tmovimiento_cuenta mvc
						inner join segu.tusuario usu1 on usu1.id_usuario = mvc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mvc.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'bn_MVC_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		08-04-2016 23:03:50
	***********************************/

	elsif(p_transaccion='bn_MVC_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_movimiento_cuenta)
					    from bn.tmovimiento_cuenta mvc
					    inner join segu.tusuario usu1 on usu1.id_usuario = mvc.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = mvc.id_usuario_mod
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
ALTER FUNCTION "bn"."ft_movimiento_cuenta_sel"(integer, integer, character varying, character varying) OWNER TO postgres;
