## О чём задача?

Дан массив целых чисел nums и целое число target. Нужно найти индексы двух чисел таких, что их сумма равна target.

Предположения:

Существует ровно одно решение
Нельзя использовать один и тот же элемент дважды
Можно вернуть ответ в любом порядке

## Решение на Java

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        // Создаем хэш-таблицу для хранения чисел и их индексов.
        // Ключ: число из массива, Значение: индекс этого числа.
        Map<Integer, Integer> numMap = new HashMap<>();
        
        // Проходим по всем элементам массива.
        for (int i = 0; i < nums.length; i++) {
            // Вычисляем complement - число, которое в сумме с текущим дает target.
            int complement = target - nums[i];
            
            // Проверяем, есть ли complement в хэш-таблице.
            if (numMap.containsKey(complement)) {
                // Если complement найден, возвращаем индексы текущего элемента и complement.
                return new int[] { numMap.get(complement), i };
            }
            
            // Если complement не найден, добавляем текущее число и его индекс в таблицу.
            numMap.put(nums[i], i);
        }
        
        // По условию задачи решение всегда существует, поэтому эта строка не будет достигнута.
        throw new IllegalArgumentException("No solution found");
    }
}
```



## Временная сложность:
O(n)

## Пространственная сложность:
O(n)
