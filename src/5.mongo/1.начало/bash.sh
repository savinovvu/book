#!/bin/bash

# Создаем файлы с вопросами
files=(
    "1.Что есть replica set?.md" Mongo Senior
    "2.BSON vs JSON?.md" Mongo Senior
    "3.К какой классификации NoSQL относится? какие основные отличия от РСУБД?.md" Mongo Senior
    "4.Отличие от реляционной модели.md" Mongo Senior
    "5.Как выглядит архитектура шардированного кластера?.md" Mongo Senior
    "6.Что есть Read/Write concern?.md" Mongo Senior
    "6.Транзакции. Какие предоставляют гарантии? Как влияет на производительность?.md" Mongo Senior
    "8.Индексы. Какие бывают виды? Какие есть дополнительные атрибуты у индексов? Какой стратегии следует придерживаться?.md" Mongo Senior
    "9.С помощью какого механизма MongoDB гарантирует персистентность? (WAL Journal).md" Mongo Senior
    "10.Доказательство CAP?.md" Mongo Senior
    "11.Что есть WireTiger? Какой вид блокировок использует? (MVCC).md" Mongo Senior
)

# Создаем каждый файл
for file in "${files[@]}"; do
    # Заменяем проблемные символы в именах файлов
    safe_filename=$(echo "$file" | sed 's/[<>:"/\\|?*]/_/g')
    touch "$safe_filename"
    echo "Создан файл: $safe_filename"
done

echo "Все файлы успешно созданы!"