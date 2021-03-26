$fn = 30;

//	in		mm
//	.25		6.35
//	.62		16 mm
//	.47		12 mm
//

rBitSize = 12;			// Size of bit Cut mm
rBitCollorSize = 16;		// Size of outer collor size mm

wOffsetForCollor = rBitCollorSize - rBitSize;
wCornerRadious = rBitCollorSize/2;

iecDepth = 61;
iecWidth = 29;
iecMiddleWidth = 51;

doorHangerCutout();

// door width 35mm

% translate([0, 0, -21]) cube([35, 200, 40], center=true); // Door Blank

//projection(cut=false) 
//	outterCutout();

//innerCutout();

//translate([0,0,-5.05]) plate4Point(150,150,.4,70); // for extra hold to the bed.

module doorHangerCutout(){
	
	doorWidth = 35;
	
	difference(){
		backPlate();
		outterShell(27, 27, 89, 10);
	}
	 translate([doorWidth/2 + 3, 0, -28]) rotate([0, 90, 0]) plate4Point(60,135,5,4);
	 mirror([90, 0, 0])
		translate([doorWidth/2 + 3, 0, -28]) rotate([0, 90, 0]) plate4Point(60,135,5,4);
}


module sightLine(w){

	rotate([180,0,0]){
		hull(){
			translate([0,w/2,0]) cylinder(h=15, r1=10, r2=0, center=true);
			translate([0,-w/2,0]) cylinder(h=15, r1=10, r2=0, center=true);
		}
	}
}

module outterCutout(){
	difference(){
		backPlate();
		outterShell(iecWidth, iecMiddleWidth, iecDepth, 10);
	}
}

module innerCutout(){
	difference(){
		union(){
			backPlate();
			translate([0,0,.8]) outterShell(iecWidth - wOffsetForCollor, iecMiddleWidth - wOffsetForCollor, iecDepth - wOffsetForCollor, 5);
//			translate([0,0,1]) outterShell(iecWidth, iecMiddleWidth, iecDepth, 5);
		}
		innerShell(20);
	}
}

module backPlate(){
//	difference(){
		plate4Point(120,135,5,4);
//		translate([0,50,4.5]) sightLine(20);
//		translate([0,-50,4.5]) sightLine(20);
//		translate([42,0,4.5]) rotate([0,0,90]) sightLine(20);
//		translate([-42,0,4.5]) rotate([0,0,90]) sightLine(20);
//	}
}

module outterShell(wt, wm, h, depth){

	cSidesX = 	wt	+ wOffsetForCollor; // 29
	cMiddleX = 	wm	+ wOffsetForCollor; // 51
	cSideY = 		h		+ wOffsetForCollor; // 61
	
	hull(){
		plate4Point(cSidesX, cSideY, depth, wCornerRadious);
		plate2Point(cMiddleX, depth, wCornerRadious);
	}
}

module innerShell(depth){

	cSidesX = 27	+ wOffsetForCollor;
	cSideY = 47		+ wOffsetForCollor;
	
	plate4Point(cSidesX,cSideY, depth, wCornerRadious);
}

module plate2Point(x,z,d){
	hull(){
		color("green") translate([(x/2) -(d/2), 0, 0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([-(x/2)+(d/2), 0, 0]) cylinder(h=z, d=d, center=true);
	}
}

module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}