/********************************************I-SCP-MCN-BN-1-8/04/2016********************************************/
CREATE TABLE bn.tbancos (
  id_banco SERIAL,
  nombre VARCHAR(50),
  ciudad varchar(20),
  CONSTRAINT pk_tbancos_id_banco PRIMARY KEY(id_banco)
) INHERITS (pxp.tbase);

CREATE TABLE bn.tcuentas_bancarias (
  id_cuenta_bancaria SERIAL,
  numero_cuenta INTEGER,
  id_moneda INTEGER,
  id_banco integer,
  CONSTRAINT pk_tcuentas_bancarias_id_cuenta_bancaria PRIMARY KEY(id_cuenta_bancaria)
) INHERITS (pxp.tbase);

CREATE TABLE bn.ttipo_mov (
  id_tipo_mov SERIAL,
  codigo varchar(20),
  descripcion varchar, 
  tipo varchar ,
 
   CONSTRAINT pk_ttipo_mov_id_tipo_mov PRIMARY KEY(id_tipo_mov)
) INHERITS (pxp.tbase);

CREATE TABLE bn.tmovimiento_cuenta (
  id_movimiento_cuenta SERIAL,
 glosa varchar,
  tipo varchar ,
 fecha date,
 estado varchar (50),
 id_proceso_wf INTEGER,
 id_estado_wf integer,
 id_tipo_mov integer,
 id_cuenta_bancaria integer,
  CONSTRAINT pk_movimiento_cuenta_id_movimiento_cuenta PRIMARY KEY(id_movimiento_cuenta)
) INHERITS (pxp.tbase)
/********************************************F-SCP-MCN-BN-1-8/04/2016********************************************/