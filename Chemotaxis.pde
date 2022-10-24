//q = hard, w = normal, e = easy, l = restart

Bacteria [] bob;
Bacteria sue;
int woo = (int)(Math.random()*256);
boolean norm = true;
boolean easy = false;
boolean hard = false;
boolean game = false;
boolean rest = true;
boolean starty = false;

void setup()   
{     
  size(500, 500);
  bob = new Bacteria[5];
  for(int i = 0 ; i < 5; i++)
    bob[i] = new Bacteria();
  sue = new Bacteria();
}   
void draw()   
{    
  background(50);
  if (starty == false) {
    textAlign(CENTER);
    textSize(20);
    text("Take the coin if you dare", 250, 250);
    fill(#B752F7);
    stroke(#5FFF78);
    ellipse(250,290,30,30);
    fill(#5FFF78);
    text('$',250,297); 
    stroke(0);
    fill(255);
  }
  if (starty == true) {
    for(int i = 0; i< 5; i++){
    bob[i].move();
    bob[i].show();
    }

    sue.myMove();
    sue.myShow();



    if (rest == true) {
      for(int i = 0; i< 5; i++){
      if (dist(bob[i].myX, bob[i].myY, mouseX, mouseY) < 30) {
        game = true;
      }
      }
    }
    if ( rest == false) {
      for(int i = 0; i< 5; i++){
      if (dist(bob[i].myX, bob[i].myY, mouseX, mouseY) > 50) {
        rest = true;
      }
      }
    }

    if (game == true) {
      noLoop();

      text("GAME OVER", 250, 250);
    }
  }//starty
}//end of draw  

void mouseClicked() {
  starty = true;
}
void keyPressed() {
  if (key == 'q') {
    hard = true;
    norm = false;
    easy = false;
  } 

  if (key == 'w') {
    easy = false; 
    norm = true;
    hard = false;
  }

  if (key == 'e') {
    easy = true; 
    norm = false;
    hard = false;
  }

  if (key == 'l') {
    loop();
    game = false;
    rest = false;
  }
}//end of keypressed function


class Bacteria    
{     
  int myX, myY;
  Bacteria() {
    myX = 0;
    myY = 250;
  }

  void move() {
    myX = myX +(int)(Math.random()*5)-2;
    myY = myY +(int)(Math.random()*5)-2;

    if (rest == false) {
      myX = 0;
      myY = 250;
    }

    if (norm == true) {
      if (mouseX > myX)
        myX = myX + (int)(Math.random()*3)+2;
      else 
      myX = myX + (int)(Math.random()*3)-3;

      if (mouseY > myY)
        myY = myY + (int)(Math.random()*3)+2;
      else 
      myY = myY + (int)(Math.random()*3)-3;
    }

    if (hard == true) {
      if (mouseX > myX)
        myX = myX + (int)(Math.random()*3)+4;
      else 
      myX = myX + (int)(Math.random()*3)-5;

      if (mouseY > myY)
        myY = myY + (int)(Math.random()*3)+4;
      else 
      myY = myY + (int)(Math.random()*3)-5;
    }

    if (easy == true) {
      if (mouseX > myX)
        myX = myX + (int)(Math.random()*3)+1;
      else 
      myX = myX + (int)(Math.random()*3)-2;

      if (mouseY > myY)
        myY = myY + (int)(Math.random()*3)+1;
      else 
      myY = myY + (int)(Math.random()*3)-2;
    }
  }//end of void move

  void myMove() {
    myX = mouseX +(int)(Math.random()*3)-1;
    myY = mouseY +(int)(Math.random()*3)-1;
  }


  void myShow() {
    fill(#B752F7);
    stroke(#5FFF78);
    ellipse(myX, myY, 30, 30);
    fill(#5FFF78);
    text('$',myX,myY+7); 
    fill(255);
    stroke(0);
  }
  void show() {
    fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    noStroke();
    ellipse(myX, myY, 50, 50);
    rect(myX-25,myY,50,30);
    for(int i=-20;i<21;i+=10)
      ellipse(myX+i,myY+30,10,10);
    fill(0);
    ellipse(myX-10,myY,10,10);
    ellipse(myX+10,myY,10,10);
    fill(255);
    stroke(0);
  }//end of void show
}  
