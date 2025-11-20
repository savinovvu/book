## О чём задача?

Условие задачи:
Дана строка s. 
Нужно посчитать количество подстрок, в которых все символы уникальны (нет повторяющихся символов).

Примеры:

text
Input: s = "abc"
Output: 6
Объяснение: Все подстроки: "a","b","c","ab","bc","abc" - все без повторений

Input: s = "aaa"
Output: 3
Объяснение: Подстроки без повторений: "a","a","a"

Input: s = "abac"
Output: 8


## Решение на Java

```java
class Solution {
    public int numberOfSpecialSubstrings(String s) {
        int n = s.length();
        int count = 0;
        
        int left = 0;
        // Массив для отслеживания последнего вхождения каждого символа
        int[] lastSeen = new int[26];
        // Инициализируем -1 (символ еще не встречался)
        Arrays.fill(lastSeen, -1);
        
        for (int right = 0; right < n; right++) {
            char currentChar = s.charAt(right);
            int charIndex = currentChar - 'a';
            
            // Если символ уже встречался в текущем окне,
            // перемещаем left за последнее вхождение этого символа
            if (lastSeen[charIndex] >= left) {
                left = lastSeen[charIndex] + 1;
            }
            
            // Обновляем последнее вхождение текущего символа
            lastSeen[charIndex] = right;
            
            // Добавляем количество новых валидных подстрок
            count += (right - left + 1);
        }
        
        return count;
    }
}
```


## Временная сложность:
O(n)

## Пространственная сложность:
O(1)
