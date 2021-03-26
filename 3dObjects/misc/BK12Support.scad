$fn = 30;

//translate([0,0,25]) Vrail(20,20);
//translate([0,0,-25]) Vrail(20,20);

//FixedMount("S");
//FixedMount("B");
//FixedMountSpacer("S");
//FixedMountSpacer("B");
//FloatedMount("S");
//FloatedMount("B");
FloatedMountSpacer("S");
//FloatedMountSpacer("B");


module FixedMount(iType){
	mountWidth = 70;

	plateHeigth = 70;
	plateDepth = 6;

	spacerHeigth = 30;

	screwCount = 2;

	if(iType == "S"){
		MountSpacer(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
	} else {
		MountPlate(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
	}
}

module FixedMountSpacer(iType){
	mountWidth = 34;

	plateHeigth = 70;
	plateDepth = 6;

	spacerHeigth = 30;

	screwCount = 2;

	if(iType == "S"){
		difference(){
			MountSpacer(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
			screw6mm();
		}
	} else {
		difference(){
			MountPlate(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
			screw6mm();
		}
	}

}

module FloatedMount(iType){
	mountWidth = 70;

	plateHeigth = 60;
	plateDepth = 6;

	spacerHeigth = 20;

	screwCount = 1;
	if(iType == "S"){
		MountSpacer(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
	} else {
		MountPlate(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
	}
}

module FloatedMountSpacer(iType){
	mountWidth = 34;

	plateHeigth = 60;
	plateDepth = 6;

	spacerHeigth = 20;

	screwCount = 2;

	if(iType == "S"){
		difference(){
			MountSpacer(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
			screw6mm();
		}
	} else {
		difference(){
			MountPlate(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
			screw6mm();
		}
	}

}


module MountPlate(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount){
	difference(){
		translate([13.05,0,0]) plate(plateDepth,mountWidth,plateHeigth);
		allHoles(spacerHeigth,screwCount);
		sideCuts(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
	}
}

//module FloatedMountBack(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount){
//	difference(){
//		translate([13.05,0,0]) plate(plateDepth,mountWidth,plateHeigth);
//		allHoles(spacerHeigth,screwCount);
//	}
//}

module MountSpacer(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount){
	difference(){
		union(){
			translate([13.05,0,0]) plate(plateDepth,mountWidth,plateHeigth); // Back Plate
			translate([2,0,0]) color("Blue") plate(25,mountWidth,spacerHeigth+2.2); // Spacer
			//translate([2,0,0]) color("Blue",.5) cube([24,mountWidth,spacerHeigth],center=true); // Center Spacer
		}
		allHoles(spacerHeigth,screwCount);
		sideCuts(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount);
//		translate([0, (mountWidth/2), 0]) rotate([0,90,0]) color("Green") cylinder(d=6,h=99,center=true);
//		translate([0, -(mountWidth/2), 0]) rotate([0,90,0]) color("Green") cylinder(d=6,h=99,center=true);

	}
}

module sideCuts(plateDepth,mountWidth,plateHeigth,spacerHeigth,screwCount){
	translate([0, (mountWidth/2)+2, 0]) rotate([0,90,0]) color("Green") cylinder(d=6,h=99,center=true);
	translate([0, -(mountWidth/2)-2, 0]) rotate([0,90,0]) color("Green") cylinder(d=6,h=99,center=true);
}
module allHoles(spacerHeigth,screwCount){
	if(screwCount==1){
		patteren6mmHoles2(46,13);
	} else {
		patteren6mmHoles4(46,13);
	}
	translate([0,0,(spacerHeigth/2)+10]) patteren5mmHoles();
	translate([0,0,-(spacerHeigth/2)-10]) patteren5mmHoles();
}

module plate(depth, width, heigth){
	hull(){
		translate([0,(width/2)-3, (heigth/2)-4]) rotate([0,90,0]) cylinder(d=6,h=depth,center=true);
		translate([0,(width/2)-3, -(heigth/2)+4]) rotate([0,90,0]) cylinder(d=6,h=depth,center=true);
		translate([0,-(width/2)+3, (heigth/2)-4]) rotate([0,90,0]) cylinder(d=6,h=depth,center=true);
		translate([0,-(width/2)+3, -(heigth/2)+4]) rotate([0,90,0]) cylinder(d=6,h=depth,center=true);
	}
}

module patteren5mmHoles(){
	screw5mm();
	translate([0,20,0]) screw5mm();
	translate([0,-20,0]) screw5mm();
}

module patteren6mmHoles4(width, heigth){
	translate([0,width/2,heigth/2]) screw6mm();
	translate([0,width/2,-heigth/2]) screw6mm();
	translate([0,-width/2,heigth/2]) screw6mm();
	translate([0,-width/2,-heigth/2]) screw6mm();
}
module patteren6mmHoles2(width, heigth){
	translate([0,width/2,0]) screw6mm();
	translate([0,-width/2,0]) screw6mm();
}
module Vrail(x,z){
	color("DarkGrey",.5) cube([x+.1,100,z+.1],center=true); // 20mm rail
	color("DarkGrey",.5) cube([x+13,101,1],center=true); // 20mm rail
}

module screw6mm(){
	color("Red") rotate([0,90,0]) cylinder(d=6.3,h=100,center=true);
}

module screw5mm(){
	color("Green") rotate([0,90,0]) cylinder(d=5.3,h=100,center=true);
}
