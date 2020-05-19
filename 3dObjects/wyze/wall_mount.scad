$fn=30;

base_d      = 50.3;
hole_d      = 7.5;
wall_gap    = 16 + 4;

mag_sp      = 17;

th          = 5;

includeMagnets = 0;
includeScreewHoles = 0;
supportType = "flat"; // round, flat

orientation = 0; //"th" for wall side up, 0 for wall side down


difference() {
	hull() {
		// Base Front
		translate([base_d/2 + wall_gap + orientation, 0, 0]) 
			cylinder(h=th, d=base_d);
		// Add support
		if(orientation == 0) {
			if(supportType == "round"){
				translate([base_d/2 + wall_gap + orientation, 0, 0])
					cylinder(h=th, d=base_d);
				translate([0, -base_d/2, -base_d])
					cube([th, base_d, th]);
			}
			if(supportType == "flat"){
				translate([base_d/2 + wall_gap + orientation, 0, 0])
					cylinder(h=th, d=base_d);
				translate([base_d/2 + wall_gap + orientation, 0, -base_d])
					cylinder(h=th, d=base_d);
				translate([0, -base_d/2, -base_d])
					cube([th, base_d, th]);
			}
		}
		translate([0, -base_d/2, 0])
			cube([wall_gap, base_d, th]);
	}
// camera mount hole
	translate([base_d/2 + wall_gap + orientation, 0, -50])
		cylinder(h=100, d=hole_d);
// Add materal for suppports
	if(orientation == 0) {
		hull(){
			translate([base_d/2 + wall_gap + orientation, 0, -base_d+2])
				cylinder(h=th, d=base_d-th-th);
			translate([base_d/2 + wall_gap + orientation, 0, -th])
				cylinder(h=th, d=base_d-th-th);
			translate([0, (-base_d/2)+th, -base_d])
				cube([th, base_d-th-th, th]);
			translate([0, (-base_d/2)+th, -th])
				cube([th, base_d-th-th, th]);
		}
		// Cut off wedge.
		if(supportType == "flat"){
			hull(){
			// Bottom
			translate([0, (-base_d/2)-th, -base_d-th-th])
				cube([th, base_d+10, th]);
			// top Front
			translate([base_d+(base_d/2)-th, (-base_d/2)-th, -th])
				cube([th, base_d+10, th]);
			// Bottom Front
			translate([base_d+(base_d/2)-th, (-base_d/2)-th, -base_d-th])
				cube([th, base_d+10, th]);
			}
		}
	}
//	hull(){
	translate([th, -6, -.1])
		cube([12, 12, th+1]);
//	translate([th+6, -6, th])
//		cube([4, 12, 4]);
//	}
}

difference() {
	translate([0, -base_d/2, -base_d]) 
		cube([th, base_d, base_d]);

	//magnet insets
	if(includeMagnets == 1){
		translate([0, mag_sp, -base_d/2]) rotate([0, 90, 0]) magnet();
		translate([0, -mag_sp, -base_d/2]) rotate([0, 90, 0]) magnet();
		translate([0, 0, mag_sp -base_d/2]) rotate([0, 90, 0]) magnet();
		translate([0, 0, -mag_sp -base_d/2]) rotate([0, 90, 0]) magnet();
	}
	//screwholes
	if(includeScreewHoles == 1){
		translate([-1, 0, 9 -base_d/2]) rotate([0, 90, 0]) color("green") cylinder(h=th+2, d=4.4);
		translate([-1, 0, -9 -base_d/2]) rotate([0, 90, 0]) color("green") cylinder(h=th+2, d=4.4);
	}
}

module magnet() {
	magnet_d        = 8.2;
	magnet_h        = 2.2 + 2;
	translate([0, 0, -1]) 
		color("red") 
		cylinder(h=magnet_h+1, d=magnet_d, $fn=100);
}
module side() {
	len = wall_gap + base_d/2;
	translate([0, 0, -len]) difference() {
		cube([len, th, len]);
		rotate([0, 45, 0]) 
			translate([0, -1, -len/5])
			cube([len*2, th+2, len*2]);
	}
}
module side() {
	len = wall_gap + base_d/2;
	translate([0, 0, -len]) difference() {
		cube([len, th, len]);
		rotate([0, 45, 0]) translate([0, -1, -len/5])cube([len*2, th+2, len*2]);
	}
}