@echo off


echo confirm that you customized this batch file for this action (change target name , tag name , commit message..) .
pause

set /p response=Enter your response (y,n):

if "%response%"=="n" (
   echo edit this file then re-run again.
   
) else if "%response%"=="y" (

echo updating , comitting , tagging and pushing updates.
dvc add data-folder
git add data.dvc .dvc/config
git commit -m " adding data to the repo"
git tag -a "data_v1.0  "  -m "making a new version of data with more files"
git push --tag
dvc push

)

:end

pause

