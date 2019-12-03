PFont font;
Body star;
float maxPath = 300;
PVector starBodyMass = new PVector(500, 1000);
float startBodySpeed = 1;
ArrayList<Body> bodys = new ArrayList<Body>();
int startBodyCount = 100;
Body max;
boolean running = false;
float G = 0.5f;
void setup(){
  frameRate(144);
  size(1600, 900);
  font = loadFont("BookAntiqua-Italic-48.vlw");
  textFont(font, 16);
  max = new Body(0, 0, 0, 0, 0, 0);
  for(int i = 0; i < startBodyCount; i++){
    bodys. add(new Body(random(starBodyMass. x, starBodyMass. y), random(width), random(height), random(-startBodySpeed, startBodySpeed), random(-startBodySpeed, startBodySpeed), i));
  }
  bodys. add(new Body(10000, width / 2, height / 2, 0, 0, -1));
}

void draw(){
  background(0);
  translate(-max. pos. x + (width / 2), -max. pos. y + (height / 2));
  strokeWeight(1);
  for(int i = 0; i < bodys.size(); i++){
    bodys.get(i).ShowPath();
  }
  noStroke();
  for(int i = 0; i < bodys.size(); i++){
    Body b = bodys.get(i);
    b.Show();
    b.Update();
    b.Attract();
  }
  translate(max. pos. x - (width / 2), max. pos. y - (height / 2));
  fill(0, 255, 0);
  text("FPS: " + (int)frameRate, 10, 20);
  text("Body Count: " + bodys. size(), 10, 40);
  for(int i = 0; i < bodys.size(); i++){
    Body b = bodys.get(i);
    fill(b.col);
    text("Body #" + b. id + " mass = " + b.mass, 10, (i + 1) * 20 + 45);
  }
}
void keyPressed(){
  if(key == 'p' || key == 'P'){
    if(running){
      running = false;
      noLoop();
    }
    else{
      running = true;
      loop();
    }
  }
}