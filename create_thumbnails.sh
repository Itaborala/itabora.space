#! /bin/bash

ALBUM=images/galleries/$1

#cd $ALBUM

IMAGES=$(ls $ALBUM)

for image in $IMAGES
    do
        #ffmpeg -y -i $ALBUM/$image -vf "scale=(iw*sar)*max(240.1/(iw*sar)\,320.1/ih):ih*max(240.1/(iw*sar)\,320.1/ih), crop=(iw*sar)*min(240/(iw*sar)\,320/ih):ih*min(240/(iw*sar)\,320/ih)" $ALBUM/tmp$image
        #ffmpeg -y -i $ALBUM/$image -vf "scale=(iw*sar)*max(320.1/(iw*sar)\,320.1/ih):-1" $ALBUM/tmp$image
        ffmpeg -y -i $ALBUM/$image -vf "crop=min(iw\,ih/3*4):min(ih\,iw/4*3)" $ALBUM/tmp$image
        ffmpeg -y -i $ALBUM/tmp$image -vf "scale=320:240" thumbnails/$ALBUM/$image
        #ffmpeg -y -i $ALBUM/tmp$image -vf "crop=iw:240" thumbnails/$ALBUM/$image
        rm $ALBUM/tmp$image
    done
