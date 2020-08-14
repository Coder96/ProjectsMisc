$fn=60;

baseWidth = 50;
baseDepth = 50;
baseHeigth = 56;

baseWallThickness = 5;

baseCameraMountHoleDiamier = 7.5;

backMountingHoles = "Yes"; // ["Yes", "No"]
cableThroughHole = "Yes"; // ["Yes", "No"]

difference(){
	baseBody();
	cutWedge();
	translate([0,0,baseWallThickness])
	resize([baseDepth+baseWallThickness*4, baseWidth-baseWallThickness, baseHeigth ]) baseBody();
	cylinder(h=baseHeigth+2, d=baseCameraMountHoleDiamier,center=true);
	if(backMountingHoles == "Yes"){
		backMountHoles();
	}
	if(cableThroughHole == "Yes"){
		cableThroughHole();
	}
	// Cut bottom off
	translate([-(baseDepth/2)-20, 0, baseHeigth/2])
		cube([15, baseWidth+2, baseWallThickness], center=true);
}



module baseBody(){
	hull() {
		cylinder(h=baseHeigth, d=baseWidth,center=true);
		baseBack();
	}
}
module baseBack(){
	hull(){
		for (a =[[1,1],[-1,1],[-1,-1],[1,-1]]){
			translate([
				-baseDepth, 
				((baseWidth/2)-(baseWallThickness/2))*a[0],
				((baseHeigth/2)-(baseWallThickness/2))*a[1]
				])
				sphere(d=baseWallThickness);
		}
	}	
}
module cutWedge(){
	hull(){
		// Back Bottom
		translate([(-baseWidth)-baseWallThickness, 0, baseWidth+baseWallThickness+baseWallThickness-24])
#			cube([baseWallThickness, baseWidth+10, baseWallThickness],center=true);
		// Front Top
		translate([baseWidth+(baseWidth/2)-baseWallThickness, 0, -baseWallThickness-40])
	#		cube([baseWallThickness, baseWidth+10, baseWallThickness],center=true);
		// Front Bottom
		translate([baseWidth+(baseWidth/2)-baseWallThickness, 0, baseWidth+baseWallThickness+baseWallThickness+1])
			cube([baseWallThickness, baseWidth+10, baseWallThickness],center=true);
	}	
}
module backMountHoles(){
	for(a=[10,-10]){
		translate([-1, a, -9]) 
			rotate([0, 90, 0]) 
			color("green") 
			cylinder(h=baseDepth*4, d=5.4, center=true);
	}
}
module cableThroughHole(){
	translate([-baseDepth+baseWallThickness, 0, -baseHeigth/2])
		union(){
			cube([5, 10 ,20], center=true);
			translate([11,0,5])
			difference(){
				translate([-5, 0, -5])
					cube([10, 10 ,10], center=true);
				rotate([90, 0, 0])
					resize([20, 10 ,10])
					cylinder(h=14, d=10,center=true);
			}
		}
}