$fn = 30;



difference(){
	difference(){
		base1();
		translate([19,10,10])
			screwSpace();
		translate([19,-10,10])
			screwSpace();
	}
	translate([0,0,-10])
		cube([70,70,10],center=true);	
}


module base1(){
	hull(){
		rotate([0,90,0])
			minkowski() {
				cylinder(20, d=10, center=true);
				sphere(1);
			}
		minkowski() {
			translate([0,0,-4])
				cube([20,10,2.5], center=true);
			sphere(1);
		}
	}
	hull(){
		translate([10,0,0])
			rotate([0,90,0])
				minkowski() {
					cylinder(5, d=10, center=true);
					
					sphere(1);
				}
			
		translate([20,0,-2.5])
			minkowski() {
				cube([20,40,5], center=true);
				
				sphere(1);
			}
	}	
}

module screwSpace() {
	minkowski() {
		cylinder(20, d=10, center=true);
		sphere(1);
	}	
	translate([0,0,-10])
		cylinder(20, d=5, center=true);
	
}