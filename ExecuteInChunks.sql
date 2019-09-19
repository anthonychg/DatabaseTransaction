--Execute Transaction in Chunks (X Number Rows)
--EXEC-IN-CHUNKS

DECLARE	@MinRowID	INT,
	@MaxRowID	INT,
	@FinalRowID	INT,
	@ChunkSize	INT
			
SET NOCOUNT ON			
			
SET @ChunkSize = 10000
SET @MinRowID = (SELECT MIN(RowID) FROM dbo.TableName (NOLOCK))
SET @FinalRowID = (SELECT MAX(RowID) FROM dbo.TableName (NOLOCK))
WHILE @MinRowID < @FinalRowID
BEGIN
		
SET	@MaxRowID = @MinRowID + @ChunkSize - 1
	
<WORKS>	
WHERE	a.RowID between @MinRowID AND @MaxRowID
--
SET	@MinRowID = @MaxRowID + 1
--
IF	@MinRowID > @FinalRowID
	BREAK
ELSE
	CONTINUE
END
	
SET NOCOUNT OFF
