CREATE TABLE rrss_controllers (
	id_rrss_controllers INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	nombre VARCHAR (255) NOT NULL,
	fecha_insert_rss_controller DATE NOT NULL,
	fecha_update_rss_controller DATE NOT NULL,
	estado_rrss_controllers BOOLEAN NOT NULL,
	fecha_rrss_controllers TEXT NOT NULL
);

CREATE TABLE rrss (
	id_rrss INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
	id_rrss_controllers INTEGER NOT NULL,
	fecha_insert_rss DATE NOT NULL,
	fecha_update_rss DATE NOT NULL,
	nombre_rrss VARCHAR NOT NULL,
	estado_rrss BOOLEAN NOT NULL,
	fecha_rrss TEXT NOT NULL,

	FOREIGN KEY (id_rrss_controllers) REFERENCES rrss_controllers(id_rrss_controllers)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE sentiment_queue_status_enum (
	id_sentiment_queue_status_enum INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
	fecha_insert_queue_status_enum DATE NOT NULL,
	fecha_update_queue_status_enum DATE NOT NULL,
	nombre_ sentiment_queue_status_enum VARCHAR (255) NOT NULL,
	valor_sentiment_queue_status_enum  VARCHAR (255) NOT NULL
);

CREATE TABLE sentiment_queue (
	id_sentiment_queue INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	id_rrss INTEGER NOT NULL,
	fecha_insert_sentiment_queue DATE,
	fecha_update_sentiment_queue DATE,
	texto_evaluacion_sentiment_queue TEXT NOT NULL,
	puntaje_sentiment_queue INTEGER NULL,
	estado_id_sentiment_queue NOT NULL,
	descripcion_error_sentiment_queue VARCHAR(255) NULL,
  
	FOREIGN KEY (id_rrss) REFERENCES rrss(id_rrss)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
