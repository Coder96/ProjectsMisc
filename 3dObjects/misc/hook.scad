$fn=30;

//# translate([0,1,0]) cube([20,20,5],center=true);

translate([0,-10,0])
	cube([20,2,10],center=true);

color("BLUE")
translate([0,12,0])
	cube([20,2,10],center=true);

color("GREEN")
rotate([0,0,90])
	translate([-17,10,0])
	cube([60,2,10],center=true);

	
translate([-5,-42,0])
	rotate([0,90,0])
	cylinder(h=10, r=4, center=true);


translate([0,-40,0])
	rotate([0,90,0])
	scale([1,1.5,1])
	cylinder(h=3, r=4, center=true);