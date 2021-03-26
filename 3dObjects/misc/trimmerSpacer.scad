$fn=30;

difference(){
	union(){
		cylinder(d=12.3,h=8.5,center=true); // small
		translate([0,0,-7]) 
			cylinder(d=37.4,h=5.55,center=true); // large
	}
	cylinder(d=4.8,h=100,center=true); // screw hole
}