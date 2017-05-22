rem BUILD AND RUN for DOS Box

@echo off
tasm /m5 /z /zi %1.asm
tlink /x /t %1
del %1.obj 2>&1 >nul
%1.com
