$fn = 30;

translate([3,0,0])
//%import("C:\\misc\\scad\\arm.stl");
%import("arm.stl");
difference(){
	difference(){
		base();
		translate([0,-32,11])
			screwSpace(10, 6);
		translate([0,-20,11])
			screwSpace(10, 6);
	}
	translate([0,-20,-10])
	cube([50,50,10],center=true);	
}

module base(){
	translate([0,-3,9.5])
			beam(8,10,5);
		
	translate([0,-9,1])
		rotate([90,0,0])
			beam(15,10,5);

	hull(){
		translate([0,-6.5,9.5])
			beam(2,10,5);
		translate([0,-9,7.5])
			rotate([90,0,0])
				beam(2,10,5);
	}

	
	translate([0,-24,-4.5])
		scale([1,1,1.9])
			beam(30,10,5);
	
}

module beam(length, width, depth){
	hull(){
		rotate([90,0,0]){
			translate([width/2,0,0])
				minkowski() {
					cylinder(length,d=depth,center=true);
					sphere(1);
				}	
			translate([-width/2,0,0])
				minkowski() {
					cylinder(length,d=depth,center=true);
					sphere(1);
				}
		}
	}
}

module screwSpace(outerDiamiter, innerDiamiter) {
	minkowski() {
		cylinder(20, d=outerDiamiter, center=true);
		sphere(1);
	}	
	translate([0,0,-10])
		cylinder(20, d=innerDiamiter, center=true);
	
}

module screw(){
	cylinder(15.66, d=1, center=true); // stem
	translate([0,0,8.3])
		rotate([0,90,0])
			cylinder(11.15, d=1, center=true); //head
	translate([0,0,8.3])
		rotate([90,90,0])	
			cylinder(11.15, d=1, center=true); //head
}