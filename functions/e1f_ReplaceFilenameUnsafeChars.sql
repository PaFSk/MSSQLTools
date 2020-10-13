SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PaF
-- Create date: 2020-10-13
-- Description:	Replace filename unsafe characters in string
-- =============================================
CREATE FUNCTION dbo.e1f_ReplaceFilenameUnsafeChars
(
	@Filename NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(MAX), @ReplaceChar NVARCHAR(1)

	SET @ReplaceChar = ''

/* Unsafe characters
# pound

% percent

& ampersand

{ left curly bracket

} right curly bracket

\ back slash

< left angle bracket

> right angle bracket

* asterisk

? question mark

/ forward slash

  blank spaces

$ dollar sign

! exclamation point

' single quotes

" double quotes

: colon

@ at sign

+ plus sign

` backtick

| pipe

= equal sign
*/
	SET @Result = @Filename

	SET @Result = REPLACE(@Result, '#', @ReplaceChar)
	SET @Result = REPLACE(@Result, '%', @ReplaceChar)
	SET @Result = REPLACE(@Result, '&', @ReplaceChar)
	SET @Result = REPLACE(@Result, '{', @ReplaceChar)
	SET @Result = REPLACE(@Result, '}', @ReplaceChar)
	SET @Result = REPLACE(@Result, '\', @ReplaceChar)
	SET @Result = REPLACE(@Result, '<', @ReplaceChar)
	SET @Result = REPLACE(@Result, '>', @ReplaceChar)
	SET @Result = REPLACE(@Result, '*', @ReplaceChar)
	SET @Result = REPLACE(@Result, '?', @ReplaceChar)
	SET @Result = REPLACE(@Result, '/', @ReplaceChar)
	SET @Result = REPLACE(@Result, ' ', @ReplaceChar)
	SET @Result = REPLACE(@Result, '$', @ReplaceChar)
	SET @Result = REPLACE(@Result, '!', @ReplaceChar)
	SET @Result = REPLACE(@Result, '''', @ReplaceChar)
	SET @Result = REPLACE(@Result, '"', @ReplaceChar)
	SET @Result = REPLACE(@Result, ':', @ReplaceChar)
	SET @Result = REPLACE(@Result, '@', @ReplaceChar)
	SET @Result = REPLACE(@Result, '+', @ReplaceChar)
	SET @Result = REPLACE(@Result, '`', @ReplaceChar)
	SET @Result = REPLACE(@Result, '|', @ReplaceChar)
	SET @Result = REPLACE(@Result, '=', @ReplaceChar)

	-- Return the result of the function
	RETURN @Result

END
GO

