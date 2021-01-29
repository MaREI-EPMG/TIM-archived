@echo off
Title 8760TS_RE [  ] [8760TS_RE]
CALL ..\..\GAMS_SrcTIMES.v.4.4.2\VT_GAMS 8760TS_RE ..\GAMS_SrcTIMES.v.4.4.2 GAMSSAVE\8760TS_RE ''  ..\ lo=1
ping -n 3 1.1.1.1 >NUL
START "GDX IMPORT" "C:\VEDA\Veda2.0\Veda.GdxFileHandling.exe" --ModelName "I3p0_ELC_8760TS_1REG_2021.1.25" --User "jason" --CaseName "8760TS_RE" --Folder "C:\VEDA\GAMS_WrkTIMES\8760TS_RE\GAMSSAVE" --study "pilot_runs"
START "LST FILE PARSING" "C:\VEDA\Veda2.0\Veda.LstFileParsing.exe" --ModelName "vfe_i3p0_elc_8760ts_1reg_2021.1.25_jason" --User "jason" --CaseName "8760TS_RE" --Folder "C:\VEDA\GAMS_WrkTIMES\8760TS_RE"
GDX2VEDA GAMSSAVE\8760TS_RE ..\..\GAMS_SrcTIMES.v.4.4.2\times2veda.vdd 8760TS_RE_3001
@echo Closed >RunTerminated
if exist END_GAMS set /p SOLUTIONSTR=<END_GAMS
set result="false"
if "%SOLUTIONSTR%" == "Solve status: Optimal" set result="true"
if "%SOLUTIONSTR%" == "Solve status: Integer solution" set result="true"
if %result% == "true" (
"C:\VEDA\Veda2.0\Veda.VdImport.exe" --ModelName "I3p0_ELC_8760TS_1REG_2021.1.25" --User "jason" --CaseName "8760TS_RE" --File "C:\VEDA\GAMS_WrkTIMES\8760TS_RE\8760TS_RE_3001.vds;;C:\VEDA\GAMS_WrkTIMES\8760TS_RE\8760TS_RE_3001.vd;;C:\VEDA\GAMS_WrkTIMES\8760TS_RE\8760TS_RE_3001.vde" --study "pilot_runs"
)
