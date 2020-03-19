$fn=30;

use <../library.scad>;

tinyUpsBoardWidth = 26;
tinyUpsBoardLength = 33;
tinyUpsBoardDepth = 1.66;
tinyUpsBoardCornerRadious = 3;
tinyUpsBoardCornerOffset = 1.5;
tinyUpsBoardMountHoleDiamiter = 2.85;
tinyUpsBoardMountHoleWidthOC = 22.83;
tinyUpsBoardMountHoleLengthOC = 29.78;

M2SizeT = 2.0;
M2SizeS = 2.4;

M3SizeT = 3.2;
M3SizeS = 3.5;

M4SizeT = 4.2;
M4SizeS = 4.4;


//translate([0,0,4]) tinyUpsBoard();

tinyUpsTray();

////////////////////////////////////////////////////////////////////////////////////////////////////
module tinyUpsTray(){
	difference(){
		plate4Point(tinyUpsBoardWidth+4,tinyUpsBoardLength+4,4,4);
		translate([0,0,.51]) plate4Point(tinyUpsBoardWidth,tinyUpsBoardLength,3,tinyUpsBoardMountHoleDiamiter);
		plate4Point(tinyUpsBoardWidth-4,tinyUpsBoardLength-4,6,8);
	}
	difference(){
		tinyUpsHolePoints(4,4);
		tinyUpsHolePoints(M2SizeT);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tinyUpsBoard(){
	difference(){
		plate4Point(tinyUpsBoardWidth,tinyUpsBoardLength,tinyUpsBoardDepth,tinyUpsBoardMountHoleDiamiter);
		tinyUpsHolePoints(tinyUpsBoardMountHoleDiamiter);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tinyUpsHolePoints(iDiamiter,iHeigth=10){
	
	for(a=[[1,1],[1,-1],[-1,1],[-1,-1]]){
		translate([
			a[0]*(tinyUpsBoardWidth/2)-(a[0]*tinyUpsBoardCornerOffset),
			a[1]*(tinyUpsBoardLength/2)-(a[1]*tinyUpsBoardCornerOffset),
			0]) 
			cylinder(h=iHeigth,d=iDiamiter,center=true);
	}
}
