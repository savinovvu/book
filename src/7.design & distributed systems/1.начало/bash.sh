#!/bin/bash

# Создаем файлы с вопросами по Design & Distributed systems
files=(
    "1.Принцип работы service discovery.md" Senior developer
    "2.Big O - что такое + примеры для коллекций.md" Senior developer
    "3.Принципы ООП.md" Senior developer
    "4.Как работает distributed tracing.md" Senior developer
    "5.Load balancer vs reverse proxy.md" Senior developer
    "6.Weak-eventual-strong consistency - в чем отличия.md" Senior developer
    "7.Варианты read-write масштабирования для DB.md" Senior developer
    "8.Как работает circuit breaker.md" Senior developer
    "9.monolith vs microservices.md" Senior developer
    "10.SOLID.md" Senior developer
    "11.GOF design patterns.md" Senior developer
    "12.CAP теорема + примеры CP-AP систем.md" Senior developer
    "13.CQRS - какую проблему решает как устроен.md" Senior developer
    "14.Saga pattern - какую проблему решает как устроен.md" Senior developer
    "15.Основные принципы DDD.md" Senior developer
)

# Создаем каждый файл
for file in "${files[@]}"; do
    # Заменяем проблемные символы в именах файлов
    safe_filename=$(echo "$file" | sed 's/[<>:"/\\|?*]/_/g')
    touch "$safe_filename"
    echo "Создан файл: $safe_filename"
done

echo "Все файлы успешно созданы!"