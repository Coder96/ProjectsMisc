


//ForPrint();
ForDisplay();

module ForDisplay(){
	//#cube([124,200,48],center=true); // Space for drawer
	
	FrontPlate();
	translate([0,0,5.5]) Box();
	//rotate([0,0,90]) translate([82,33,-13]) Rail();
}

module ForPrint(){
	translate([0,-70,0]) FrontPlate();
	translate([82,33,-13]) Rail();
	mirror([180,0,0]) translate([82,33,-13]) Rail();
	translate([0,40,0]) translate([0,103,-10])  BackRail();	
}

module FrontPlate(){
		translate([5.5,-98,5]) cube([135,6,60],center=true); //Front plate
	
}
module Box(){
	difference(){
		cube([124,200,48],center=true);
		translate([0,0,2]) cube([122,198,48],center=true);
	}
}

module BackRail(){

	cube([157,10,5], center=true);
	rotate([0,-90,90]) translate([3,-58.5,0]) GlueSpot();
	mirror([180,0,0]) rotate([0,-90,90]) translate([3,-58.5,0]) GlueSpot();

}

module Rail(){
//	#translate([0,0,-5]) cube([55,55,55]);
	cube([5,150,10],center=true); //Virtical
	translate([-2.5,0,-3]) cube([10,150,5],center=true); //Horizontal
	
	translate([0,-40,25]) rotate([45,0,0]) CompressFit();
	translate([0,-15,25]) rotate([45,0,0]) CompressFit();
	translate([0,15,25]) rotate([45,0,0]) CompressFit();
	translate([0,45,25]) rotate([45,0,0]) CompressFit();
	
	translate([3,-55,-2.5]) GlueSpot();
	
//Stop Block
 
	difference(){
		union(){
			translate([-5,25,10]) cube([4,10,30],center=true); //Virtical
			rotate([90,0,0]) translate([-5,29.5,-18]) cube([4,6,9],center=true);  // Horizontal 
			translate([-5,22.5,25]) rotate([0,90,0]) cylinder(h=4,d=15,center=true); //Outside
			translate([-5,13.5,29.5]) rotate([0,90,0]) cylinder(h=4,d=6,center=true); //End
		}
	translate([-5,10,12]) cube([6,20,29],center=true); // Cut Out
	}
	scale([.8,.48,.80]) translate([-3.25,61.5,0])  GlueSpot();

	//
	
	translate([-10,65,-3]) cube([20,20,5],center=true); //Back Block
	
	difference(){
		translate([0,55,-3]) cylinder(h=5,r=20,center=true);
		translate([10,55,-3]) cube([20,40,7],center=true);
	}
}

module  CompressFit(){
	cube([5,2,70],center=true);
	translate([0,0,33]) rotate([0,90,0]) cylinder(h=5,d=5,center=true);
}

module GlueSpot(){
rotate([0,90,0])	
	translate([3,0,0])
		 difference(){
			union(){
				translate([0,0,-3]) cylinder(h=5,r=20,center=true);
				translate([-10,-10,-3]) cube([20,20,5],center=true);
			}
			translate([10,0,-3]) cube([20,40,7],center=true);
		}
}