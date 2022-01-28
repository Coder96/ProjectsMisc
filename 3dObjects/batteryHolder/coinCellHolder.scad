//%translate([12.5,-35,0])
//	rotate([0,0,90])
	
	
// % import("C:\\misc\\scad\\BatHolder2032_1-0.stl");

/* [General] */

//
BatteryTypes = "CR2032"; //[CR2032, test]

// 
NumberOfBatteries = 1; //[1:5]

/* [Hidden] */

batteryWidth = 20;
batteryHeigth = 1.5;
$fn=40;	
	
baseHeigth = 40;


// Return the current value if not found.

batteryWidth = BatteryTypes == "CR2032" ? 20 : batteryWidth ;
//batteryWidth = BatteryTypes == "CR2032" ? 20 : batteryWidth ;
//batteryWidth = BatteryTypes == "CR2032" ? 20 : batteryWidth ;


batteryHeigth = BatteryTypes == "CR2032" ? 1.5 : batteryHeigth ;
//batteryHeigth = BatteryTypes == "CR2032" ? 1.5 : batteryHeigth ;
//batteryHeigth = BatteryTypes == "CR2032" ? 1.5 : batteryHeigth ;

spaceForbatteries = batteryHeigth * NumberOfBatteries;

difference(){
	difference(){
		union(){
			translate([0,0,(baseHeigth/2)]) cylinder(d=batteryWidth + 2, h=baseHeigth, center=true); // Outer cylinder
			translate([0,-11,(baseHeigth/2)]) cube([10,6,baseHeigth],center=true); // back support
		}
		union(){
			translate([0,0,(baseHeigth/2)+1.5]) cylinder(d=batteryWidth + .5, h=baseHeigth, center=true); // inner cylinder cutout	

			translate([0,9,(baseHeigth/2)+1.5]) cube([15,7,baseHeigth],center=true); // Front cutout	

			translate([2.6,-12.3,(baseHeigth/2)]) cylinder(d=2, h=baseHeigth+2,center=true); // Back support wire cutout
				translate([-2.6,-12.3,(baseHeigth/2)]) cylinder(d=2, h=baseHeigth+2,center=true); // Back support wire cutout
	
			translate([5,0]) cylinder(d=2, h=5,center=true); // Bottom virtical cutout
			translate([-5,0]) cylinder(d=2, h=5,center=true); // Bottom virtical cutout
			translate([0,0,1.5]) rotate([0,90,0]) cylinder(d=2, h=10,center=true); // Bottom horizontal cutout
		}
	}
	translate([0,0,((baseHeigth/2)+2.5) + spaceForbatteries]) cube([30,30,40], center=true); // Move up to fit more batteries
}




