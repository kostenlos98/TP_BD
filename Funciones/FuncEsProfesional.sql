CREATE FUNCTION EsProfesional(@numeroEmpleado INT)

RETURNS INT

AS
	BEGIN
		DECLARE @OK INT

		IF 'profesional' = (SELECT E.funcionEmpleado
						    FROM Empleado E
						    WHERE E.numeroEmpleado = @numeroEmpleado
						   )
			SET @OK = 1
		ELSE
			SET @OK = 0
		
		RETURN @OK
	END;