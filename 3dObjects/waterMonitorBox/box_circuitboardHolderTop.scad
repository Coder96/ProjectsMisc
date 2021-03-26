//include <box_circuitboardHolderBot.scad>;

$fn = 30;

wallHeigth = 15;
boardHeight =  5;

boardDepth = 52;
boardWidth = 70;

depth = boardDepth + 4;
width = boardWidth + 4;

//%translate([0,0,0])  cube(size=[width+2,depth+2,1.5], center=true); // bottom plate
//%cube([width,depth,wallHeigth], center=true); // Outside wall

//box1();
difference(){
	difference(){
		box5();
		cube([width,depth,wallHeigth], center=true); //  cutout for matching bottom
	}
	color("blue") translate([0,0,-11]) cube(size=[width+16,depth+10,20], center=true); // make bottom flat
}

module box5(){
	difference(){
		scale([1.1,1.1,1.1]) box1();
		box1();
	}
}

module box1(){

	union(){

		minkowski() {
			translate([0,0,wallHeigth-2])
				cube(size=[width,depth/2,wallHeigth+12], center=true); // between low spot
			sphere(1);
		}	
	}
		translate([0,(depth/2)-7,wallHeigth+7])
			//color("red")
			rotate([0,0,180])
			roundover(width+4, depth, wallHeigth);
		translate([0,-(depth/2)+7,wallHeigth+7])
			//color("green")
			roundover(width+4, depth, wallHeigth);
}

module roundover(inWidth, inDepth, inHeight){
	radius = 7.167;
	radius2 = 3.5;

	hull(){
		minkowski() { //small 		
			translate([0,(inDepth/3)-8.3,(radius/2)+.1]) 
				rotate([0,90,0]) 
					cylinder(h = inWidth-2, r = radius2-1, center = true);
			sphere(1);
		}		
		minkowski() { // big
			rotate([0,90,0])
				cylinder(h = inWidth-2, r = radius-1, center = true);
			sphere(1);
		}
		translate([0,0, -inHeight-12])
		minkowski() { //small
			translate([0,(inDepth/3)-8.3,(radius/2)+.1]) 
				rotate([0,90,0]) 
					cylinder(h = inWidth-2, r = radius2-1, center = true);
			sphere(1);
		}
		translate([0,0, -inHeight-12])
		minkowski() { // big
			rotate([0,90,0])
				cylinder(h = inWidth-2, r = radius-1, center = true);
			sphere(1);
		}
	}
}