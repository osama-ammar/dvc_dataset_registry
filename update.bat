@echo off
REM allows for delayed evaluation of variable values within blocks or loops. because in batch scripting , variable replacement occurs at runtime, meaning the value of a variable can change during script execution
setlocal enabledelayedexpansion

echo data and tracking it.....
dvc add data
git add .gitignore data.dvc 

echo commiting the current state.....
set /p input="Enter commmit message: "
echo You entered: %input%
git commit -m  "%input%" 

echo pushing current data state to dvc default remote....
dvc status
dvc push

echo checking if user want to tag the current state or not....
set /p tag_ques="Do you want to tag this commit (y,n) ?:"
IF "%tag_ques%" == "y" (
	echo You entered: !tag_ques!

	set /p tag_input="Enter tag name ex(stls-v1.0) : "
	echo tag name : "!tag_input!"

	set /p tag_message="Enter tag message  ex(stls-v1.0) : "
	echo tag message : "!tag_message!"
	git tag -a "!tag_input!" -m "!tag_message!" 
)


REM viweing current dvc status
dvc status
pause


