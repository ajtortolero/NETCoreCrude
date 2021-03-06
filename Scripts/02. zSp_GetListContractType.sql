SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.zSp_GetListContractType') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.zSp_GetListContractType;
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zSp_GetListContractType]
AS
BEGIN

	SET FMTONLY OFF
	SET NOCOUNT ON

	SELECT	[ContractTypeID],
			[Name]
	FROM	[dbo].[ContractType];
END
GO