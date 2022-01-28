use<../../scadLib/library.scad>;

include<battery9vModelBlank.scad>;


//rotate([90,0,-90]) translate([0,0,-b9mb_battery9vTotalHeigthExternal/2])
//  b9mb_battery9vModelBlank(true);

$fn=60;

batteryHolder9VBoxWallThickness = 3;

batteryHolder9VBoxInnerWidth  = b9mb_battery9vTotalHeigthExternal + 1;
batteryHolder9VBoxInnerDepth  = b9mb_battery9vBodyWidth + 1;
batteryHolder9VBoxInnerHeigth = b9mb_battery9vBodyDepth  + 3;

batteryHolder9VBoxWidth  = batteryHolder9VBoxInnerWidth + batteryHolder9VBoxWallThickness;
batteryHolder9VBoxDepth  = batteryHolder9VBoxInnerDepth + batteryHolder9VBoxWallThickness;
batteryHolder9VBoxHeigth = b9mb_battery9vBodyDepth + 2; 

batteryHolder9vBaseWidth  = batteryHolder9VBoxInnerWidth/2;
batteryHolder9vBaseDepth  = batteryHolder9VBoxInnerDepth/2;
batteryHolder9vBaseHeight = 10;
batteryHolder9vBaseInset  = 5;

batteryHolder9vCage();

//translate([0,0,-22]) batteryHolder9vBase(10);

////////////////////////////////////////////////////////////
module batteryHolder9vCage(){
	
	baseThicness = 6;
	
	difference(){
		// Outside Size
//		cube([batteryHolder9VBoxWidth,batteryHolder9VBoxDepth,batteryHolder9VBoxHeigth],center=true);
    plate4Point(batteryHolder9VBoxWidth,batteryHolder9VBoxDepth,batteryHolder9VBoxHeigth,4);
		// Cutout
		cube([batteryHolder9VBoxInnerWidth,batteryHolder9VBoxInnerDepth,batteryHolder9VBoxInnerHeigth],center=true);
// Cord Slot
    translate([(-b9mb_battery9vBodyHeigth/2)-1,b9mb_battery9vBodyWidth/2,(b9mb_battery9vBodyDepth/2)-2])
      cube([3,b9mb_battery9vBodyWidth/2,b9mb_battery9vBodyDepth],center=true);
	}
	//botttom
	difference(){
		translate([0,0,(-batteryHolder9VBoxHeigth/2)-(baseThicness/2)+.1]) // add .1 to bond thae parts
//			cube([batteryHolder9VBoxWidth,batteryHolder9VBoxDepth,baseThicness],center=true);
      plate4Point(batteryHolder9VBoxWidth,batteryHolder9VBoxDepth,baseThicness,4);
		
		translate([0,0,(-batteryHolder9VBoxHeigth/2)-(baseThicness/2)+.1]) 
			translate([0,0,-3.4])
				batteryHolder9vMountingPoints(10);
	}
}
/////////////////////////////////////////////////////////////
module batteryHolder9vMountingHole(baseHeight){
//	cylinder(d=3.2,h=baseHeight+5,center=true);
//	translate([0,0,baseHeight/2])
//		cylinder(d=6,h=3,center=true);
  
  	cylinder(d=4.2,h=baseHeight+5,center=true);
	translate([0,0,baseHeight/2])
		cylinder(d=8,h=3,center=true);
}
/////////////////////////////////////////////////////////////
module batteryHolder9vMountingPoints(baseHeight=20){
	for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
		translate([
			a[0]*(batteryHolder9vBaseWidth)-(a[0]*batteryHolder9vBaseInset),
			a[1]*(batteryHolder9vBaseDepth)-(a[1]*batteryHolder9vBaseInset),
			0
		])
			color("grey")
			batteryHolder9vMountingHole(baseHeight);
		}
}
/////////////////////////////////////////////////////////////
module batteryHolder9vBase(baseHeight){
	difference(){
		union(){
			for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
				translate([
					a[0]*(batteryHolder9vBaseWidth)-(a[0]*batteryHolder9vBaseInset),
					a[1]*(batteryHolder9vBaseDepth)-(a[1]*batteryHolder9vBaseInset),
					0
				])
					cylinder(d=6,h=baseHeight,center=true);
			}
			difference(){
				translate([0,-batteryHolder9vBaseDepth+batteryHolder9vBaseInset,0]){
					cube([(batteryHolder9vBaseWidth*2)-batteryHolder9vBaseInset,3,baseHeight],center=true);
				}
//				translate([0,-batteryHolder9vBaseDepth+batteryHolder9vBaseInset,0])
//					rotate([90,0,0])
//					translate([0,3,0])
//					plate4Point((batteryHolder9vBaseWidth*2)-batteryHolder9vBaseInset-15,baseHeight,baseHeight,4);
			
				translate([0,-batteryHolder9vBaseDepth+batteryHolder9vBaseInset,-3])
					rotate([90,90,0])
					roundedTrapezoid(3, 
						batteryHolder9vBaseWidth-batteryHolder9vBaseInset-9, 
						baseHeight,batteryHolder9vBaseWidth-batteryHolder9vBaseInset-4,
						5 ,4);
			}
			translate([-batteryHolder9vBaseWidth+batteryHolder9vBaseInset,0,0])
				cube([3,(batteryHolder9vBaseDepth*2)-batteryHolder9vBaseInset,baseHeight],center=true);

			translate([batteryHolder9vBaseWidth-batteryHolder9vBaseInset,0,0])
				cube([3,(batteryHolder9vBaseDepth*2)-batteryHolder9vBaseInset,baseHeight],center=true);
		}
		translate([0,0,2])
			batteryHolder9vMountingPoints(baseHeight);
	}
}