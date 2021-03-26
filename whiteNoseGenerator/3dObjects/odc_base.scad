$fn=60;


translate([7.927,26,36])
	rotate([90,0,0])
	union(){
		import("../EM/43884119/boxPart1.stl");
		translate([0,0,+.4])
			import("../EM/43884119/boxPart2.stl");
	}


//#cube([140,115,60],center=true);
	
translate([-68,0,28])
	color("RED")
//	sphere(d=4);
	rotate([90,0,0])
	cylinder(d=5,h=10,center=true);
	
	
	