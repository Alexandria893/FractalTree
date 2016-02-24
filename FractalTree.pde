private double fractionLength = 1; 
private int smallestBranch = 5; 
private double branchAngle = .40;  
//turn back after reaching a point
private double trnb = .008;

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
  if(key=='a')
  {	
 	branchAngle+=trnb;
 	stroke((int)(Math.random()*255),(int)(Math.random()*50),(int)(Math.random()*255));
  } 
  if(branchAngle>=.9)
  	trnb= -.010; 
  if(branchAngle<=-.9)
  	trnb=.008;

redraw();
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


