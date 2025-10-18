#!/bin/bash

# Создаем файлы с вопросами по Design & Distributed systems
files=(
    "1.Принцип работы service discovery.md"
    "2.Big O - что такое + примеры для коллекций.md"
    "3.Принципы ООП.md"
    "4.Как работает distributed tracing.md"
    "5.Load balancer vs reverse proxy.md"
    "6.Weak-eventual-strong consistency - в чем отличия.md"
    "7.Варианты read-write масштабирования для DB.md"
    "8.Как работает circuit breaker.md"
    "9.monolith vs microservices.md"
    "10.SOLID.md"
    "11.GOF design patterns.md"
    "12.CAP теорема + примеры CP-AP систем.md"
    "13.CQRS - какую проблему решает как устроен.md"
    "14.Saga pattern - какую проблему решает как устроен.md"
    "15.Основные принципы DDD.md"
)

# Создаем каждый файл
for file in "${files[@]}"; do
    # Заменяем проблемные символы в именах файлов
    safe_filename=$(echo "$file" | sed 's/[<>:"/\\|?*]/_/g')
    touch "$safe_filename"
    echo "Создан файл: $safe_filename"
done

echo "Все файлы успешно созданы!"