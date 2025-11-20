## О чём задача?

Дан двумерный массив grid из символов '1' (земля) и '0' (вода). Нужно найти количество островов.

Остров - это группа смежных '1' по горизонтали или вертикали (не по диагонали). Вся граница grid считается окруженной водой.

Пример:

text
Input: grid = [
["1","1","1","1","0"],
["1","1","0","1","0"],
["1","1","0","0","0"],
["0","0","0","0","0"]
]
Output: 1

Input: grid = [
["1","1","0","0","0"],
["1","1","0","0","0"],
["0","0","1","0","0"],
["0","0","0","1","1"]
]
Output: 3

## Решение на Java

```java
class Solution {
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) {
            return 0;
        }
        
        int count = 0;
        int rows = grid.length;
        int cols = grid[0].length;
        
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == '1') {
                    count++;
                    bfs(grid, i, j);
                }
            }
        }
        
        return count;
    }
    
    private void bfs(char[][] grid, int row, int col) {
        int rows = grid.length;
        int cols = grid[0].length;
        
        // Очередь для BFS
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{row, col});
        
        // Направления: вверх, вниз, влево, вправо
        int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        
        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int x = current[0]; 
            int y = current[1];
            
            // Помечаем текущую ячейку как посещённую
            grid[x][y] = '0';
            
            // Проверяем всех соседей
            for (int[] dir : directions) {
                int dx = x + dir[0];
                int dy = y + dir[1];
                
                // Если сосед в пределах grid и это земля
                if (dx >= 0 && dy >= 0 && dx < rows && dy < cols 
                    && grid[dx][dy] == '1') {
                    queue.offer(new int[]{dx, dy});
                    // Помечаем как посещённую сразу, чтобы избежать дублирования в очереди
                    grid[dx][dy] = '0';
                }
            }
        }
    }
}
```

## Временная сложность:
O(m × n)

## Пространственная сложность:
O(m × n)
