Balls ball;
Balls ball1;
Balls ball2;
Balls ball3;
Bomb bomb;
boolean c;
int counter=0;
float a=0.5;
int count;
String s="Score:";
String t;
String l;
String d;
boolean pressed;
int check=0;
String u,v,g,k,h;

float color1=random(100,255);
float color2=random(100,255);
float color3=random(100,255);

void setup(){
  size(400,400);
  ball=new Balls();
  ball1=new Balls();
  ball2=new Balls();
  ball3=new Balls();
  bomb=new Bomb();
}

void draw(){
    background(255);
    if(check==0){
    fill(0);
    textSize(18);
    t="Bomb Game";
    g="Press 'Start' to start, 'Exit' to exit";
    v="Press any key to release bomb and pop red ball";
    k="Speed of bomb decreases as score increases";
    
    text(t,width/2.8,height/6);
    text(g,width/7,height/3);
    textSize(16);
    text(v,width/45,height/4);
    text(k,width/20,height/2.4);

    rectMode(CENTER);
    fill(255);
    float rect1X=width/4;
    float rect2X=3*width/4;
    float rect1Y=2*height/3;
    float rectW=130;
    float rectH=50;
    
    rect(rect1X,rect1Y,rectW,rectH);
    rect(rect2X,rect1Y,rectW,rectH);
    fill(0);
    textSize(20);
    l="Start game";
    text(l,rect1X-(rectW/2.5),rect1Y+rectH/8);
    u="Exit game";
    text(u,rect2X-(rectW/2.5),rect1Y+rectH/8);
    
    // start button
    if(mousePressed==true && mouseX>=rect1X-rectW/2 && mouseX<=rect1X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      check=check+1;
    }
    // exit button
    else if (mousePressed==true && mouseX>=rect2X-rectW/2 && mouseX<=rect2X+rectW/2 && mouseY>=rect1Y-rectH/2 && mouseY<=rect1Y+rectH/2){
      exit();
    }
  }
  
  else{
    for(int i=0;i<width-100;i=i+135){
      for(int j=0;j<width;j=j+100){
        fill(random(100,255),random(100,255),random(100,255));// Red color
        beginShape();
        vertex(i+25,j+110);//280
        vertex(i+40,j+65);//
        vertex(i-5,j+40);
        vertex(i+50,j+40);
        vertex(i+65,j);
        vertex(i+80,j+40);
        vertex(i+135,j+40);
        vertex(i+90,j+65);
        vertex(i+105,j+110);
        vertex(i+65,j+85);
        vertex(i+25,j+110);
        endShape(CLOSE);
      }
    }
    
    fill(255,0,0);
    rectMode(CENTER);
    rect(width/2,height/2,100,50);
    
    ball.display(255);
    ball.move();
    ball.reset();
    
    ball1.display(random(0,100));
    ball1.move();
    ball1.reset();
    
    ball2.display(random(0,100));
    ball2.move();
    ball2.reset();
    
    ball3.display(random(0,100));
    ball3.move();
    ball3.reset();
    
    if(pressed==true){
      bomb.displayBomb();
      bomb.moveBomb();
      bomb.overlap(ball);
    }
    
    textSize(30);
    fill(0);
    text(s,20,40);
    println(counter);
    t=Integer.toString(counter);
    text(t,110,40);
  }
  }


class Balls{
  float x,y,r;
  float speed;
  float red,green,blue;
  float cB;
  Balls(){
    x=width;
    y=height-(30+r/2);
    r=random(20,50);
    speed=random(1,3);
    red=random(0,255);
    green=random(0,255);
    blue=random(0,255);
  }
  
  void display(float colorBall){
    cB=colorBall;
    fill(cB,0,0);
    ellipse(x,y,r,r);
  }
  
  void move(){
    x=x-speed;
  }
  
  void reset(){
    if(x<=0){
      red=random(0,255);
      green=random(0,255);
      blue=random(0,255);
      x=width;
      r=random(20,50);
      speed=random(2,5);
    }
  }
}


class Bomb{
  float bombX, bombY, bombR;
  float speedR;
  float speedBomb;
  
  Bomb(){
    bombX=width/2;
    bombY=height/2;
    bombR=20;
    speedBomb=6;
  }
  
  void displayBomb(){
    fill(0,0,255);
    ellipse(bombX,bombY,bombR,bombR);
  }
  
  void moveBomb(){
    bombY=bombY+speedBomb/a;
  }
  
  void overlap(Balls ball){
    if((dist(ball.x,ball.y,bombX,bombY)<=bombR)){
      bombX=width/2;
      bombY=height/2;
      ball.r=random(20,50);
      ball.y=height-ball.r;
      ball.x=width;
      counter=counter+1;
      pressed=false;
      a=a+0.5;
         
    }
    else if(bombY>=height){
      bombX=width/2;
      bombY=height/2;
      pressed=false;
    }
    
  
}
}

void keyPressed(){
  pressed=true;
}
