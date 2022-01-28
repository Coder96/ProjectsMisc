//translate([-6,0,-5])
//import("Rubbermaid_21_cup_spool_stand/files/Spool_Side_Blank.stl");

rotate([0,90,90])
translate([-607,850,-10])
import("filament+dry+box/files/Base.stl");


use<../../../scadLib/honeycomb_mesh.scad>;
use<../../../scadLib/edgeTools/corner_tools.scad>;
include<shared.scad>;

use<rollerSideMount.scad>;

//sideHighMesh();

boltSize=7.9;
//difference(){
  union(){
//    sideLowFameMesh();
    sideLowFame();
//    translate([-60,14,0])
//      cylinder(h=gZ,d=boltSize+6,center=true);
 }
//  translate([-60,14,gZ/2]) 
//    fillet_r(1,(boltSize+6)/2,1,$fn);
//  translate([-60,14,-2])
//    cylinder(h=gZ,d=boltSize,center=true);
//}

//translate([0,-10,0])
//  pointsBase();

////////////////////////////////////////////
module sideLowFameMesh(){
	intersection(){
    translate([0,0,-side_hc_offset/2])
      hexagonal_grid([side_hc_width, side_hc_length, side_hc_height], side_hc_diameter, side_hc_thickness);
      sideLowBlock();
  }
}
////////////////////////////////////////////
module sideLowFame(){
  dWidth=sideWidth/2.5;
	difference(){
    translate([0,0,0])
      sideLowBlock();
    
    translate([(dWidth/2)-(sideWidth/2),2,0])
      scale([0.90,0.80,1.2])
        sideLowBump(dWidth);
    translate([(-dWidth/2)+(sideWidth/2),2,0])
      scale([0.90,0.80,1.2])
        sideLowBump(dWidth);
    difference(){
      translate([0,-2.4,0])
        scale([1,1,1.2])
        sideLowCenter(dWidth+5,50);
      
      translate([0,-3,0])
        cube([100,10,gZ+1],center=true);
    }
	}
}
////////////////////////////////////////////
module sideLowBlock(){
	dWidth=sideWidth/2.5;
// Left	
  translate([(dWidth/2)-(sideWidth/2),0,0])
    sideLowBump(dWidth);
// Right
	translate([(-dWidth/2)+(sideWidth/2),0,0])
		resize([dWidth,0,0])
    sideLowBump(dWidth);
// Center
  sideLowCenter(dWidth);
}
/////////////////////////////////////////////
module sideLowBump(dWidth){
	resize([dWidth,0,0])
	botSideCurve(50);
}
/////////////////////////////////////////////
module sideLowCenter(dWidth,iCurveSize=50){
	difference(){
// Main block
    translate([0,0,0])
      cube([58,33,gZ],center=true);
// Remove bottom
    translate([0,-16.5,0])
      cube([58+1,33,gZ+1],center=true);
// Curve
			translate([0,33.1,0])
				rotate([180,0,0])
				resize([dWidth+.22,0,gZ+1])
				botSideCurve(iCurveSize);
	}
}
/////////////////////////////////////////////
module sideHighMesh(){
	translate([0,-77,0])
		pointsBase();

	difference(){
	translate([0,0,0])
		sideHigh();
		difference(){
			scale([0.95,0.95,1.2])
				sideHigh();
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
}
/////////////////////////////////////////////
module sideHigh(){
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
module botSideCurve(iDiamiter=100){
	difference(){
		cylinder(d=iDiamiter,h=gZ,center=true);
		translate([0,-iDiamiter/2,0])
			cube([iDiamiter+1,iDiamiter,gZ+2],center=true);
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