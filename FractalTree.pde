private double fractionLength = 12; 
private int smallestBranch = 4; 
private double branchAngle = .40;  

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 

public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2); 
	//try to ge this to work
	keyTyped();

} 

public void keyTyped()
{
  if(key=='a'&&/* branchAngle!=.60 &&*/ branchAngle<=.80)
  	branchAngle+=.001;
  if(branchAngle==.80)
  	redraw(); 
  if(key=='d') 
  	smallestBranch+=.5;
redraw();  

  //stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));	
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
//holds angle of branches  	
  double angle1= angle + branchAngle;
  double angle2 = angle - branchAngle;
  //reduce branch length
  double rBl = branchLength*fractionLength;
  int endX1= (int)(branchLength*Math.cos(angle1) + x);
  int endX2= (int)(branchLength*Math.cos(angle2) + x);
  int endY1= (int)(branchLength*Math.sin(angle1) + y);
  int endY2= (int)(branchLength*Math.sin(angle2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if(branchLength>smallestBranch)
  {
    drawBranches(endX1,endY1,branchLength/1.1,angle1);
    drawBranches(endX2,endY2,branchLength/1.8,angle2);
  }
}