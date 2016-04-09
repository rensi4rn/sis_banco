/********************************************I-DAT-MCN-BN-0-8/04/2016********************************************/


select pxp.f_insert_tgui ('BANCO', '', 'bn', 'si', 1, '', 1, '', '', 'bn');
select pxp.f_insert_tgui ('Banco', 'banco', 'BAN', 'si', 1, 'sis_banco/vista/bancos/Bancos.php', 2, '', 'Bancos', 'bn');
select pxp.f_insert_tgui ('Cuentas Bancarias', 'cuentas bancarias', 'CUB', 'si', 2, 'sis_banco/vista/cuentas_bancarias/CuentasBancarias.php', 2, '', 'CuentasBancarias', 'bn');
select pxp.f_insert_tgui ('Movimiento de Cuenta', 'moviento de cuenta', 'mdc', 'si', 3, 'sis_banco/vista/movimiento_cuenta/MovimientoCuenta.php', 2, '', 'MovimientoCuenta', 'bn');
select pxp.f_insert_tgui ('Tipo de Movimiento', 'tipo movimiento', 'tmv', 'si', 4, 'sis_banco/vista/tipo_mov/TipoMov.php', 2, '', 'TipoMov', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_bancos_ime', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_bancos_sel', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_cuentas_bancarias_sel', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_cuentas_bancarias_ime', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_movimiento_cuenta_ime', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_movimiento_cuenta_sel', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_tipo_mov_ime', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tfuncion ('bn.ft_tipo_mov_sel', 'Funcion para tabla     ', 'bn');
select pxp.f_insert_tprocedimiento ('bn_BAN_INS', 'Insercion de registros', 'si', '', '', 'bn.ft_bancos_ime');
select pxp.f_insert_tprocedimiento ('bn_BAN_MOD', 'Modificacion de registros', 'si', '', '', 'bn.ft_bancos_ime');
select pxp.f_insert_tprocedimiento ('bn_BAN_ELI', 'Eliminacion de registros', 'si', '', '', 'bn.ft_bancos_ime');
select pxp.f_insert_tprocedimiento ('bn_BAN_SEL', 'Consulta de datos', 'si', '', '', 'bn.ft_bancos_sel');
select pxp.f_insert_tprocedimiento ('bn_BAN_CONT', 'Conteo de registros', 'si', '', '', 'bn.ft_bancos_sel');
select pxp.f_insert_tprocedimiento ('bn_CUB_SEL', 'Consulta de datos', 'si', '', '', 'bn.ft_cuentas_bancarias_sel');
select pxp.f_insert_tprocedimiento ('bn_CUB_CONT', 'Conteo de registros', 'si', '', '', 'bn.ft_cuentas_bancarias_sel');
select pxp.f_insert_tprocedimiento ('bn_CUB_INS', 'Insercion de registros', 'si', '', '', 'bn.ft_cuentas_bancarias_ime');
select pxp.f_insert_tprocedimiento ('bn_CUB_MOD', 'Modificacion de registros', 'si', '', '', 'bn.ft_cuentas_bancarias_ime');
select pxp.f_insert_tprocedimiento ('bn_CUB_ELI', 'Eliminacion de registros', 'si', '', '', 'bn.ft_cuentas_bancarias_ime');
select pxp.f_insert_tprocedimiento ('bn_MVC_INS', 'Insercion de registros', 'si', '', '', 'bn.ft_movimiento_cuenta_ime');
select pxp.f_insert_tprocedimiento ('bn_MVC_MOD', 'Modificacion de registros', 'si', '', '', 'bn.ft_movimiento_cuenta_ime');
select pxp.f_insert_tprocedimiento ('bn_MVC_ELI', 'Eliminacion de registros', 'si', '', '', 'bn.ft_movimiento_cuenta_ime');
select pxp.f_insert_tprocedimiento ('bn_MVC_SEL', 'Consulta de datos', 'si', '', '', 'bn.ft_movimiento_cuenta_sel');
select pxp.f_insert_tprocedimiento ('bn_MVC_CONT', 'Conteo de registros', 'si', '', '', 'bn.ft_movimiento_cuenta_sel');
select pxp.f_insert_tprocedimiento ('bn_TPM_INS', 'Insercion de registros', 'si', '', '', 'bn.ft_tipo_mov_ime');
select pxp.f_insert_tprocedimiento ('bn_TPM_MOD', 'Modificacion de registros', 'si', '', '', 'bn.ft_tipo_mov_ime');
select pxp.f_insert_tprocedimiento ('bn_TPM_ELI', 'Eliminacion de registros', 'si', '', '', 'bn.ft_tipo_mov_ime');
select pxp.f_insert_tprocedimiento ('bn_TPM_SEL', 'Consulta de datos', 'si', '', '', 'bn.ft_tipo_mov_sel');
select pxp.f_insert_tprocedimiento ('bn_TPM_CONT', 'Conteo de registros', 'si', '', '', 'bn.ft_tipo_mov_sel');

/********************************************F-DAT-MCN-BN-0-8/04/2016********************************************/





