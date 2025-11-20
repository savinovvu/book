## О чём задача?

Даны точки на плоскости в виде координат [x, y]. 
Нужно определить, существует ли вертикальная линия (параллельная оси Y), 
такая что все точки симметричны относительно этой линии.


## Решение на Java

```java
class Solution {
    public boolean isReflected(int[][] points) {
        if (points == null || points.length == 0) {
            return true;
        }
        // Найдем минимальную и максимальную x-координату для определения средней линии
        int minX = Integer.MAX_VALUE;
        int maxX = Integer.MIN_VALUE;
        
        // Используем HashSet для хранения точек
        Set<String> pointSet = new HashSet<>();
        
        for (int[] point : points) {
            int x = point[0];
            int y = point[1];
            
            minX = Math.min(minX, x);
            maxX = Math.max(maxX, x);
            // Преобразуем точку в строку для хранения в HashSet          
            pointSet.add(x + "," + y);
        }
        
        // Сумма minX и maxX должна быть одинаковой для всех симметричных пар
        int sum = minX + maxX;
        
        for (int[] point : points) {
            int x = point[0];
            int y = point[1];
            
            // Вычисляем симметричную точку
            int symmetricX = sum - x;
            String symmetricPoint = symmetricX + "," + y;
            
            if (!pointSet.contains(symmetricPoint)) {
                return false;
            }
        }
        
        return true;
    }
}
```




## Временная сложность:
O(n)

## Пространственная сложность:
O(n)
