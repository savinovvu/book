## О чём задача?

О задаче "Find Common Elements Between Two Arrays"
Условие задачи:
Даны два массива целых чисел nums1 и nums2. Нужно вернуть массив из двух элементов:

answer[0] - количество элементов из nums1, которые встречаются хотя бы один раз в nums2

answer[1] - количество элементов из nums2, которые встречаются хотя бы один раз в nums1

Примеры:

text
Input: nums1 = [4,3,2,3,1], nums2 = [2,2,5,2,3,6]
Output: [3,4]
Объяснение:
- Элементы из nums1, которые есть в nums2: 3,2,3,1 → 3 уникальных
- Элементы из nums2, которые есть в nums1: 2,2,2,3 → 4 уникальных

Input: nums1 = [3,4,2,3], nums2 = [1,5]
Output: [0,0]

## Решение на Java

```java
class Solution {
    public int[] findIntersectionValues(int[] nums1, int[] nums2) {
        Set<Integer> set1 = Arrays.stream(nums1).boxed().collect(Collectors.toSet());
        Set<Integer> set2 = Arrays.stream(nums2).boxed().collect(Collectors.toSet());

        return new int[]{
                (int) Arrays.stream(nums1).filter(set2::contains).count(),
                (int) Arrays.stream(nums2).filter(set1::contains).count()
        };
    }
}
```


## Временная сложность:
O(n + m)

## Пространственная сложность:
O(n + m)
