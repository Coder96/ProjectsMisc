$fn=90;

difference(){
 union(){
  rotate([0,180,0])
   import("../files/Rückwand.stl"); // Top
  rotate([0,180,0])
  difference(){
   translate([0,0,2])
   import("../files/Rückwand.stl"); // Bot
	translate([-20,-76,0])
	 cube([20,10,13],center=true);
	}
 }
 trenchZ = -1.5;
 rotate([90,0,0])					// Center
 translate([18.2,trenchZ,35])
  trench(82, 2.8);

 rotate([90,0,0])					// Cevron Top
 translate([02,trenchZ,-15])
  rotate([0,50,0])
  trench(58, 5);

 rotate([90,0,0])					// Cevron Bot
 translate([02,trenchZ,15])
  rotate([0,-50,0])
  trench(58, 5);

 rotate([90,0,0])					// Currser
 translate([45,trenchZ,30.7])
  rotate([0,90,0])
  trench(48, 5);
}

module trench(iLength, iWidth){
 hull(){
	 cylinder(h=iLength,d=2,center=true); // bot R
	 translate([iWidth,0,0])rotate([0,0,35])
		cylinder(h=iLength,d=2,center=true); // Bot L
	 translate([0,05,0])
	 cylinder(h=iLength,d=2,center=true); // Top R
	 translate([iWidth,05,0])
		cylinder(h=iLength,d=2,center=true); // Top L
	}
}