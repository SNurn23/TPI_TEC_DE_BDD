--------------- TABLA LOG ----------------
CREATE TABLE LOG_TABLA(
	id_log int not null,
	tabla varchar(35) not null,
	operacion varchar(8) not null,
	nuevo_valor text,
	anterior_valor text,
	fecha date not null,
	tiempo Time not null,
	usuario varchar(50) not null,
	PRIMARY KEY(id_log)
)
