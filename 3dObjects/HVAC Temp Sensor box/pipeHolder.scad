$fn = 30;

od = 12;
id = 10;
//cylinder(h=10,d=3,center=true);
//rotate([0,10,0]) cylinder(h=10,d=3,center=true);

difference(){
	pipe(od,od+2);
	pipe(id,od+4);
}
difference(){
	translate([0,0,-13]) color("Lime") hull(){
		translate([-13,-17,0])  cylinder(h=3,d=4,center=true);			//
		translate([-13,+17,0])  cylinder(h=3,d=4,center=true);			//
		translate([+13,-17,0])  cylinder(h=3,d=4,center=true);			//
		translate([+13,+17,0])  cylinder(h=3,d=4,center=true);			//
	}
	translate([0,0,-13]) cylinder(h=6,r=id,center=true);
	
	translate([-10,-15,-15])  cylinder(h=16,r=1.5,center=true);			//
	translate([-10,+15,-15])  cylinder(h=16,r=1.5,center=true);			//
	translate([+10,-15,-15])  cylinder(h=16,r=1.5,center=true);			//
	translate([+10,+15,-15])  cylinder(h=16,r=1.5,center=true);			//
}


module pipe(diamoter=1,len=1){
	sphere(r = diamoter, center=true);
	translate([0,0,-len/2]) cylinder(h=len,r=diamoter,center=true);
	rotate([0,-90,0]) translate([0,0,-len/2]) cylinder(h=len,r=diamoter,center=true);
}
