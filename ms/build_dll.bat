
IF "%1"=="" GOTO ERROR_EXIT
IF "%1"=="x86" GOTO SET_X86
IF "%1"=="x64" GOTO SET_X64

GOTO ERROR_EXIT

:SET_X86
	set cpu=_X86_
	GOTO BUILD_DLL

:SET_X64
	set cpu=_AMD64_
	GOTO BUILD_DLL

:BUILD_DLL
	msbuild .\stub_dll\stub.vcxproj /m /t:rebuild /p:Platform=%1 /p:Configuration=Release /p:SAMPLE_ARCH=%cpu%
	IF ERRORLEVEL 1 GOTO ERROR_MESSAGE
	msbuild .\source_dll\source.vcxproj /m /t:rebuild /p:Platform=%1 /p:Configuration=Release /p:SAMPLE_ARCH=%cpu%
	IF ERRORLEVEL 1 GOTO ERROR_MESSAGE
	EXIT

:ERROR_EXIT
	echo "Error, pass x86 or x64 arg as first command line argument!"
	EXIT

:ERROR_MESSAGE
	echo "Something was wrong!"
	EXIT 

