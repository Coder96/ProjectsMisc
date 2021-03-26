$fn = 30;

RingWidth = 10;
RingHeigth = 40;
RingDepth = 1;
RingThickness = 2;

RibHeigth = 2;
RibThickness = 1;

ScrewShaftSize = 5;

cutout1x = -50;
cutout1y = 4;
cutout1z = -15;

cutout2x = 100;
cutout2y = 30;
cutout2z = 30;

//union(){
	RingBig();
	RingRib();
	Feet();
//}

module RingRib(){
	minkowski() {
		difference(){
			difference(){
				Ring(RingHeigth+RibHeigth, RibThickness); // Rib
				Ring(RingHeigth-RingThickness, RingWidth+3); //Inner
			}
			translate([cutout1x,cutout1y,cutout1z])
				cube([cutout2x,cutout2y,cutout2z]);
		}
		sphere(1);
	}
}

module RingBig(){
	minkowski() {
		difference(){
			difference(){
				Ring(RingHeigth, RingWidth); // Outer
				Ring(RingHeigth-RingThickness, RingWidth+3); //Inner
			}
			translate([cutout1x,cutout1y,cutout1z])
				cube([cutout2x,cutout2y,cutout2z]);
		}
		sphere(1);
	}
}

module Ring(inHeigth, inWidth){
	hull(){
		scale([1,RingDepth,1])
			translate([inHeigth/2,0,0]) cylinder(inWidth,d=inHeigth,center=true);
		scale([1,RingDepth,1])
			translate([-inHeigth/2,0,0]) cylinder(inWidth,d=inHeigth,center=true);
	}
}
module Feet(){
	translate([RingHeigth-2,1,-RingWidth/2])
		Foot(30, RingWidth);
	rotate([0,180,0])
		translate([RingHeigth-2,1,-RingWidth/2])
			Foot(30, RingWidth);
}
module Foot(inHeigth, inWidth) {
	difference(){
		difference(){
			minkowski() {
				translate([0,0,0])
					cube([inHeigth, inWidth, inWidth]);
				sphere(1);
			}
			translate([cutout1x,cutout1y,cutout1z])
				cube([cutout2x,cutout2y,cutout2z]);
		}
	rotate([90,0,0])
		translate([13, RingWidth/2, 15])
			screwSpace();
	rotate([90,0,0])
		translate([25, RingWidth/2, 15])
			screwSpace();
	}
}

module screwSpace() {
	minkowski() {
		cylinder(20, d=10, center=true); //outter
		sphere(1);
	}	
	translate([0,0,-10])
		cylinder(20, d=ScrewShaftSize, center=true); //inner
}
