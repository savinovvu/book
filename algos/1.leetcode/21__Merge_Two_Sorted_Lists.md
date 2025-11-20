## О чём задача?

Даны два отсортированных связных списка. Нужно объединить их в один отсортированный связный список и вернуть его голову.

Примеры:

text
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]

Input: list1 = [], list2 = []
Output: []

Input: list1 = [], list2 = [0]
Output: [0]


## Решение на Java

```java
public class ListNode {
    int val;
    ListNode next;
    ListNode() {}
    ListNode(int val) { this.val = val; }
    ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}


class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        // Создаем фиктивный узел, который будет началом нашего результирующего списка
        // Это упрощает логику, так как нам не нужно обрабатывать случай пустого списка отдельно
        ListNode dummy = new ListNode(-1);
        
        // Указатель для построения результирующего списка
        ListNode current = dummy;
        
        // Пока оба списка не пусты, сравниваем их элементы
        while (list1 != null && list2 != null) {
            if (list1.val <= list2.val) {
                // Если элемент из list1 меньше или равен, добавляем его в результат
                current.next = list1;
                list1 = list1.next; // Перемещаем указатель в list1 вперед
            } else {
                // Если элемент из list2 меньше, добавляем его в результат
                current.next = list2;
                list2 = list2.next; // Перемещаем указатель в list2 вперед
            }
            current = current.next; // Перемещаем указатель результата вперед
        }
        
        // После того как один из списков закончился, 
        // просто присоединяем оставшийся список к результату
        if (list1 != null) {
            current.next = list1;
        } else {
            current.next = list2;
        }
        
        // Возвращаем настоящую голову списка (пропуская фиктивный узел)
        return dummy.next;
    }
}
```


## Временная сложность:
O(n + m)

## Пространственная сложность:
O(1)
