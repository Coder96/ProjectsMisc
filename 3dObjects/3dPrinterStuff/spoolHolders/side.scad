//translate([-6,0,-5])
//import("Rubbermaid_21_cup_spool_stand/files/Spool_Side_Blank.stl");

use<../../../scadLib/honeycomb_mesh.scad>;
include<shared.scad>;

use<rollerSideMount.scad>;

  
translate([0,-77,0])
	pointsBase();

difference(){
translate([0,0,0])
	side();
	difference(){
		scale([0.95,0.95,1.2])
			side();
		translate([0,sideLegth,0])
		scale([1.2,1.22,1.2])
			cube([sideTopCutoutX,sideTopCutoutY,gZ+2],center=true);
	}
  translate([0,sideLegth,0])
    rollerSideMountBaseCutOut();
}
//  translate([0,sideLegth,10])
//    rollerSideMountBase();

//  Mesh
//intersection(){
//translate([0,0,-side_hc_offset/2])
//	hexagonal_grid([side_hc_width, side_hc_length, side_hc_height], side_hc_diameter, side_hc_thickness);
//	side();
//}
/////////////////////////////////////////////
module side(){
	difference(){
		hull(){
			translate([0,sideLegth/2,0])
				top();
		
	// Bottom side curves
			translate([-47,-67,0])
				botSideCurve();
			translate([47,-67,0])
				botSideCurve();
		}
		translate([0,sideLegth,0])
			cube([sideTopCutoutX,sideTopCutoutY,gZ+2],center=true);
	}
}
/////////////////////////////////////////////
module top(){
	cylinder(d=100,h=gZ,center=true);
//	rotate([0,0,30])
//	cube([10,50,gZ+2],center=true);
}
/////////////////////////////////////////////
module botSideCurve(){
	difference(){
		cylinder(d=100,h=gZ,center=true);
		translate([0,-100/2,0])
			cube([101,100,gZ+2],center=true);
	}
}
/////////////////////////////////////////////
module pointsBase(){
	
	seperation = 87;
			
	pointBase();
	translate([seperation,0,0])
		pointBase();
	translate([-seperation,0,0])
		pointBase();

}
/////////////////////////////////////////////
module pointBase(){
	hull(){
		translate([0,-10,0])
		cylinder(d=.1,h=gZ,center=true);

		translate([10,10,0])
			cylinder(d=.1,h=gZ,center=true);

		translate([-10,10,0])
			cylinder(d=.1,h=gZ,center=true);
	}
}