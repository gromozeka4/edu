#!/bin/bash

FIND_FOLDER=~/piracy #Folder with Vagrant OSs

find $FIND_FOLDER -depth -name "* *" -execdir rename 's/ /-/g' "{}" \;

if [ -f $FIND_FOLDER/timestamp ]; then
       FILE_LIST=`find $FIND_FOLDER -name "*.mkv" -newer $FIND_FOLDER/timestamp` #Read all files newer than timestamp
    else
        FILE_LIST=`find $FIND_FOLDER -name "*.mkv"` #Read all files
    fi

for NAME in ${FILE_LIST[@]}; do
    DIR=${NAME%/*}
    FILE=${NAME##*/}
    #echo $DIR
    #echo $FILE
    DIR_TO_NAME=${DIR//"/"/_}
    HASH=`echo $NAME | md5sum | cut -f1 -d" " | tr '[a-z]' '[A-Z]'`
    NEW_NAME="[$HASH]${DIR_TO_NAME}_${FILE}"
    #echo $DIR$NEW_NAME
    if [[ "$FILE" =~ "$HASH" ]]; then
        exit
    else 
        mv $NAME $DIR/$NEW_NAME
    fi
done

    date>>$FIND_FOLDER/timestamp


    

#if [[ "$NEW_NAME" =~ "$HASH" ]]; then
#echo 0
#else
#echo 1
#fi


