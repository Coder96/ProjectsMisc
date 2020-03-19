
wD1Width = 26.5;
wD1Depth = 35;

//			translate([-15,-19.5,0])				rotate([0,0,0])#			import("../../Downloads/Wemos_D1_Mini_case-open.stl");

translate([0,0,5]) wemosD1Frame();

module wemosD1Frame(){
	
	difference(){
		translate([0,0,0]) color("orange") cube([wD1Width+5,wD1Depth+4,9],center=true);

		translate([0,(wD1Depth/2),2.5]) color("Fuchsia") cube([18,10,11],center=true);

		translate([0,0,2.5]) color("blue") cube([wD1Width,wD1Depth,6],center=true);

//		translate([0,3,-3]) color("green") cube([wD1Width,25,6],center=true);
		translate([0,0.5,-3]) color("green") cube([wD1Width,25,6],center=true);
		
		translate([0,-12.5,2]) color("yellow") cube([wD1Width,10,10],center=true);

		translate([0,3.5,2]) color("Gold") cube([wD1Width+6,19,10],center=true);

		translate([-14,-13.5,2]) color("Aqua") cube([11,4,10],center=true);
		translate([-14,-16.5,2]) color("Aquamarine") cube([11,4,10],center=true);
		
		translate([0,-(wD1Depth/2)-5,0]) color("Lime") cube([wD1Width+6,10,12],center=true);
	}
}
