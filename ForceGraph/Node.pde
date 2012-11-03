class Node {
  PVector pos;      // position in virtual space (not necessarily pixels)
  PVector pos0;
  PVector vel;
  PVector acc;
  float charge;
  float mass;
  boolean fixed;  // sets whether the node can move
  boolean flag;   // might be needed for graph traversals 
  ArrayList neighbors;
  color nodecolor;
  float k;
  float k_spr;
  float spr_damp;
  float air_damp;
  
  Node(float x, float y, float c_in, float m_in) {
    pos = new PVector(x,y);
    pos0 = new PVector(x,y);
    vel = new PVector();
    acc = new PVector();
    charge = c_in;
    mass = m_in;
    neighbors = new ArrayList();  
    nodecolor = color(56,158,240);
    k = 2000000;    // inversely proportional to repulsion
    k_spr = 100000;   // propotional to spring force
    spr_damp = 0.05;
    air_damp = 0.05;
  }
  
  void addLink(Node n) {
    neighbors.add(n);
  }
  
  void calculateForces(ArrayList<Node>nodes) {
    if (fixed) return;
    PVector net = new PVector();
    for (Node n: (ArrayList<Node>)nodes) {
      if (n!=this) {
        PVector force = PVector.sub(pos,n.pos);
        PVector.mult(force,k*charge*n.charge/pow(force.mag(),2));
        net.add(force);
      }
    }
    for (Node n: (ArrayList<Node>)neighbors) {
      if (n!=this) {
        PVector disp = PVector.sub(pos,n.pos);
//        disp.mult(-k_spr*(disp.mag()-PVector.sub(pos0,n.pos0).mag()));
        disp.mult(-k_spr*(disp.mag()-2));
//        disp.sub(PVector.mult(vel,spr_damp));
        net.add(disp);
      }
    }
    acc = PVector.div(net,mass*k);
    acc.sub(PVector.mult(vel,air_damp));
    vel.add(acc);
    pos.add(vel);
  }
  
  void render(float xmin, float xmax, float ymin, float ymax) {
    fill(nodecolor);
    for (Node n: (ArrayList<Node>)neighbors) {
      stroke(255);
      line(map(pos.x,xmin,xmax,0,width),map(pos.y,ymin,ymax,0,height),
            map(n.pos.x,xmin,xmax,0,width),map(n.pos.y,ymin,ymax,0,height));
    }
    noStroke();
    ellipse(map(pos.x,xmin,xmax,0,width),map(pos.y,ymin,ymax,0,height),20,20);
  }
}
