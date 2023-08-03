$fn=30;

use<../../scadLib/library.scad>;

hookX = 40;
hookY = 80;
hookZ = 7;
hookD = 10;

sh = 4.3;

difference(){
	rotate([0,0,90])
		plate2Point(hookY,hookZ,hookX);

	rotate([0,0,90]) translate([0,0,0]) 
		plate2Point(hookY-hookZ*2,hookZ+1,hookX-hookZ*2);
	rotate([0,0,90]) translate([10,0,0]) 
		plate2Point(hookY-hookZ*2,hookZ+1,hookX-hookZ*2);
	
	translate([10,hookX,0])
		cube([hookX+1,hookY,hookZ+1],center=true);

	translate([(hookX/2)-((hookZ+1)/2),hookY/2,0])
		cube([hookZ+1,hookY,hookZ+1],center=true);

	translate([-(hookX/2)+((hookZ+1)/2),hookY-20,0])
		cube([hookZ+1,hookY,hookZ+1],center=true);

	translate([-(hookX/2)+((hookZ+1)/2)+2,hookY-20,0])
		cube([hookZ+1,hookY,hookZ+1],center=true);
	
	translate([-(hookX/2)+hookZ/2,10,0]) rotate([0,90,0])
		cylinder(h=hookZ+1, d=sh, center=true);
}
translate([hookX/4,0,0])
	cube([hookX/2,hookZ,hookZ],center=true);
