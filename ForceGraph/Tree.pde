class TreeNode {
  int val;
  TreeNode left;
  TreeNode right;
  TreeNode(int v) {
    left = null;
    right = null;
    val = v;
  }
}

class Tree {
  TreeNode root;
  Tree() {
    root = null;
  }
  void insert(int val) {
    insertNode(root,val);
  }
  void insertNode(TreeNode n, int val) {
    
    if (n==null) {
      n = new TreeNode(val);
      return;
    }
    if (val<n.val) {
      if (n.left==null) {
        n.left = new TreeNode(val);
      } else {
        insertNode(n.left,val);
      }
    } else if (val>n.val) {
     if (n.right==null) {
        n.right = new TreeNode(val);
      } else {
        insertNode(n.right,val);
      }
    }
  }
}
