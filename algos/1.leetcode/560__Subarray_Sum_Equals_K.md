## О чём задача?

Условие: Дан массив целых чисел nums и целое число k. 
Необходимо найти общее количество непрерывных подмассивов, 
сумма элементов которых равна k


## Решение на Java

```java

class Solution {
    public int subarraySum(int[] nums, int k) {
        // Карта для хранения количества вхождений каждой префиксной суммы
        Map<Integer, Integer> prefixSumCount = new HashMap<>();
        
        // Инициализация: префиксная сумма 0 встречается 1 раз (перед началом массива)
        prefixSumCount.put(0, 1);
        
        int currentSum = 0; // Текущая префиксная сумма
        int count = 0;      // Счётчик подмассивов с суммой k
        
        for (int num : nums) {
            // Обновляем текущую префиксную сумму
            currentSum += num;
            
            // Если (currentSum - k) существует в карте, значит мы нашли подмассив с суммой k
            // Потому что: currentSum - (currentSum - k) = k
            if (prefixSumCount.containsKey(currentSum - k)) {
                count += prefixSumCount.get(currentSum - k);
            }
            
            // Обновляем карту с текущей префиксной суммой
            prefixSumCount.put(currentSum, prefixSumCount.getOrDefault(currentSum, 0) + 1);
        }
        
        return count;
    }
}
```


## Подробные комментарии к решению
Основано на свойстве префиксных сумм.
Формула: sum[i] - sum[j] = k 
Отсюда:
sum[j] = sum[i] - k

Храним в мапе в качестве ключа значение sum[j] и смотрим сколько 
префиксных сумм содержит это значение. 



## Временная сложность:
O(n) - один проход по массиву

## Пространственная сложность:
Пространственная сложность: O(n) - в худшем случае HashMap может содержать n различных сумм префиксов
 