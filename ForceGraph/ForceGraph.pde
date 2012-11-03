Graph g;
Node root;
Node n1,n2,n3,n4,n5;

void setup() {
  size(500,500);
  background(100);
  g = new Graph(-20,20,-20,20);
  root = new Node(0,0,1,10);
  root.fixed = true;
  n1 = new Node(10,0,1,1);
  n1.fixed = false;
  n2 = new Node(10,10,1,1);
  n2.fixed = false;
  n3 = new Node(10,15,1,1);
  n4 = new Node(0,10,1,1);
  n5 = new Node(0,-10,1,1);
  root.addLink(n1);
  n1.addLink(n2);
  n2.addLink(n3);
  n2.addLink(n4);
  n1.addLink(n5);
  g.addNode(root);
  g.addNode(n1);
//  println(root.neighbors);
//  println(n1.neighbors);
  g.addNode(n2);
  g.addNode(n3);
  g.addNode(n4);
  g.addNode(n5);
  
  
/*
  for (int i=0;i<3;i++) {
    Node temp = new Node(map(random(1),0,1,g.world_left,g.world_right),map(random(1),0,1,g.world_bottom,g.world_top),10,1);
    root.addLink(temp);
    g.addNode(temp);
  }
*/
//  g.populate(t);
}



void draw() {
  background(100);
  root.pos.x = map(mouseX,0,width,g.world_left,g.world_right);
  root.pos.y = map(mouseY,0,height,g.world_bottom,g.world_top);
  g.render();
}
