class Body{
  float mass;
  float r;
  PVector pos;
  PVector vel;
  color col;
  int id;
  ArrayList <PVector> path = new ArrayList <PVector>();
  
  Body(float mass, float x, float y, float vx, float vy, int id){
      this. mass = mass;
      this. r = CalR();
      this. pos = new PVector(x, y);
      this. vel = new PVector(vx, vy);
      this. col = color(random(0, 255), random(0, 255), random(0, 255));
      this. id = id;
    }
  
  float CalR(){
      if(max == null || this. mass >= max. mass){
          max = this;
      }
      return pow(mass / PI * (3f / 4f), 1f / 3f);
    }
  
  void Show(){
      noStroke();
      fill(col);
      ellipse(pos. x, pos. y, r * 2, r * 2);
      fill(255);
      text(id, pos. x, pos. y);
    }
  
  void ShowPath(){
      stroke(col);
      for(int i = 0; i < path.size(); i++){
          PVector a = path.get(i);
          PVector b;
          if(i + 1 == path. size()){
              b = pos;
          }
          else{
              b = path. get(i + 1);
              line(a. x, a. y, b. x, b.y);
          }
      }
  }
  
  void Update(){
      pos. add(vel);
      path.add(new PVector(pos. x, pos. y));
      if(path. size() > maxPath){
          path. remove(0);
      }
      //if(pos.x <=(-width*2) || pos.x>=(width*2)){
      //vel.x *=-1;
    //}
//    //if(pos.y <=(-height*2) || pos.y>=(height*2)){
      //vel.y *=-1;
   // }
    }
  
  void Attract(){
      for(int i = 0; i < bodys. size(); i++){
          Body other = bodys. get(i);
          if(other == this)
              continue;
          PVector direction = new PVector(this. pos. x - other. pos. x, this. pos. y - other. pos. y);
          if(direction. mag() <= this. r + other. r){
              if(this. mass > other. mass){
                  this. vel = PVector. div(PVector. add(PVector. mult(this. vel, this. mass), PVector. mult(other. vel, other. mass)), this. mass + other. mass);
                  this. mass = this. mass + other. mass;
                  this. r = CalR();
                  bodys. remove(i);
            }
          continue;
      }
      float forcePower = G * (this. mass * other. mass) / direction. magSq();
      PVector force = direction.normalize(). mult(forcePower);
      other. vel. add(force. div(other. mass));
    }
  }
}