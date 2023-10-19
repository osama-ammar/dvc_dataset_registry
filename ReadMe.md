## DVC (Data Version Conrol)

- this repo is about using and experiemnting DVC (Data Version Conrol) , which is a powerful MLOps tool in that's used on top of git , it is designed to tackle the challenge of data sets traceability and reproducibility when training data-driven models.

## data
- cats and dogs images used for  CNN classification model 

## Workflow

* make a local directeroy for your dataset and initialize git and dvc in it
 `git init`
 `dvc init `

* git add dataset.dvc  .gitignore  &&  dvc add dataset/folder
- `git init`
- `dvc init `

* commit and make a tag for current state of your dataset 
- `git commit -m "dvc init, add cats vs dogs v1.0, train 1000 imgs, test 800 imgs"`
- `git tag -a "cats_dogs_v1.0" -m "v1.0 cats vs dogs, train set 1000 imgs, test 800 imgs `
- `git push --tags`
- `dvc push`

* consider your dataset is changed (added , modified , deleted ) files , then  
- `git commit -m "adding more images : train 1264 imgs, test 1264 imgs"`
- `git tag -a "cats_dogs_v2.0" -m "v2.0 cats vs dogs, train set 1264 imgs, test 1264 imgs `
- `git push --tags`
- `dvc push`
* now for ex ,we have 2 versions of data : 1-cats_dogs_v1.0		2-cats_dogs_v2.0 , if we want to use them ..
- `dvc import https://github.com/osama-ammar/dvc_dataset_registry  images/cats_vs_dogs`

* to use specefiv version , use dvc update --rev <tag_name> dataset-file.dvc
- `dvc update --rev cats_dogs_v1.0 cats_vs_dogs.dvc`

* you can also make dvc to a python script that runs automatically when dataset is changed

