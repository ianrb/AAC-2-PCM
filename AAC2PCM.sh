# !/bin/sh -e
if [ ! -d "$1" ]
then
    echo "Error - destination $1 must exist and be a directory" >&2
    exit 2
fi

mkdir -p "$1/converted"

for file in $1/*.MOV;
do
    # echo $file
    ffmpeg -y -i $file -c:v copy -c:a pcm_s16le "$1/converted/$(basename $file)"
done