## О чём задача?

Min Stack — это задача проектирования специального стека, 
который поддерживает стандартные операции (push, pop, top), 
а также операцию получения минимального элемента за время O(1).

Основные требования:

push(x) - добавляет элемент x в стек
pop() - удаляет верхний элемент из стека
top() - возвращает верхний элемент стека
getMin() - возвращает минимальный элемент в стеке

Все операции должны выполняться за время O(1)

## Решение на Java

```java
class MinStack {
    private Stack<Integer> mainStack;    // Основной стек для хранения элементов
    private Stack<Integer> minStack;     // Стек для отслеживания минимальных значений
    
    /**
     * Инициализация стека.
     * Используем два стека:
     * - mainStack: хранит все элементы
     * - minStack: хранит текущие минимальные значения
     */
    public MinStack() {
        mainStack = new Stack<>();
        minStack = new Stack<>();
    }
    
    /**
     * Добавляет элемент в стек.
     * Временная сложность: O(1)
     * 
     * @param val значение для добавления
     */
    public void push(int val) {
        // Добавляем элемент в основной стек
        mainStack.push(val);
        
        // Если minStack пуст или новое значение <= текущему минимуму,
        // добавляем его в minStack
        if (minStack.isEmpty() || val <= minStack.peek()) {
            minStack.push(val);
        }
    }
    
    /**
     * Удаляет верхний элемент из стека.
     * Временная сложность: O(1)
     */
    public void pop() {
        // Если удаляемый элемент из основного стека равен текущему минимуму,
        // удаляем его также из minStack
        if (mainStack.pop().equals(minStack.peek())) {
            minStack.pop();
        }
    }
    
    /**
     * Возвращает верхний элемент стека без удаления.
     * Временная сложность: O(1)
     * 
     * @return верхний элемент стека
     */
    public int top() {
        return mainStack.peek();
    }
    
    /**
     * Возвращает минимальный элемент в стеке.
     * Временная сложность: O(1)
     * 
     * @return минимальный элемент
     */
    public int getMin() {
        return minStack.peek();
    }
}
```


## Подробные комментарии к решению
* MinStack minStack = new MinStack();
* minStack.push(-2);
* minStack.push(0);
* minStack.push(-3);
* minStack.getMin();   // return -3
* minStack.pop();
* minStack.top();      // return 0
* minStack.getMin();   // return -2

## Временная сложность:
O(1)

## Пространственная сложность:
O(n)
