SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.zSp_GetListEmployee') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.zSp_GetListEmployee;
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zSp_GetListEmployee]
AS
BEGIN

	SET FMTONLY OFF;
	SET NOCOUNT ON;

	SELECT	emp.[EmployeeID],
			emp.[Code],
			emp.[Name],
			emp.[LastName],
			emp.[Mobile],
			ISNULL(emp.[Email], '') AS Email,
			emp.[ContractTypeID],
			emp.[SalaryBase],
			CASE	WHEN emp.[ContractTypeID] = 1 THEN 120 * emp.[SalaryBase] * 12
					WHEN emp.[ContractTypeID] = 2 THEN emp.[SalaryBase] * 12
					ELSE 0 
			END		AS SalaryAmount
	FROM	[dbo].[Employee]		AS emp
	INNER	JOIN dbo.[ContractType]	AS con ON emp.[ContractTypeID] = con.[ContractTypeID];

	SET NOCOUNT OFF;
END
GO