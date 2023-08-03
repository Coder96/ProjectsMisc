
include<boltHolesCutout_h.scad>;

////////////////////////////////////////////////////////////////////////////////////////////////////
module bhc_bolt(iSD, iSH=10, iCD=5, iCH=5){
// Bolt Shaft
  color("grey") cylinder(d=iSD, h=iSH,center=true);
// Bolt Top
	translate([0,0,(iSH/2)+(iCH/2)-.01])
		color("grey")
		cylinder(d=iCD,h=iCH,center=true);
}
