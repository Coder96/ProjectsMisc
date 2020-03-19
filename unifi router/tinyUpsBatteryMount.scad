$fn=30;

use <../library.scad>;
use <../tinyUps/tinyUpsTray.scad>;
use <../driveHolder/driveHolder1uEnclouser.scad>;

usgWidth =  135;
usgHeigth = 28;

M2SizeT = 2.0;
M2SizeS = 2.3;

M3SizeT = 3.2;
M3SizeS = 3.4;

M4SizeT = 4.1;
M4SizeS = 4.4;

postWidthOC = 80;
postDepthOC = 129;
postWidthShortOC = 48;

batteryWidth = 36;
batteryLength = 61;
batteryThick = 9;

mount();
// shortBar3();

////////////////////////////////////////////////////////////////////////////////////////////////////
module mount(){

 translate([0,postDepthOC/2,0]) shortBar3();
 LongBar3();

 translate([0,-40/2,15]) batteryTray();
 
 translate([0,1,0]) rotate([0,45,0]) triagleSphere(15, 9, 15, 3);
 translate([0,-41,0]) rotate([0,45,0]) triagleSphere(15, 9, 15, 3);
 
 translate([0,70/2,7]) tinyUpsTray();

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module batteryTray(){
	difference(){
		plate4Point(batteryWidth+4,batteryLength+4,batteryThick+1,4);	// Out Side wall
		translate([0,0,2.1]) plate4Point(batteryWidth,batteryLength,batteryThick,3); // Battery
		plate4Point(batteryWidth-20,batteryLength-30,batteryThick+6,8); // bottom cutout
		for(a=[[1,1],[1,-1],[-1,1],[-1,-1]]){
			translate([a[0]*(batteryWidth/2),a[1]*(batteryLength/2),0]) plate4Point(25,10,20,8);
		}
		for(a=[1,-1]){
			translate([a*(batteryWidth/2),0,0]) plate4Point(10,30,20,8);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module shortBar3(){

// 	cylinder(d=1,h=40,center=true);
// 	translate([-postWidthShortOC,0,0]) cylinder(d=1,h=40,center=true);

	difference(){
		union(){
			difference(){
				color("red") translate([(-postWidthOC/2),0,0]) shortBar2("n");
				translate([-120,0,0])  cube([200,20,20],center=true);
			}
			difference(){
				color("green") translate([(postWidthOC/2)-(postWidthShortOC),0,0]) shortBar2("n");
				translate([90,0,0])  cube([200,20,20],center=true);
			}
		}
		translate([-postWidthOC/2,postDepthOC/2,0]) posts();
		translate([-8,postDepthOC/2,0]) posts();
//(-postWidthOC/2)+(postWidthShortOC/2)
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module LongBar3(){
	difference(){
		 rotate([0,0,90]) longBar2("n");
		translate([-postWidthOC/2.0,0]) posts();
	}
}
