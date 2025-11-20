## О чём задача?

центра.

Симметричное дерево - это дерево, которое зеркально симметрично относительно своей корневой оси. Левое поддерево является зеркальным отражением правого поддерева.

Примеры:

text
   1
  / \
 2   2
/ \ / \
3  4 4  3

Input: [1,2,2,3,4,4,3]
Output: true

   1
  / \
 2   2
  \   \
   3    3

Input: [1,2,2,null,3,null,3]
Output: false


## Решение на Java

```java
public class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode() {}
    TreeNode(int val) { this.val = val; }
    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}


class Solution {
    public boolean isSymmetric(TreeNode root) {
        if (root == null) return true;
//        Одновременный обход в ширину обоих поддеревьев
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root.left);
        queue.offer(root.right);
        
        while (!queue.isEmpty()) {
            TreeNode left = queue.poll();
            TreeNode right = queue.poll();
            
            if (left == null && right == null) continue;
            if (left == null || right == null) return false;
            if (left.val != right.val) return false;
            
            // Добавляем узлы в порядке, соответствующем зеркальности
            queue.offer(left.left);
            queue.offer(right.right);
            queue.offer(left.right);
            queue.offer(right.left);
        }
        
        return true;
    }
}
```



## Временная сложность:
O(n)

## Пространственная сложность:
O(n)
