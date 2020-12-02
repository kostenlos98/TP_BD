BEGIN TRANSACTION
	DECLARE @EmpleadoID int
BEGIN TRY
	--Insertamos el Empleado.
	INSERT INTO [dbo].[Empleado]
           ([nombreEmpleado]
           ,[apellidoEmpleado]
           ,[funcionEmpleado]
           ,[contrasena]
           ,[huellaDactilar])
     VALUES ('nombreEmpleado','apellidoEmpleado','funcionEmpleado','contrasena','huellaDactilar');

	 SET @EmpleadoID = SCOPE_IDENTITY();

	 -- Insertamos como profesional.
	INSERT INTO [dbo].[EmpleadoProfesional]
           ([numeroEmpleado]
           ,[contratacionProfesional]
           ,[numeroEspecialidad])
     VALUES(@EmpleadoID,'contratacionProfesional','numeroEspecialidad');

	--Insertamos como permanente.
	INSERT INTO [dbo].[EmpleadoPermanente]
           ([numeroEmpleado]
           ,[numeroArea])
     VALUES
           (@EmpleadoID,'numeroArea')

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Ha ocurrido un error!'
END CATCH