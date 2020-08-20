$fn=60;

boardWidth = 17.5;
boardDepth = 70.4;
boardThickness = 2;


boardHoleOffSetWidth = boardWidth - 3;
boardHoleOffSetDepth = boardDepth - 3;
boardHolediamiter = 2.5;

baseDepth = boardDepth + 6;
baseWidth = boardWidth + 6;
baseHeigth = boardThickness + 6;
baseCornerDiameter = 4;

baseFeetWidth = 8;
baseFeetLength = 6;
baseFeetFromEdge = 6;
baseFeetHeigth = 3;
baseFeetOffSetBoltHole = 3;
baseFeetDiamiterBoltHole = 3;
baseFeetDiamiterBoltHeadHole = baseFeetDiamiterBoltHole + 3;
baseFeetInsideAngleInclude = "Y";	// ["Y", "N"]
baseFeetInsideAngleOffset = 8;
baseFeetOutsideAngleInclude = "Y";	// ["Y", "N"]
baseFeetOutsideOffset = 5;

module empty(){}
//% translate([0,0,(baseHeigth/2) - (boardThickness/2) + .1]) board();

base();

////////////////////////////////////////////////////////////////////////////////////////////////////
module base(){

	difference(){
		// 
		union(){
			plate4Point(baseWidth,baseDepth,baseHeigth,4);
			rotate([0,0,90]) 
				feet();
		}
		boardCutOut();
		// center cutout
		plate4Point(boardWidth-.5,boardDepth-8,baseHeigth + 2,6);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module boardCutOut(){

	z = (baseHeigth/2) - (boardThickness/2) + .1;
//
	translate([0,0,z])
	board();
//		plate4Point(
//			boardWidth,
//			boardDepth,
//			boardThickness,1
//	);
// Corner cutouts
	for(a=[[1, 1],[-1, 1],[1, -1],[-1, -1]]){
		translate([
			(boardWidth/2)*a[0], 
			(boardDepth/2)*a[1], 
			z]
		)
		cylinder(h=boardThickness,d=3,center=true);
	}
// Board mounting holes
	for(a=[[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([
			a[0] * boardHoleOffSetWidth/2,
			a[1] * boardHoleOffSetDepth/2,
			0
		])
			cylinder(h=baseHeigth+5,d=boardHolediamiter-.2,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module feet(){
	
	baseFeetOffSetHeigth = baseHeigth -baseFeetHeigth;
	baseFeetLength = baseWidth + baseFeetLength*2;
	
	for(a=[1, -1]){
		translate([
			a*((baseDepth/2)-baseFeetFromEdge) - a, 
			0,
			-baseFeetOffSetHeigth/2
		]) 
			difference(){
				hull(){
//// Cube for heigth
//					translate([0, 0, baseFeetOffSetHeigth/2])
//						cube([baseFeetWidth, baseWidth, baseHeigth], center=true);
// Inside angle
					if(baseFeetInsideAngleInclude == "Y"){
						translate([-baseFeetInsideAngleOffset * a, 0, 0])// baseFeetOffSetHeigth/2
							cube([1, baseWidth, baseFeetHeigth], center=true);
					}
// Outside angle
					if(baseFeetOutsideAngleInclude == "Y"){
						translate([baseFeetOutsideOffset * a, 0, 0])
							plate2Point(baseWidth, baseFeetHeigth, baseCornerDiameter);
					}
// Foot
					plate2Point(baseFeetLength, baseHeigth - baseFeetOffSetHeigth, baseFeetWidth);
				}
// Bolt Hole
				for(b=[1,-1]){	
// Head
					translate([
						0, 
						b*(baseFeetLength/2) - b*baseFeetOffSetBoltHole, 
						baseHeigth - (baseFeetHeigth/2)
					])
						cylinder(h=baseHeigth+2, d=baseFeetDiamiterBoltHeadHole, center=true);
// Shaft
					translate([0, b*(baseFeetLength/2) - b*baseFeetOffSetBoltHole, 0])
						cylinder(h=baseHeigth+2, d=baseFeetDiamiterBoltHole, center=true);
// Fillet
//					translate([
//						0,
//						b * (baseFeetLength/2),
//						-baseHeigth/2
//					])
//						rotate([0, 90, 0])
//						resize([0, 0, 0])
//#						cylinder(h=2, d=1, center=true);
				}
			}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module board(){
	difference(){
		plate4Point(boardWidth,boardDepth,boardThickness,1);
		for(a=[[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([
				a[0] * boardHoleOffSetWidth/2,
				a[1] * boardHoleOffSetDepth/2,
				0
			])
				cylinder(h=5,center=true);
		}
	}
}