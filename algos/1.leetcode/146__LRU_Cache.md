## О чём задача?

Нужно спроектировать и реализовать структуру данных LRU (Least Recently Used) Cache, 
которая поддерживает операции:

get(key) - получить значение по ключу (O(1))

put(key, value) - добавить или обновить пару ключ-значение (O(1))

Особенности LRU Cache:

Имеет фиксированную вместимость (capacity)

При превышении capacity удаляется наименее использованный элемент

Использование включает как get, так и put

Все операции должны выполняться за O(1) время

Пример:

java
LRUCache cache = new LRUCache(2); // capacity = 2

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2 (наименее использованный)
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4


## Решение на Java

```java
class LRUCache {
    int cap;  // Максимальная емкость кэша
    // LinkedHashMap сохраняет порядок вставки элементов:
    // - Первый элемент (в итераторе) - самый старый (наименее использованный)
    // - Последний элемент - самый новый (недавно использованный)
    LinkedHashMap<Integer, Integer> cache = new LinkedHashMap<>();
    
    public LRUCache(int capacity) {
        this.cap = capacity;  // Инициализируем максимальную емкость
    }
    
    public int get(int key) {
        if (!cache.containsKey(key)) {
            return -1;  // Ключ не найден в кэше
        }
        makeRecently(key);  // Помечаем элемент как недавно использованный
        return cache.get(key);  // Возвращаем значение
    }
    
    public void put(int key, int value) {
         // Если ключ уже существует в кэше
         if (cache.containsKey(key)) {
            cache.put(key, value);    // Обновляем значение (порядок не меняется)
            makeRecently(key);        // Перемещаем элемент в конец (отмечаем как недавно использованный)
            return;  // Выходим, так как размер кэша не изменился
        }
        
        // Если кэш заполнен, нужно удалить самый старый элемент
        if (cache.size() >= this.cap) {
            // Получаем первый ключ из итератора - это самый старый элемент
            int oldestKey = cache.keySet().iterator().next();
            cache.remove(oldestKey);  // Удаляем наименее использованный элемент
        }
        cache.put(key, value);  // Добавляем новый элемент в конец LinkedHashMap
    }
    
    // Вспомогательный метод для перемещения элемента в конец списка
    private void makeRecently(int key) {
        int val = cache.get(key);  // Получаем значение по ключу
        cache.remove(key);         // Удаляем элемент из текущей позиции
        cache.put(key, val);       // Добавляем элемент обратно в конец (теперь он "недавно использованный")
    }
}

/**
 * Пример работы кэша:
 * 
 * LRUCache cache = new LRUCache(2);
 * 
 * cache.put(1, 1);  // cache: [1=1]
 * cache.put(2, 2);  // cache: [1=1, 2=2]  
 * cache.get(1);     // cache: [2=2, 1=1] - 1 переместился в конец
 * cache.put(3, 3);  // cache: [1=1, 3=3] - удалился 2 (самый старый)
 * cache.get(2);     // возвращает -1 (элемент был удален)
 * 
 * Логика порядка:
 * - При добавлении элемент идет в конец
 * - При обращении элемент перемещается в конец  
 * - При переполнении удаляется элемент из начала
 */
```


## Временная сложность:
O(1)

## Пространственная сложность:
O(1)
