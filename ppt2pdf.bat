@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

IF [%1]==[] (
	SET /P "inp=Input: "
) ELSE (
	SET "inp=%1"
)

IF [%2]==[] (
	SET /P "out=Output: "
) ELSE (
	SET "out=%2"
)

IF NOT EXIST "%inp%" (
	ECHO - Unable to find %inp%
	GOTO :END
)

IF EXIST "%inp%\*" (
	FOR %%i in ("%inp%\*.pp*") do CSCRIPT D:\ppt2pdf.vbs "%%i" "%out%"\"%%~ni".pdf
) ELSE (
	CSCRIPT D:\ppt2pdf.vbs "%inp%" "%out%"
)

IF NOT EXIST "%out%" (
	ECHO Unknown Error! Failed to convert!
	GOTO :END
)

ECHO Done!
:END
PAUSE