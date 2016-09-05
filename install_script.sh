#!/bin/bash

# how to use:
# chmod +x install_script.sh
# cd to your project folder
# run {path_to_this_folder}/install_script.sh -p={project_dir}

#Parse arguments
for i in "$@"
do
case $i in
    -p=*|--path=*)
    SOURCE_PATH="${i#*=}"
    ;;
esac
done

if [ -z $SOURCE_PATH ]       
then
  echo "ERROR: SOURCE_PATH empty. Terminated!"
  echo "Run: install_script.sh -p={project_dir} please!"
  exit 1
fi 

echo "# remove old installed files"
rm -rf "${SOURCE_PATH}/.rules"
rm -rf "${SOURCE_PATH}/.oclint"
rm -rf "${SOURCE_PATH}/analysis_script.sh"

echo "# copy current .oclint, .rules, analysis_script.sh to your project folder"
cp -r .rules "${SOURCE_PATH}/.rules"
cp .oclint "${SOURCE_PATH}/.oclint"
cp analysis_script.sh "${SOURCE_PATH}/analysis_script.sh"
echo "Done..!"

echo "# please edit analysis_scripts.sh to use your own xcworkspace and scheme configuration on your project directory"
