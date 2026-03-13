@echo off
cd /d "%~dp0"

echo Running optimized LaTeX compilation...

:: Set environment variables for improved performance
set max_print_line=1000
set openout_any=a
set error_line=254
set half_error_line=238

:: First pass
lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape "main.tex"
if errorlevel 1 echo [WARN] First LuaLaTeX pass reported issues. Continuing...

:: Run Biber
biber "main"
if errorlevel 1 echo [WARN] Biber reported issues. Continuing...

:: Second pass
lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape "main.tex"
if errorlevel 1 echo [WARN] Second LuaLaTeX pass reported issues. Continuing...

:: Final pass
lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape "main.tex"
if errorlevel 1 echo [WARN] Final LuaLaTeX pass reported issues.

echo Compilation complete!
exit /b 0
