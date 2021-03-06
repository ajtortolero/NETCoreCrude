SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.zSp_CreateEmployee') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.zSp_CreateEmployee;
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zSp_CreateEmployee]
(
	@pCode				VARCHAR(10),
	@pName				VARCHAR(50),
	@pLastName			VARCHAR(50),
	@pMobile			VARCHAR(50),
	@pEmail				VARCHAR(50),
	@pContractTypeID	INT,
	@pSalaryBase		DECIMAL(18, 2)
)
AS
BEGIN

	SET FMTONLY OFF;
	SET NOCOUNT ON;

	IF(EXISTS(SELECT 1 FROM [dbo].[Employee] WHERE [Code] = @pCode))
	BEGIN
		RAISERROR ('ERROR: The employee code has exists.', 16, 1)
	END
	ELSE
	BEGIN
		INSERT	INTO [dbo].[Employee]
				(
				[Code],
				[Name],
				[LastName],
				[Mobile],
				[Email],
				[ContractTypeID],
				[SalaryBase]
				)
		VALUES
				(
				@pCode,
				@pName,
				@pLastName,
				@pMobile,
				@pEmail,
				@pContractTypeID,
				@pSalaryBase
				);
	END

	SET NOCOUNT OFF;
END
GO