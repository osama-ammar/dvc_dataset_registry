## [DVC](https://github.com/iterative/dvc) (Data Version Conrol)

- This repo is about using and experiemnting DVC (Data Version Conrol) , which is a powerful MLOps tool in that's used on top of git , it is designed to tackle the challenge of datasets traceability and reproducibility when training data-driven models.
- I made many Batch files that contain most repeated actions : **setup** , **update** and **select** specefic version of your tracked dataset. you can customize them as you need

## data
* cats and dogs images -just for experimentation- used for  CNN classification model 

## initialize.bat
- used to initialize dvc for a dataset -by default we consider that your dataset is in a folder called **data**
- Actions inside initialize.bat :
   - iinitialize dvc for your selected location
   - setting remote storage (it can be in your local device or you can use gdrive , AWS-S3 , Azure ....
   - adding dataset tou your remote storage and commit changes
   - making a tag for this version as a first version of data  

## making data to be tracked with dvc 
- dvc add data-folder
- git add .dvc/config .dvc/.gitignore

- git commit -m " adding data to the repo"
- git tag -a "data_v1.0  "  -m "adding fiirst version of data with 61 files"
 

## when adding or modifying new data---this sequence should be done
- dvc status
- dvc add data-folder
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

## adding google-drive folder as a remote storage
* make a project in google workspace
* download json file that contain your credentials
* dvc remote modify --local google-drive gdrive_user_email your-email@gmail.com
* dvc remote modify --local google-drive gdrive_service_account true #will order you to type the path of credintials json file
* dvc remote add --default google-drive gdrive://<REMOTE_FOLDER_NAME>

## important dvc commands 
* dvc remote list   #listing current remote storages
* dvc push -r <remote_name> #pushing to specefic remote
* dvc list  #listing files and folders tracked by dvc
