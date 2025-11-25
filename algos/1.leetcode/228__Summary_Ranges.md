## О чём задача?

Дан отсортированный уникальный массив целых чисел. 
Нужно вернуть кратчайший список отсортированных диапазонов, 
который точно покрывает все числа в массиве.

Диапазон представляется как:

"a->b" если диапазон включает несколько чисел (a, a+1, a+2, ..., b)

"a" если диапазон состоит из одного числа

Примеры:

text
Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Объяснение: [0,1,2] → "0->2", [4,5] → "4->5", [7] → "7"

Input: nums = [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]


## Решение на Java

```java
class Solution {
    public List<String> summaryRanges(int[] nums) {
        List<String> result = new ArrayList<>();

        if (nums.length == 0) return result;

        int start = nums[0];

        for (int i = 1; i <= nums.length; i++) {
            // Если достигли конца массива ИЛИ текущий элемент не следует за предыдущим
            if (i == nums.length || nums[i] != nums[i - 1] + 1) {
                // Добавляем диапазон в результат
                if (start == nums[i - 1]) {
                    result.add(String.valueOf(start));
                } else {
                    result.add(start + "->" + nums[i - 1]);
                }

                start = nums[i];
            }
        }

        return result;
    }
}
```


## Временная сложность:
O(n)

## Пространственная сложность:
O(1)
