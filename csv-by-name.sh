#!/bin/sh

cat sampledata.csv | awk -F, '{ print $2 }' | sort | uniq > userlist.txt

# ファイルを読み込んでgerpして出力
cat userlist.txt | while read NAME
do
    echo ${NAME}
    echo ${NAME//[\"　 ]/}.csv
    cat sampledata.csv | grep "${NAME}" > ./output/${NAME//[\"　 ]/}.csv
done

# sjis に変換が必要な場合
# nkf -s --overwrite ./output/*.csv

