# Функция для копирвания файлов
copy_file() {
    local source_path="$1"
    local destination_path="$2"
    local filename=$(basename "$source_path")
    local extension="${filename##*.}"
    local name="${filename%.*}"

    # Формирование начального пути
    local counter=0
    local new_filename="$filename"

    # Проверка на совпадение имен
    while [ -f "$output_dir/$new_filename" ]; do
        # Увеличиваем счетчик и формируем новое имя файла с индексом
        ((counter++))
        new_filename="${name} ($counter).${extension}"
    done

    # Копируем файл
    cp "$source_path" "$output_dir/$new_filename"
}

# Находим все файлы в директории и её поддиректориях
find "$input_dir" -type f | while read -r file; do
    copy_file "$file" "$output_dir/$(basename "$file")"
done

echo "Все файлы были скопированы в $output_dir"