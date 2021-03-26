$fn = 30;



difference(){
	difference(){
		base1();
		translate([19,10,12])
			screwSpace();
		translate([19,-10,12])
			screwSpace();
	}
	translate([0,0,-10])
		cube([70,70,10],center=true);	
}
/*
		translate([19,10, -4.7])
			screw();
		translate([19,-10,-4.7])
			screw();
	*/		
module screw(){
	cylinder(15.66, d=1, center=true); // stem
	translate([0,0,8.3])
		rotate([0,90,0])
			cylinder(11.15, d=1, center=true); //head
	translate([0,0,8.3])
		rotate([90,90,0])	
			cylinder(11.15, d=1, center=true); //head
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
				cube([20,40,8], center=true);
				
				sphere(1);
			}
	}	
}

module screwSpace() {
	minkowski() {
		cylinder(20, d=12, center=true);
		sphere(1);
	}	
	translate([0,0,-10])
		cylinder(20, d=6, center=true);
	
}