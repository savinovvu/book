## О чём задача?

Задача "Insert Delete GetRandom O(1)" требует реализации структуры данных, 
которая поддерживает следующие операции за время O(1):

insert(val): Вставляет значение в множество (если его еще нет)

remove(val): Удаляет значение из множества (если оно существует)

getRandom(): Возвращает случайный элемент из текущего множества с равной вероятностью

Основная сложность заключается в том, чтобы операция getRandom() работала за O(1), 
что невозможно при использовании только хэш-таблицы.


## Решение на Java

```java
class RandomizedSet {
    private List<Integer> list;           // Хранит значения для доступа по индексу
    private Map<Integer, Integer> map;    // Хранит значение -> индекс в списке
    private Random random;                // Генератор случайных чисел

    public RandomizedSet() {
        list = new ArrayList<>();
        map = new HashMap<>();
        random = new Random();
    }
    
    /**
     * Вставляет значение в набор, если его ещё нет.
     * Возвращает true если вставка успешна, false если значение уже существует.
     */
    public boolean insert(int val) {
        // Если значение уже существует, возвращаем false
        if (map.containsKey(val)) {
            return false;
        }
        
        // Добавляем значение в конец списка
        list.add(val);
        // Сохраняем в мапе: значение -> его индекс в списке
        map.put(val, list.size() - 1);
        
        return true;
    }
    
    /**
     * Удаляет значение из набора, если оно существует.
     * Возвращает true если удаление успешно, false если значения нет.
     */
    public boolean remove(int val) {
        // Если значения нет, возвращаем false
        if (!map.containsKey(val)) {
            return false;
        }
        
        // Получаем индекс удаляемого элемента
        int indexToRemove = map.get(val);
        // Получаем последний элемент списка
        int lastElement = list.get(list.size() - 1);
        
        // Перемещаем последний элемент на место удаляемого
        list.set(indexToRemove, lastElement);
        // Обновляем индекс перемещённого элемента в мапе
        map.put(lastElement, indexToRemove);
        
        // Удаляем последний элемент (теперь он дублируется)
        list.remove(list.size() - 1);
        // Удаляем значение из мапы
        map.remove(val);
        
        return true;
    }
    
    /**
     * Возвращает случайный элемент из текущего набора элементов.
     * Все элементы имеют равную вероятность быть выбранными.
     */
    public int getRandom() {
        // Генерируем случайный индекс и возвращаем элемент по этому индексу
        return list.get(random.nextInt(list.size()));
    }
}

/**
 * Пример использования:
 * RandomizedSet randomizedSet = new RandomizedSet();
 * randomizedSet.insert(1); // true
 * randomizedSet.remove(2); // false
 * randomizedSet.insert(2); // true
 * randomizedSet.getRandom(); // 1 или 2 с равной вероятностью
 * randomizedSet.remove(1); // true
 * randomizedSet.insert(2); // false
 * randomizedSet.getRandom(); // 2
 */
```



## Временная сложность:
insert(): O(1) - добавление в конец ArrayList и вставка в HashMap
remove(): O(1) - используем трюк с заменой удаляемого элемента последним
getRandom(): O(1) - случайный доступ в ArrayList

## Пространственная сложность:
O(n)
