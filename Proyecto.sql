CREATE TABLE run (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	insert_date DATETIME NOT NULL,
	update_date DATETIME NOT NULL,
	value VARCHAR(255) NOT NULL,
	status VARCHAR(255) NOT NULL
);

CREATE TABLE rrss_controllers (
	id_rrss_controllers INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
	nombre VARCHAR (255) NOT NULL,
	fecha_insert_rss_controller DATE NOT NULL,
	fecha_update_rss_controller DATE NOT NULL,
	estado_rrss_controllers BOOLEAN NOT NULL
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
	nombre_sentiment_queue_status_enum VARCHAR (255) NOT NULL,
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
	run_id INTEGER NOT NULL,
  
	FOREIGN KEY (id_rrss) REFERENCES rrss(id_rrss)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
    FOREIGN KEY (run_id) REFERENCES run(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

INSERT INTO rrss_controllers (nombre, fecha_insert_rss_controller, fecha_update_rss_controller, estado_rrss_controllers) VALUES ('twitterEngine',DateTime('now'),DateTime('now'),1);
INSERT INTO rrss (id_rrss_controllers, fecha_insert_rss, fecha_update_rss, nombre_rrss, estado_rrss) VALUES (1,DateTime('now'),DateTime('now'),'twitter',1);

INSERT INTO sentiment_queue_status_enum (fecha_insert_queue_status_enum,fecha_update_queue_status_enum,nombre_sentiment_queue_status_enum,valor_sentiment_queue_status_enum) VALUES (DateTime('now'),DateTime('now'),'ready',1), (DateTime('now'),DateTime('now'),'completed',2), (DateTime('now'),DateTime('now'),'cancelled',3);