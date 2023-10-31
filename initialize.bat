git init 
dvc init 
dvc remote add -d  remote-name  D:\cases_dicom\local-dvc-storage

dvc add data
git add .gitignore data.dvc
dvc config core.autostage true

git commit -m " adding first version of data "
git tag -a "mesh&sttl_v1.0  "  -m "adding first version of data with 61 files"

dvc status
dvc push
pause

