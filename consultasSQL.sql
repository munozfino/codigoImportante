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
-- Crear procedimiento Almacenado con parametros
CREATE PROCEDURE conParametros
@nombre VARCHAR(100), -- varible de tipo strig
@id_car INT	-- variable de tipo integer
AS
SELECT * FROM alumno WHERE nombre=@nombre AND id_car=@id_car -- En la consulta se envian los parametros


-- ## Glosario ## 

UNIQUE 	 => Los campos en una columna sean unicos
CHECK	 => Restrige el rango de valores en una columna
DEFAULT  => Permite registrar un dato en un campo por defecto, la propiedad del campo debe ser NULL
IDENTITY => Campo autoIncrementable
	
