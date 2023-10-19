conda create --name data_registry python=3.9 -y
conda activate data_registry
pip install dvc

######################################################################################

mkdir D:\Code_store\dvc_dataset_registry
cd D:\Code_store\dvc_dataset_registry

# dvc is used with git 
git init
dvc init
git reset	#....

######################################################################################
dvc remote add -d .  /mnt/data_partition/data_registry
git add .dvc/config .dvc/.gitignore
git commit -m "init dvc remote storage"

dvc get https://github.com/iterative/dataset-registry tutorials/versioning/data.zip

######################################################################################
#organizing newly added data
unzip -q data.zip -d images
mv D:/Code_store/dvc_dataset_registry/images/data  D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs
mv D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs/validation  D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs/test
rm -f data.zip

######################################################################################
dvc add D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs
git add D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs.dvc images/.gitignore
git commit -m "dvc init, add cats vs dogs v1.0, train 1000 imgs, test 800 imgs"


# tagging a checkpoint for data to return to it later easily if needed
git tag -a "cats_dogs_v1.0" -m "v1.0 cats vs dogs, train set 1000 imgs, test 800 imgs"
dvc push

dvc get https://github.com/iterative/dataset-registry  tutorials/versioning/new-labels.zip

######################################################################################
# organizing newly added data
unzip -q new-labels.zip
rm -f new-labels.zip
mv data/train/cats/*  D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs/train/cats/
mv data/train/dogs/* D:/Code_store/dvc_dataset_registry/images/cats_vs_dogs/train/dogs/
rm -rf data

######################################################################################
#we are noticing that after making a change with dvc , we commit this change with git
dvc add images/cats_vs_dogs
git add images/cats_vs_dogs.dvc
git commit -m "Add 1000 images cats vs dogs train, 2000 images in total"
git tag -a "cats_dogs_v2.0" -m "v2.0 cats vs dogs, train 2000 imgs, test 800 imgs"
git push --tags
dvc push
# Now we have 2 versions -tags- of data : 1-cats_dogs_v1.0		2-cats_dogs_v2.0

#  dvc import command will import the latest commit on the master/main branch. It is equivalent to dvc get + dvc add
dvc import https://github.com/osama-ammar/dvc_dataset_registry  images/cats_vs_dogs

######################################################################################
#“dvc update” command instead of “dvc checkout” as checkout only uses your downstream project
# commit info. The data registry relies on a local file storage that does not need specific authentication, so you can just directly update your data set.
dvc update --rev cats_dogs_v1.0 cats_vs_dogs.dvc
######################################################################################


######################################################################################



######################################################################################



######################################################################################