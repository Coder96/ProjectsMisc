$fn = 30;

translate([3,0,0])
%import("C:\\misc\\scad\\arm.stl");

difference(){
	difference(){
		base();
		translate([0,-32,9.5])
			screwSpace(10, 5);
		translate([0,-20,9.5])
			screwSpace(10, 5);
	}
	translate([0,-20,-10])
	cube([50,50,10],center=true);	
}

module base(){
	translate([0,0,9.5])
			beam(15,10,5);
		
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