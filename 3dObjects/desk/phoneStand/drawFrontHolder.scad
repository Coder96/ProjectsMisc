 $fn = 60;

use<../../../scadLib/library.scad>;

cabnetWidth = 329.946;
cabnetHeigth = 159.004;
cabnetDepth = 189.992;

cabnetWallthickness = 5.8;
cabnetdrawerSpaceing = 3;

$opening_Depth = 99;
/*

FH = Full Heigth
FW = Full Width 

HH = Half Heigth
HW = Half Width

*/
opening_HW_Width  = 156; // (cabnetWidth/2) -(3*cabnetWallthickness);
opening_HH_Heigth = 72;  //(cabnetHeigth/2)-(3*cabnetWallthickness);

drawer_HW_HW_FrontWidth  = 153; //   = opening_HW_Width  -(1*cabnetdrawerSpaceing);
drawer_HH_HW_FrontHeigth = 69;  //   = opening_HH_Heigth-(1*cabnetdrawerSpaceing);

drawer_FrontThickness = cabnetWallthickness;

magnetDiamiter = 11.2;
magnetthicness = 2.2;

//openingModel(opening_HW_Width, opening_HH_Heigth);


wHeigth = opening_HH_Heigth-drawer_FrontThickness-1;

//translate([
//	0,
//	(-drawer_HH_HW_FrontHeigth/2)+(2*cabnetWallthickness),
//	(drawer_HH_HW_FrontHeigth/2)-1.5
//	])
//	rotate([-90,0,0])
//	drawerModel(drawer_HW_HW_FrontWidth, drawer_HH_HW_FrontHeigth, drawer_FrontThickness);
//+difference(){
//rotate([90,0,90]) translate([-10,-2.5,-(drawer_HW_HW_FrontWidth/2)])

	sideRail(wHeigth, 4);

//translate([-35,0,0])
//  cube([80,100,20],center=true);
  
//translate([0,-20,0])#
//  cube([80,40,20],center=true);
//}
	



//---------------------------------------------------------
module sideRail(iHeigth, iDepth=10){

	wPlateWidth = 10;
	wPlateHeigth = 2;

	translate([10,0,-(iDepth/2)+(wPlateHeigth/2)])
		plate4Point(wPlateWidth, iHeigth, wPlateHeigth, 4);
	
	color("red")
		translate([0,(iHeigth/2)-2,0]) 
		sideRailMount(iHeigth, iDepth);
	color("blue")
		mirror([0,90,0])
		translate([0,(iHeigth/2)-2,0]) 
		sideRailMount(iHeigth, iDepth);
}
//---------------------------------------------------------
module sideRailMount(iHeigth, iDepth, iStep=0){
	
	difference(){
		sideRailMount2(iHeigth, iDepth);
		scale([.9,.5,1.5])
			translate([0,-5,0])
			rotate([0,0,-7])
			sideRailMount2(iHeigth, iDepth);
	}
}
//---------------------------------------------------------
module sideRailMount2(iHeigth, iDepth=10){
	
	wLength     = drawer_HH_HW_FrontHeigth + 5;
	wDiamiter   = 4;
	wFaceHeigth = 28;
	wDepth      = iDepth;
	
	hull(){
		translate([(wLength/2)-(wDiamiter),0,0]) color("red") // TR
			cylinder(d=wDiamiter, h=wDepth,center=true);
		translate([(wLength/2)-(wDiamiter),-wFaceHeigth,0]) color("blue")  // BR
			cylinder(d=wDiamiter, h=wDepth,center=true);
		translate([(-wLength/2)+(wDiamiter),0,0]) color("green") // TL
			cylinder(d=wDiamiter, h=wDepth,center=true);
		translate([(wLength/2)-(wDiamiter)-6,-wFaceHeigth,0]) color("blue")  // BL
			cylinder(d=wDiamiter, h=wDepth,center=true);
	}
}
//---------------------------------------------------------
module magnet(iAjustHeigth=0){
	cylinder(d=magnetDiamiter , h=magnetthicness+iAjustHeigth , center=true);
//    cube([6.2,6.2,1],center=true);
}
//---------------------------------------------------------
module openingModel(iWidth, iHeigth, iDepth=10){
	wWidth  = iWidth  + (2*cabnetWallthickness);
	wHeigth = iHeigth + (2*cabnetWallthickness);
	difference(){
		cube([wWidth, iDepth, wHeigth],center=true);
		cube([iWidth, iDepth+1, iHeigth],center=true);
	}
}
//---------------------------------------------------------
module drawerModel(iWidth, iHeigth, iDepth=10){
	wDiamiter = 50;
	difference(){
		cube([iWidth, iDepth, iHeigth],center=true);
		rotate([90,0,0])
			translate([0,(iHeigth/2),0])
			cylinder(d=wDiamiter, h=iDepth+1, center=true);
	}
}