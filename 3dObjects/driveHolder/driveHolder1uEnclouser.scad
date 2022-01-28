$fn=30;

use <../honeycomb_mesh.scad>;
use <../../scadLib/library.scad>;


hdWidth = 70;
hdLength = 103;
hdHeigth = 9.5;

hdLengthThreadSeperationOC = 76.5;
hdWidthThreadSeperationOC = 62;

hdLengthThreadFromBack = 10;

postWidthOC = 80;
postDepthOC = 129;

xPostWidth = 10;
xPostThicknesss = 3;
xPostDiamiter = 6;

sPostDiamiterB = 9.3;
sPostDiamiterT = 7.3;
sPostHeigth = 5;

M2SizeT = 2.0;
M2SizeS = 2.4;

M3SizeT = 3.2;
M3SizeS = 3.5;

M4SizeT = 4.2;
M4SizeS = 4.4;

//translate([0,0,11]) hdModel();

// 	translate([-postWidthOC/2,-postDepthOC/2,2]) cylinder(h=5,d=16,center=true);
// 	translate([postWidthOC/2,-postDepthOC/2,2]) cylinder(h=5,d=16,center=true);

//	union(){
//		translate([0,-postDepthOC/2,2]) shortBar();
//		translate([-(postWidthOC/2),0,2]) rotate([0,0,90]) longBar();
//	}

// longBar2("");

driveHolder();

////////////////////////////////////////////////////////////////////////////////////////////////////
module driveHolder(){
	difference(){
		union(){
			translate([0,-postDepthOC/2,0]) shortBar2();
			translate([-postWidthOC/2,0,0]) rotate([0,0,90]) longBar2();
			mirror([90,0,0]) translate([-postWidthOC/2,0,0]) rotate([0,0,90]) longBar2();
		}
		posts();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module shortBar(){
	difference(){
		plate2Point(postWidthOC+16,5,14);
		translate([0,-10,0]) plate2Point(postWidthOC-3,7,17);
		translate([0,10,0]) plate2Point(postWidthOC-3,7,17);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module longBar(){
	difference(){
  	plate2Point(postDepthOC+16,5,14);
  	translate([0,10,0]) plate2Point(postDepthOC-3,7,17);
  	translate([0,-10,0]) plate2Point(postDepthOC-3,7,17);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module shortBar2(){
	intersection(){
		translate([0,0,-2])rotate([0,90,0]) cylinder(h=postWidthOC,d=16,center=true);
		translate([0,0,0]) cube([postWidthOC,10,100],center=true);
	}
	intersection(){
		translate([postWidthOC/2,0,-10]) sphere(16);
		translate([postWidthOC/2,0,-10]) cylinder(h=postWidthOC,d=18,center=true);
	}
	intersection(){
		translate([-postWidthOC/2,0,-10]) sphere(16);
		translate([-postWidthOC/2,0,-10]) cylinder(h=postWidthOC,d=18,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module longBar2(tab="Y"){
	intersection(){
		translate([0,0,-2])rotate([0,90,0]) cylinder(h=postDepthOC,d=16,center=true);
		translate([0,0,0]) cube([postDepthOC,10,100],center=true);
	}
	intersection(){
		translate([postDepthOC/2,0,-10]) sphere(16);
		translate([postDepthOC/2,0,-10]) cylinder(h=postDepthOC,d=18,center=true);
	}
	intersection(){
		translate([-postDepthOC/2,0,-10]) sphere(16);
		translate([-postDepthOC/2,0,-10]) cylinder(h=postDepthOC,d=18,center=true);
	}
	if(tab=="Y"){
		translate([-(hdLength/2)+hdLengthThreadFromBack,-3,8]) hdTab();
		translate([-(hdLength/2)+hdLengthThreadFromBack+hdLengthThreadSeperationOC,-3,8]) hdTab();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module hdTab(){
	difference(){
		union(){
//			plate4Point(10,4,10,4);
			hull(){
				translate([3,0,10]) sphere(2);
				translate([-3,0,10]) sphere(2);
				translate([0,0,-5])plate4Point(20,4,.0001,4);
			}
		}
		translate([0,0,7]) rotate([90,0,0]) cylinder(h=5,d=M3SizeS,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module hdModel(){
	difference(){
		union(){
			plate4Point(hdWidth,hdLength,hdHeigth,3);
			color("red") translate([0,0,1]) mText("Top");
			color("red") translate([0,(hdLength/2)-7,1]) mText("Front");
			color("red") translate([0,-(hdLength/2)+7,1]) mText("Back");
		}
		for(a=[1,-1]){
			translate([a*(hdWidth/2),-(hdLength/2)+hdLengthThreadFromBack,-1]) rotate([0,90,0]) cylinder(h=10,d=M3SizeT,center=true);
			translate([a*(hdWidth/2),-(hdLength/2)+hdLengthThreadFromBack+hdLengthThreadSeperationOC,-1]) rotate([0,90,0]) cylinder(h=10,d=M3SizeT,center=true);
			
			translate([a*(hdWidthThreadSeperationOC/2),-(hdLength/2)+hdLengthThreadFromBack,-1]) cylinder(h=10,d=M3SizeT,center=true);
			translate([a*(hdWidthThreadSeperationOC/2),-(hdLength/2)+hdLengthThreadFromBack+hdLengthThreadSeperationOC,-1]) cylinder(h=10,d=M3SizeT,center=true);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module posts(){

	for(a=[1,-1]){
		translate([-postWidthOC/2, a*postDepthOC/2,6.439]) xPost();
	}
	for(a=[1,-1]){
		translate([postWidthOC/2, a*postDepthOC/2,2.073]) sPost();
	}
	translate([0,0,-1]) cube([1000,1000,2],center=true);
	translate([0,0,-51]) cube([1000,1000,100],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module xPost(){
	difference(){
		union(){
			cube([xPostWidth,xPostThicknesss,13],center=true);
			rotate([0,0,90]) cube([xPostWidth,xPostThicknesss,13],center=true);
			
			translate([0,0,1.5]) cylinder(h=16, d=xPostDiamiter, center=true);
			translate([0,0,-(xPostWidth/2)-2]) sphere(d=xPostWidth);
		}
//		translate([0,0,8]) cylinder(h=6, d=M3SizeT, center=true);
		translate([0,0,-(xPostWidth)-2]) cube([xPostWidth+1,xPostWidth+1,xPostWidth],center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module sPost(){

//	difference(){
		translate([0,0,0]) cylinder(h=sPostHeigth, d1=sPostDiamiterB, d2=sPostDiamiterT, center=true);
//		translate([0,0,0]) cylinder(h=10, d=M3SizeT, center=true);
		translate([0,0,2.5]) cylinder(h=11, d=M3SizeS, center=true);
//	}
}
