$fn = 40;

$pinSpacing = 38.5;//[1:100]

$BaseHeigth = 2;
$BaseWidth = 90;
$baseDepth = 40;

$ScrewDiamiter = 4;

/* ["Pin Parms"] */

$PinHeadDiamiter = 6;//[1:10]
$pinShankDiamiter = 3;//[1:10]

whole();
mirror([1,0,0]){
	translate([0,20,0]) rotate([0,0,180]) whole();
}


module whole(){
	rotate([270,0,0]){
		difference(){
			union(){
				difference(){
					union(){
						translate([0,0,0]) cube([$BaseWidth,$baseDepth,2],center=true);
						HoleSupports();
					}
					Holes();
				}
				translate([0,0,0]) pins($pinSpacing);
			}
			translate([8,($baseDepth/2)+1,3]) cube([$BaseWidth+20,$baseDepth,10], center=true);
		}
	}
}

module pins(spacing){

	translate([spacing/2,0,0]) pin();
	translate([-(spacing/2),0,0]) pin();
	
}

module pin(){
	hull(){
		translate([0,5,5]) cylinder(h=2, d=$PinHeadDiamiter, center=true);
		translate([0,0,5]) cylinder(h=2, d=$PinHeadDiamiter, center=true);
	}
	hull(){
		translate([0,5,3]) cylinder(h=5, d=$pinShankDiamiter, center=true);
		translate([0,0,3]) cylinder(h=5, d=$pinShankDiamiter, center=true);
	}
}

module HoleSupports(){
	translate([37,-10,1.5]) HoleSupport();
	translate([-37,-10,1.5]) HoleSupport();
}

module HoleSupport(){
	cylinder(h=2, d1=$ScrewDiamiter+8, d2=$ScrewDiamiter+3, center=true);
}

module Holes(){
	translate([37,-10,0]) Hole();
	translate([-37,-10,0]) Hole();
}

module Hole(){
	cylinder(h=10, d=$ScrewDiamiter, center=true);
}