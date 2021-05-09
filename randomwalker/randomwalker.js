function setup() {
  createCanvas(400, 400);
  x = width/2;
  y = height/2;
}

function draw() {
  num = random(4);
  if(num<1)
  {
    x++;
  }else if(num < 2)
  {
    x--;
  }else if(num < 3)
  {
    y++;
  }
  else
  {
    y--;
  }
  ellipse(x,y,2,2);
}
