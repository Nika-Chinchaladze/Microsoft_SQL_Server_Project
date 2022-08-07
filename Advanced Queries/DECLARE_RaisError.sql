-- How to use RaiseError:

DECLARE 
    @Message NVARCHAR(2028), 
    @Severity INT, 
    @State INT,
	@Line INT;

BEGIN TRY
    RAISERROR('By Order Of The Peacky Blinders, ERROR occured!', 17, 5, 16);
END TRY
BEGIN CATCH
    SELECT 
        @Message = ERROR_MESSAGE(), 
        @Severity = ERROR_SEVERITY(), 
        @State = ERROR_STATE(),
		@Line = ERROR_LINE();
    RAISERROR(@Message, @Severity, @State, @Line);
END CATCH;
