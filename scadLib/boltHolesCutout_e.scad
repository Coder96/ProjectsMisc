
$fn=30;

include<boltHolesCutout_h.scad>;

bhc_example();
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_example(){
	difference(){
		bhc_plate4Point(30,20,4,4);
		translate([-10,0,0])
			bhc_line(bhc_m3ShaftReal, 0, bhc_m3ShaftSlip, bhc_m3CapSocket, bhc_m3ShaftThread, bhc_m3CapButton);
		translate([0,0,0])
			bhc_line(bhc_m4ShaftReal, 0, bhc_m4ShaftSlip, bhc_m4CapSocket, bhc_m4ShaftThread, bhc_m4CapButton);
		translate([10,0,0])
			bhc_line(bhc_m5ShaftReal, 0, bhc_m5ShaftSlip, bhc_m5CapSocket, bhc_m5ShaftThread, bhc_m5CapButton);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_line(iShaft0, iCap0=0, iShaft1, iCap1, iShaft2, iCap2){
	translate([0,-7,0])
		#bhc_bolt(iShaft0);
	translate([0,0,-5])
		#bhc_bolt(iShaft1, iCD=iCap1);
	translate([0,7,-5])
		#bhc_bolt(iShaft2, iCD=iCap2);	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_bolt(iSD, iSH=10, iCD=5, iCH=5){
// Bolt Shaft
  color("grey") cylinder(d=iSD, h=iSH,center=true);
// Bolt Top
	translate([0,0,(iSH/2)+(iCH/2)-.01])
		color("grey")
		cylinder(d=iCD,h=iCH,center=true);
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