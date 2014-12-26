ArrayList<GameObject> objects = new ArrayList<GameObject>();


void setup(){
  size(750,750);
    objects.add(new Rat(100,100));
  
}

void draw(){
  background(0);
  
  for(int i = 0; i < 15; i++){
    stroke(255);
    line(0,i*50,width,i*50);
    line(i*50,0,i*50,height);
  }  
  
  for (int i = 0 ; i < objects.size() ; i++)
  {
   objects.get(i).move();
   objects.get(i).display();
  }
}
