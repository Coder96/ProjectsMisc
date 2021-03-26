$fn = 30;

TruckWidth = 60;
TruckDepth = 30;

TruckHeight = 4;

TruckTopHeight = 24;

EdgeRadius = 3;

M3ShaftDiameter = 3.3;
M3HeadDiameter = 5.7;
M3ThreadInsertDiameter = 4.9;
M3ThreadInsertOutsideDiameter = 4.2;

//truckTop();
translate([0,0,-13.5]) truckBottom();


module truckTop(){
	difference(){
		minkowski() {
			translate([0,0,2]) cube([TruckWidth,TruckDepth,TruckTopHeight],center=true); // Truck Top
			sphere(EdgeRadius);
		}
		color("DarkGrey",.5) cube([20.1,60,20.1],center=true); // V Rail Spacer
		translate([15,0,-15]) threadInsertHoles();
		mirror([180,0,0]) translate([15,0,-15]) threadInsertHoles();
		translate([0,0,-13.5]) cube([TruckWidth+EdgeRadius*3,TruckDepth+EdgeRadius*3,TruckHeight+EdgeRadius],center=true);
	}
}

module threadInsertHoles(){
	translate([0,0,0]) threadInsertHole();
	translate([8,8,0]) threadInsertHole();
	mirror([0,180,0]) translate([8,8,0]) threadInsertHole();
}
module threadInsertHole(){
	color("Aqua") cylinder(M3ThreadInsertOutsideDiameter,d=M3ThreadInsertDiameter,center=true); // theaded insert hole
	color("Aqua") cylinder(70,d=M3ShaftDiameter,center=true); // shaft
}


module truckBottom(){
	difference(){
		minkowski() {
			translate([0,0,1]) cube([TruckWidth,TruckDepth,TruckHeight],center=true);
			sphere(EdgeRadius);
		}
		truckScrewHoles(20,20,4.5);
		translate([15,0,-2]) threadInsertHoles();
		mirror([180,0,0]) translate([15,0,-2]) threadInsertHoles();
		translate([0,0,16]) cube([TruckWidth+EdgeRadius*3,TruckDepth+EdgeRadius*3,25],center=true); // Truck Top
	}
	minkowski() {
		translate([0,16.54,-6]) cube([TruckWidth,2,14],center=true);
		sphere(EdgeRadius-1);
	}
//difference(){
	minkowski() {
		mirror([0,180,0]) translate([0,16.54,-6]) cube([TruckWidth,2,14],center=true); // side rail
		sphere(EdgeRadius-1);
	}
//	translate([0,0,-9]) color("DarkGrey",.5) cube([44,27.1,10],center=true); // Truck Spacer
//}
}
module truckScrewHoles(x, y, z){
	translate([x/2,y/2,z]) truckPanHeadScrewHole();
	translate([x/2,-y/2,z]) truckPanHeadScrewHole();
	translate([-x/2,-y/2,z]) truckPanHeadScrewHole();
	translate([-x/2,y/2,z]) truckPanHeadScrewHole();
}
module truckPanHeadScrewHole(){
	cylinder(20,d=M3ShaftDiameter,center=true); // shaft
	cylinder(8,d=M3HeadDiameter,center=true); // head
}