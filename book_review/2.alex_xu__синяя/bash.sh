#!/bin/bash

# Создаем директорию для файлов
mkdir -p ответы_системный_дизайн
cd ответы_системный_дизайн

# Создаем файлы с русскими названиями (технологии на латинице)
files=(
    расскажи "01-Процесс-дизайна-старт.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "02-Фреймворк-дизайна.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "03-Изменение-предположений.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "04-Уровень-детализации.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "05-Реальные-компромиссы.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "06-NoSQL-против-SQL.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "07-Стратегии-шардирования.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "08-Горячие-шарды.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "09-Leader-follower-репликация.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "10-Read-replicas-против-кэша.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "11-Инвалидация-кэша.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "12-Стратегии-кэширования.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "13-Проблемы-кэширования.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "14-Размещение-кэша.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "15-Kafka-против-RabbitMQ.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "16-Exactly-once-месседжинг.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "17-Масштабирование-консьюмеров.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "18-Выбор-API.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "19-Дизайн-асинхронного-API.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "20-Обработка-backpressure.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "21-Дебаггинг-таймаутов.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "22-Distributed-tracing.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "23-Graceful-degradation.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "24-CAP-теорема.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "25-Компромисс-латентность-пропускная-способность.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "26-Компромисс-стоимость-масштабируемость.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "27-Компромисс-сложность-устойчивость.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "28-Проблемы-TinyURL.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "29-Twitter-супер-пользователь.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "30-Предсказание-кэширования-CDN.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "31-Консистентность-key-value-store.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "32-Вежливость-веб-краулера.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "33-Критика-книги.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "34-Когда-лучшие-практики-не-работают.md" Senior Architector Developer Alex Xu Design book на русском
    расскажи "35-Расширенная-сессия-дизайна.md" Senior Architector Developer Alex Xu Design book на русском
)

# Создаем каждый файл
for file in "${files[@]}"; do
    # Заменяем проблемные символы
    safe_filename=$(echo "$file" | sed 's/[<>:"/\\|?*]/_/g')

    # Создаем файл с базовой структурой
    cat > "$safe_filename" << EOF
# ${file%.md}

## Вопрос


## Основные моменты для ответа


## Примерная структура решения


## Компромиссы и нюансы


## Дополнительные материалы

EOF

    echo "Создан файл: $safe_filename"
done

echo "Все 35 файлов успешно созданы в директории 'ответы_системный_дизайн'!"