@echo off
git tag
FOR /F "tokens=*" %%a IN ('git describe') DO SET output=%%a
set /p input="you are now in %output% , type the tag you want  to move to ex(v1.0) : "

git checkout %input%
git show %input%
git describe
pause
