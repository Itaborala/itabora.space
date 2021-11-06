#! /bin/bash

album=$1

while IFS="," read -r cl1 cl2
    do
        echo "Inserting captions on $album $cl1..."
        exiv2 -M "set Exif.Image.ImageDescription $cl2" images/galleries/$album/$cl1

    done < <(tail -n +2 captions/$album.csv)
