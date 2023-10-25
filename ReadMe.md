## DVC (Data Version Conrol)

- this repo is about using and experiemnting DVC (Data Version Conrol) , which is a powerful MLOps tool in that's used on top of git , it is designed to tackle the challenge of data sets traceability and reproducibility when training data-driven models.

## data
#### cats and dogs images used for  CNN classification model 

## Workflow
- git init 
- dvc init 
- dvc remote add -d  .  D:\datasets\dvc-data-remote

## making data to be tracked with dvc 
- dvc add data
- git add .dvc/config .dvc/.gitignore

- git commit -m " adding data to the repo"
- git tag -a "data_v1.0  "  -m "adding fiirst version of data with 61 files"
 
## pushing data to remote repo
- dvc push
- dvc status

## adding more data and run
- dvc status

## when adding or modifying new data---this sequence should be done
- dvc add data
- git add data.dvc .dvc/config
- git commit -m " adding data to the repo"
- git tag -a "data_v1.0  "  -m "making a new version of data with more files"
- git push --tag
- dvc push

## selecting speceic tag -version- of data
- git tag	#to know available tags 
- git describe --tags --abbrev=0	#to know current tag
- git checkout v1.0 #standing in the tag you want 
- dvc pull	# pulling this tag 


####  you can also make dvc to a python script that runs automatically when dataset is changed

