
dvc add data
git add .gitignore data.dvc
dvc config core.autostage true


set /p input="Enter commmit message: "
echo You entered: %input%
git commit -m  %input% 

set /p tag_ques="Do you want to tag this commit (y,n) ?: "

if "%tag_ques%" == "y"
	(
	echo off
	set /p tag_input="Enter tag name ex(stls-v1.0) : "
	echo You entered: %tag_input%
	set /p tag_message="Enter tag message  ex(stls-v1.0) : "
	git tag -a %tag_input"% -m %tag_message%
	)


dvc status
dvc push
dvc status
pause
