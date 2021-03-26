$fn = 60;
cylinder(d=8,h=3.5,center=true); // Pin Head

translate([0,0,-3])
	cylinder(d=4.22,h=6,center=true); // Center Pin

//translate([0,0,-3.5])	cube([10,10,3.5],center=true); // Spacer
difference(){
	translate([0,-10,-6.5])
		cube([16,50,4.5],center=true); // Back Plate

	translate([9,-10,-4])
		rotate([0,60,0])	
			cube([5,55,5],center=true);
	
	mirror([180,0,0])
		translate([9,-10,-4])
			rotate([0,60,0])	
				cube([5,55,5],center=true);
	
		translate([9,16,-4])
			rotate([0,60,90])	
				cube([15,55,5],center=true);
	
	mirror([180,0,0])
		translate([9,-36,-4])
			rotate([0,-60,90])	
				cube([15,55,5],center=true);
}