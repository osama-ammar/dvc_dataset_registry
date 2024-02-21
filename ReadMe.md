## [DVC](https://github.com/iterative/dvc) (Data Version Conrol)

- This repo is about using and experiemnting DVC (Data Version Conrol) , which is a powerful MLOps tool in that's used on top of git , it is designed to tackle the challenge of datasets traceability and reproducibility when training data-driven models.
- I made many Batch files that contain most repeated actions : **setup** , **update** and **select** specefic version of your tracked dataset. you can customize them as you need

## data
* cats and dogs images -just for experimentation- used for  CNN classification model 

## initialize.bat
- used to initialize dvc for a dataset -by default we consider that your dataset is in a folder called **data**
- Actions inside initialize.bat :
   - initialize dvc for your selected location
   - setting remote storage (it can be in your local device or/and you can use gdrive , AWS-S3 , Azure ....
   - adding dataset tou your remote storage and commit changes
   - making a tag for this version as a first version of data  

## update.bat
- when you made any changes to you dataset (modify , delete , add) we run this batch file
- Actions inside update.bat :
   - check for any changes
   - commit changes
   - it asks you whether you want to just commit or make a tage for these changes and the name of this tag
   - push updates to remote storage
     
## select.bat
- it just set or switch you to specefic version of data you want
- Actions inside update.bat :
   - tells you where do you stand now
   - show current tags 
   - asks you to enter the tag you want to switch
   - move to selected tag
     

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

####  you can also make dvc to a python script that runs automatically when dataset is changed

### TODO
- [ ] automating data pipeline (pre/post processing )
- [ ] automating AWS-S3 and gdrive setup 
- [ ] integrate with CML
- [ ] integrate with Dagshub
  
