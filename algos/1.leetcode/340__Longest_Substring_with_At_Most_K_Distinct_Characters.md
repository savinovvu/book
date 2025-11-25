## О чём задача?

Дана строка s и целое число k. 
Нужно найти длину самой длинной подстроки, содержащей не более k уникальных символов.

Примеры:

text
Input: s = "eceba", k = 2
Output: 3
Объяснение: "ece" содержит 2 уникальных символа

Input: s = "aa", k = 1
Output: 2
Объяснение: "aa" содержит 1 уникальный символ

## Решение на Java

```java
class Solution {
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        // Если строка пустая или k = 0, сразу возвращаем 0
        if (s == null || s.length() == 0 || k == 0) {
            return 0;
        }
        
        // Используем HashMap для отслеживания количества вхождений каждого символа в текущем окне
        Map<Character, Integer> charCount = new HashMap<>();
        
        int left = 0; // левый указатель sliding window
        int maxLength = 0; // максимальная длина подстроки
        
        // Правый указатель sliding window
        for (int right = 0; right < s.length(); right++) {
            char rightChar = s.charAt(right);
            
            // Добавляем текущий символ в HashMap
            // getOrDefault возвращает текущее значение или 0, если ключа нет
            charCount.merge(rightChar, 1, Integer::sum);
            
            // Если количество различных символов превысило k,
            // перемещаем левый указатель, пока не станет снова ≤ k
            while (charCount.size() > k) {
                char leftChar = s.charAt(left);
                
                // Уменьшаем счетчик для символа, который покидает окно
                charCount.put(leftChar, charCount.get(leftChar) - 1);
                
                // Если счетчик стал 0, удаляем символ из HashMap
                if (charCount.get(leftChar) == 0) {
                    charCount.remove(leftChar);
                }
                
                // Сдвигаем левый указатель
                left++;
            }
            
            // Обновляем максимальную длину
            maxLength = Math.max(maxLength, right - left + 1);
        }
        
        return maxLength;
    }
}
```


## Временная сложность:
O(n)

## Пространственная сложность:
O(1)
