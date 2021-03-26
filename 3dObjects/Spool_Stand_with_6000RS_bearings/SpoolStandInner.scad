//$fn=30;

seperation = 50; 
size = 38;
heigth = 2;

//#translate([100,-100,-10]) import("/home/jklein/objects/Spool_Stand_with_6000RS_bearings/Spool_Stand_Inner.stl");

difference(){
	outsideStand();
	shaftCutout();
}

module shaftCutout(){
	size = 8.7;
	heigth = 10;
	translate([0,seperation,0])
		cylinder(h=heigth,d=size,center=true);  
	mirror([0,seperation,0])	
		translate([0,seperation,0])
			cylinder(h=heigth,d=size,center=true);
}

module insideStand(){
	minkowski() {
		union(){
			base();
			insideBars();
			difference(){
				union(){
					translate([0,seperation/3,0]) crossBars();
					translate([0,-seperation/3,0]) crossBars();
				}
				translate([-((size+heigth)/1.7),0,0])
					cube([size,seperation*2,heigth+2],center=true);
			}
		}
		sphere(1);
	}	
}
	
module outsideStand(){
	minkowski() {
		union(){
			base();
			outsideBars();
			translate([0,seperation/3,0]) crossBars();
			translate([0,-seperation/3,0]) crossBars();
		}
		sphere(1);
	}	
}	
	
module crossBars(){
	rotate([0,0,45])
		cube([heigth,seperation,heigth],center=true);
	rotate([0,0,-45])
		cube([heigth,seperation,heigth],center=true);
}

module outsideBars(){
	translate([-((size-heigth)/2),0,0])
		cube([heigth,seperation*2,heigth],center=true);

}

module insideBars(){
	translate([-((size-heigth)/8),0,0])
		cube([heigth,seperation*2,heigth],center=true);

}

module base(){
	translate([0,seperation,0])
		cylinder(h=heigth,d=size,center=true);  
	mirror([0,seperation,0])	
		translate([0,seperation,0])
			cylinder(h=heigth,d=size,center=true);
	translate([((size-heigth)/2),0,0])
		cube([heigth,seperation*2,heigth],center=true);

}