
$fn=30;

include<boltHolesCutout_h.scad>;
include<boltHolesCutout.scad>;

bhc_example();
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_example(){
	difference(){
    translate([-5,0,5])
      bhc_plate4Point(40,30,4,4);
		translate([-20,0,0])
			bhc_line(bhc_m2ShaftReal, bhc_m2CapSocket, bhc_m2ShaftSlip, bhc_m2CapSocket, bhc_m2ShaftThread, bhc_m2CapButton);
		translate([-10,0,0])
			bhc_line(bhc_m3ShaftReal, bhc_m3CapSocket, bhc_m3ShaftSlip, bhc_m3CapSocket, bhc_m3ShaftThread, bhc_m3CapButton);
		translate([0,0,0])
			bhc_line(bhc_m4ShaftReal, bhc_m4CapSocket, bhc_m4ShaftSlip, bhc_m4CapSocket, bhc_m4ShaftThread, bhc_m4CapButton);
		translate([10,0,0])
			bhc_line(bhc_m5ShaftReal, bhc_m5CapSocket, bhc_m5ShaftSlip, bhc_m5CapSocket, bhc_m5ShaftThread, bhc_m5CapButton);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_line(iShaft0, iCap0=0, iShaft1, iCap1, iShaft2, iCap2){
	translate([0,-10,0])
		bhc_bolt(iShaft0, iCD=iCap0);
	translate([0,0,0])
		bhc_bolt(iShaft1, iCD=iCap1);
	translate([0,10,0])
		bhc_bolt(iShaft2, iCD=iCap2);	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}