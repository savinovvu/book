## О чём задача?

Условие задачи:
Даны две строки s и p. Нужно найти все начальные индексы анаграмм строки p в строке s.

Анаграмма — это перестановка букв другого слова. 
Например, "abc" является анаграммой "cba", "bac", "acb" и т.д.


## Решение на Java

```java
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        List<Integer> result = new ArrayList<>();
        
        // Если строка s короче строки p, анаграмм быть не может
        if (s.length() < p.length()) {
            return result;
        }
        
        // Создаём два массива для подсчёта частот символов
        // pCount - частоты символов в строке p
        // sCount - частоты символов в текущем окне строки s
        int[] pCount = new int[26]; // так как только строчные английские буквы
        int[] sCount = new int[26];
        
        // Заполняем pCount частотами символов из p
        // И одновременно заполняем первое окно в sCount
        for (int i = 0; i < p.length(); i++) {
            pCount[p.charAt(i) - 'a']++;
            sCount[s.charAt(i) - 'a']++;
        }
        
        // Проверяем, является ли первое окно анаграммой
        if (isAnagram(pCount, sCount)) {
            result.add(0);
        }
        
        // Используем технику скользящего окна
        // Начинаем со второго окна (индекс 1)
        for (int i = p.length(); i < s.length(); i++) {
            // Удаляем символ, который выходит из окна (левый край)
            char leftChar = s.charAt(i - p.length());
            sCount[leftChar - 'a']--;
            
            // Добавляем новый символ, который входит в окно (правый край)
            char rightChar = s.charAt(i);
            sCount[rightChar - 'a']++;
            
            // Проверяем, является ли текущее окно анаграммой
            if (isAnagram(pCount, sCount)) {
                // Добавляем начальный индекс текущего окна
                result.add(i - p.length() + 1);
            }
        }
        
        return result;
    }
    
    // Вспомогательный метод для проверки, являются ли два массива частот анаграммами
    private boolean isAnagram(int[] pCount, int[] sCount) {
        for (int i = 0; i < 26; i++) {
            if (pCount[i] != sCount[i]) {
                return false;
            }
        }
        return true;
    }
}
```


## Подробные комментарии к решению


## Временная сложность:
O(n)

## Пространственная сложность:
O(1)
