
//translate([0,0,6])
//	rotate([180,0,45])
//8		import("/home/jklein/objects/smb3pipe_part1-2.stl");
//translate([0,30,-.5])
//	cube([13,13,13],center=true);
difference(){
	union(){
		color("green") 
			pipe(74,14); // lip
		color("green") 
			translate([0,0,-93])
				scale([.87,.87,1])
					pipe(74,180); // shaft
	}
	translate([0,0,-12])
		cutout();
//translate([50,0,0]) cube([100,100,150],center=true);
}

module pipe(width,heigth){
	 
	cube([width,20,heigth],center=true);	// 20
	cube([20,width,heigth],center=true);
	
	cube([width-8,36,heigth],center=true); // 28
	cube([36,width-8,heigth],center=true);
	
//	cube([width-8,36,heigth],center=true); // 36
//	cube([36,width-8,heigth],center=true);

	cube([width-16,56,heigth],center=true); // 44
//	cube([52width-20,heigth],center=true);

//	cube([width-16,50,heigth],center=true); // 50
//	cube([50,width-16,heigth],center=true);

//	cube([width-20,54,heigth],center=true); //54
//	cube([52,width-20,heigth],center=true);
	
}


module cutout(){
	cylinder(d=50,h=414,center=true); // small
	translate([0,0,12])
		cylinder(d=58,h=16,center=true); // big
}