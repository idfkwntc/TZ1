for file in `find $1 -type f -name "*"`
do
    echo $file
    cp $file $2
done