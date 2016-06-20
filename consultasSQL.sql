-- Crear llave primaria  343 0000	401
ALTER TABLE nombreTabla
ADD CONSTRAINT PK_nombreTabla
PRIMARY KEY NONCLUSTERD (idTabla)
NONCLUSTERD -- quiere decir que es una llave no compuesta
go

	// ****************  \\
	
-- Crear llave primaria agrupada con varios campos
ALTER TABLE nombreTabla
ADD PRIMARY KEY (idTabla1,idTabla2,idTabla3...)
go

	// ****************  \\
--Eliminar una relacion o llave foranea
ALTER TABLE nombreTabla que recibe la relacion
DROP CONSTRAINT FK_nombreRelacion	

	// ****************  \\
-- Crear llaves Foraneas
ALTER TABLE nombreTabla - Tabla que recibe la llave foranea es la que se altera 
ADD CONSTRAINT FK_nombreTablaAlterar_nombreTablaHeredaFK
FOREIGN KEY	(idTabla) REFERENCES nombreTablaHeredaFK (idTabla)
go
	// ****************  \\
	
-- Crear un campo Unico
ALTER TABLE nombreTabla
ADD CONSTRAINT	UQ_nombreTabla_nombreCampo
UNIQUE (nombreCampo)
go

	// ****************  \\
	
-- Agregar un campo en una Tabla
ALTER TABLE nombreTabla
ADD nombreCampo tipo de dato "INTEGER NOT NULL"
go	

	// ****************  \\
	
-- Eliminar un campo de una Tabla
ALTER TABLE nombreTabla
DROP COLUMN nombreCampo
go

	// ****************  \\	
	
-- Modificar el tipo de Campo
ALTER TABLE nombreTabla
ALTER COLUMN nombreCampo "VARCHAR(30)"
go

	// ****************  \\	
	
-- Utilizacion de DEFAULT "Restriccion de DEFAULT"
ALTER TABLE nombreTabla
ADD CONSTRAINT nombreConstraint 
DEFAULT GETDATE() FOR campoEjemplo de tipo FECHA
go	

	// ****************  \\	
--Utilizar DEFAULT -- crear un campo en una tabla por defecto 1	
ALTER TABLE MAIN_FormPayment
ADD estado char(1) NOT NULL
DEFAULT '1'
go	
	// ****************  \\	

	// ****************  \\	
-- Ingresar una restriccion CHECK, Para controlar que no se ingresen fechas mayores a la fecha actual
ALTER TABLE nombreTabla
ADD CONSTRAINT CHK_nombreTabla_nombreCampo
CHECK ( nombreCampo <= getdata() )
go

	// ****************  \\	
-- Crear Variables
DECLARE @carrera varchar -- se declara la variable
SET @carrera=2 -- Se asigna valores a la variable en este caso = 2

	// ****************  \\	
-- Actualizar con Variable
DECLARE @nombreVariable tipoDato = ValorActualizar
UPDATE 	nombreTabla
SET nombreCampo = nombreCampo +- o = @nombreVariable
WHERE YEAR(campoFecha) = 2016 -- YEAR es un ejemplo si queremos actualizar por un campoFecha solo por el año
go
--declare @nombreVariable varchar(30) = 'ING Sistemas'
--update carrera
--set carrera = @nombreVariable
--where id_car=1

	// ****************  \\	
-- Crear procedimiento Almacenado
CREATE PROCEDURE nombreProcedimiento
AS
sentencia a ejecutar -- Ejemplo select carrera from carrera where id_car=1;

	// ****************  \\	
-- Llamar o ejecutar procedimiento
EXECUTE nombreProcedimiento
EXEC nombreProcedimiento

	// ****************  \\	
-- Crear procedimiento Almacenado con parametros de entrada
CREATE PROCEDURE conParametros
@nombre VARCHAR(100), -- varible de tipo strig
@id_car INT	-- variable de tipo integer
AS
SELECT * FROM alumno WHERE nombre=@nombre AND id_car=@id_car -- En la consulta se envian los parametros

	// ****************  \\	
-- Crear procedimiento Almacenado con parametros de Salida
CREATE PROCEDURE paramtroSalida
@nombre VARCHAR (100), -- Parametro entrada
@parametroSalida VARCHAR (100) OUTPUT -- Parametro salida
AS 
SET @parametroSalida = (SELECT nombre FROM alumno WHERE nombre=@nombre)

--Llamar o ejecutar Procedimieto almacenado con parametros de entrada y salida
DECLARE @varibleSalida VARCHAR(100) --Declaramos una variable de salida
EXEC paramtroSalida Fabian, @varibleSalida OUTPUT --Ejecutamos el procedimiento pasando los dos parametros creados, el de entrada y el de salida
SELECT @varibleSalida -- as alias nombre campo  --Mostramos el resultado llamando a la variable o parametro de salida
--Otro Ejemplo 
--create procedure sp_parametrosIf
--@id_car int,
--@nombreCarrera varchar (100) output
--as 
-- set @nombreCarrera = (select carrera from carrera where id_car=@id_car)

-- declare @car varchar (100)
-- exec sp_parametrosIf 2,@car output
-- select @car as nombreCampo

	// ****************  \\	
-- Control de flujo con IF -- Procedimieto almacenado con clausula IF
CREATE PROCEDURE procedimientoIf
@id_car INT
AS 
	IF(@id_car IS NULL) -- Creamos el if y le indicamos que si el parametro que recibe es igual a NULL
		RETURN 0
	ELSE
		RETURN 1
--Llamamos o ejecutamos el procedimiento almacenado
	DECLARE @VariableRetorno INT --Primero debemos crear una variable para mostrar lo que retorna el procedimiento
	EXEC @VariableRetorno = proIf NULL --Ejecutamos el procedimiento y lo igualamos a la varible que retorna los datos y le enviamos el parametro al procedimiento en este caso es NULL
	SELECT @VariableRetorno --Ejecutamos la variable para mostrar lo que retorna

	// ****************  \\	
--Encriptar procedimientos almacenados
	CREATE PROCEDURE procedimientoEncriptado
	@id_car INT
	WITH ENCRYPTION --Codigo para Encriptar los procedimientos almacenados
	AS
	SELECT * FROM alumno where id_car=@id_car

	EXEC procedimientoEncriptado 1 --Llamamos el procedimiento
	SP_HELPTEXT procedimientoEncriptado -- Nos da error al ejecutar por que esta encriptado
	
	// ****************  \\	
--Iformacio de los procedimientos almacenados
	SP_HELP --Muetra todos los Objetos de la base de datos
	SP_HELPTEXT nombreProcedimiento --Describe el procedimiento almacenado
	SP_STORED_PROCEDURES --Muestra todos los procedimiento almacenado
	SP_DEPENDS nombreProcedimiento /* 1) nombre,tipo,campos,etc.. de los objetos de los cuales depende el objeto enviado
									  2) nombre y tipo de los objetos que dependendel objeto nnombredo */
    SELECT * FROM SYSOBJECTS --Muestra nombre y varios datos de todos los Objetos de la base de datos	

-- ## Glosario ## 

UNIQUE 	 => Los campos en una columna sean unicos
CHECK	 => Restrige el rango de valores en una columna
DEFAULT  => Permite registrar un dato en un campo por defecto, la propiedad del campo debe ser NULL
IDENTITY => Campo autoIncrementable
	
