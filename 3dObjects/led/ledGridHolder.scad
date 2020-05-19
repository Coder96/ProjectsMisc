$fn=30;

gridX = 1;
gridY = 1;
gridSpacingOC = 7;
gridZ = 4;

ledSize = 3;

boardExtraX = 0;
boardExtraY = 0;

ledCutoutConeHeigth = 5;
ledCutoutConeTop = 10;
ledCutoutShaftHeigth = 20;


difference(){
	translate([0,0,5])
		cube([
			(gridSpacingOC*gridX) + boardExtraX,
			(gridSpacingOC*gridY) + boardExtraY,
			gridZ],
			center=true);
		ledGridCutOut(ledSize);
	}
module ledGridCutOut(iLedSize){
	xMove = (gridSpacingOC * gridX/2)+(gridSpacingOC/2);
	yMove = (gridSpacingOC * gridY/2)+(gridSpacingOC/2);
	translate([-xMove, -yMove, 0])
		for (y = [1:gridY]) {
			for (x = [1:gridX]) {
				translate ([x*gridSpacingOC, y * gridSpacingOC, 0])
				ledCutout(iLedSize);
				}
			}
}
module ledCutout(iLedSize){
	color("green")cylinder(h=ledCutoutShaftHeigth, d=iLedSize, center=true);

	translate([0,0,(ledCutoutShaftHeigth/2)-(ledCutoutConeHeigth/2)])
		cylinder(h=ledCutoutConeHeigth,d1=iLedSize,d2=ledCutoutConeTop ,center=true);
}