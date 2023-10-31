
echo off

git tag

set /p input="type the tag you want ex(v1.0) : "

git show %input%

git checkout %input%

git describe

pause
