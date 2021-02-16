#!/bin/bash
# A simple script to rename files and move them up one level in the directory

# Get path name


dir=$(pwd)

PATH_TO_TRAIN="$dir/SecondDataset/train/"
PATH_TO_TEST="$dir/SecondDataset/test/"

echo $PATH_TO_TRAIN
echo $PATH_TO_TEST


# D is full path to subdirectory
for D in `find $PATH_TO_TRAIN -type d`
do
    # get name of subdirectory
    dir_name=$(basename $D) 
    # for every file in subdirectory
    for f in $D/*.*; do
        # check if file starts with certain string value
        old_file=$f
        echo "Examining file $old_file"      
        if [[ $(basename $old_file) == mask* ]] ;
        then
            # it is mask then; create name
            new_file=$(dirname $(dirname $old_file))/$dir_name"_mask.nii.gz"
            mv $old_file $new_file
        else
            # it is data then; create name
            new_file=$(dirname $(dirname $old_file))/$dir_name".nii.gz"
            mv $old_file $new_file
        fi
    done
done





# Move files upward

