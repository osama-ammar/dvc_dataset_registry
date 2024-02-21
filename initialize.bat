git init 
dvc init 
dvc remote add -d  local_storage  D:\your\local\storage\path

#AWS S3 stuff
# first, create aws user , creat a folder in S3 , install AWS CLI in your device 
# for more details....(https://dvc.org/doc/user-guide/data-management/remote-storage/amazon-s3)
#dvc remote add  aws_remote_storage  s3://your/aws-s3/path
#dvc remote modify aws_remote_storage version_aware true

#Gdrive stuff
# create a folder in your google drive , get its ID
# Authenticate with Google Drive API (https://dvc.org/doc/user-guide/data-management/remote-storage/google-drive#using-a-custom-google-cloud-project-recommended)
#dvc remote add  gdrive_remote_storage gdrive://your-gdrive-link 
#dvc remote modify gdrive_remote_storage gdrive_client_id .............
#dvc remote modify gdrive_remote_storage gdrive_client_secret ..............

dvc add images #or your folder name
git add .gitignore data.dvc
dvc config core.autostage true

git commit -m " adding first version of data "
git tag -a "v1.0"  -m "adding first version of data "

dvc status
dvc push
pause

