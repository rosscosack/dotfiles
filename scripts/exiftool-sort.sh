#!/bin/bash

# Change into the /media/data/video/home directory 
# Move Movie files from /media/data/unsorted into the home videos directory based on their creation year

echo "Unsorted disk usage before"
du /tank/tank/unsorted -sh

echo "Sort Home Videos"
cd /tank/tank/video/home
exiftool -r -d %Y "-directory<filemodifydate" "-directory<createdate" "-directory<datetimeoriginal" -ext mov -ext mp4 -ext mpg /tank/tank/unsorted/


# Change into the /media/data/pictures directory 
# Move Movie files from /media/data/unsorted into the pictures directory based on their creation date

echo "Sort Pictures"
cd /tank/pictures
exiftool -r -d %Y/%m/%d "-directory<filemodifydate" "-directory<createdate" "-directory<datetimeoriginal" -ext jpg /tank/tank/unsorted/

echo "Unsorted disk usage after"
du /tank/tank/unsorted -sh

echo "Andriod disk usage before"
du /tank/tank/Android -sh

echo "Sort Android Videos"
cd /tank/tank/video/home
exiftool -r -d %Y "-directory<filemodifydate" "-directory<createdate" "-directory<datetimeoriginal" -ext mov -ext mp4 -ext mpg /tank/tank/Android/


echo "Sort Andriod Pictures"
cd /tank/pictures
exiftool -r -d %Y/%m/%d "-directory<filemodifydate" "-directory<createdate" "-directory<datetimeoriginal" -ext jpg /tank/tank/Android/

echo "Android disk usage after"
du /tank/tank/Android -sh
