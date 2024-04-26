echo "Файлы:"
find $1 -type f -print
echo "Папки:"
find $1 -type d -print
find $1 -type f -exec cp {} $2 \;