//#import("c:/misc/network_switch_port_cover.stl");
$fn=30;


difference(){
	translate([0,-30,0]) resize(newsize=[35,80,30]) sphere(d=100);
	rotate([0,20,90]) translate([5,0,11]) resize(newsize=[30,60,10]) sphere(r=10); 
	mirror(v= [0, 0, 180] ) rotate([0,20,90]) translate([5,0,11]) resize(newsize=[30,60,10]) sphere(r=10); 
	translate([0,-49,0]) cube([100,100,100],center=true);
}

Base();


module Base(){
	difference(){
		cube([14,8,9],center=true);
		translate([0,-2,0]) cube([12,8,7],center=true);
		translate([0,-2,4]) cube([8,6,8],center=true);
	}
}
//resize(newsize=[20,10,12])