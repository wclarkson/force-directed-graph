class Graph {
  ArrayList nodes;
  float world_left,world_right,world_top,world_bottom;
  
  Graph(float xmin, float xmax, float ymin, float ymax) {
    world_left = xmin;
    world_right = xmax;
    world_bottom = ymin;
    world_top = ymax;
    nodes = new ArrayList();
  }
  
  void addNode(Node n) {
    nodes.add(n); 
  }
  
  void render() {
    for (Node n: (ArrayList<Node>)nodes) {
      n.calculateForces(nodes);
      n.render(world_left,world_right,world_bottom,world_top);
    } 
  }
  
  void addTreeNode(TreeNode tree_node, Node parent) {
    if (tree_node.left!=null) {
      println("Adding node.");
      Node temp = new Node(map(random(1),0,1,world_left,world_right),map(random(1),0,1,world_bottom,world_top),1,10);
      parent.addLink(temp);
      addNode(temp);
      addTreeNode(tree_node.left,temp);      
    }
    if (tree_node.right!=null) {
      println("Adding node.");
      Node temp = new Node(map(random(1),0,1,world_left,world_right),map(random(1),0,1,world_bottom,world_top),1,10);
      parent.addLink(temp);
      addNode(temp);
      addTreeNode(tree_node.right,temp);
    }
  }
  
  void populate(Tree tree) {
    if (tree.root!=null) {
      println("Adding root.");
      Node root = new Node(0,0,1,10);
      root.fixed = true;
      addNode(root);
      addTreeNode(tree.root,root);
    }
  }
}

