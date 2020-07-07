baseX = 10;
baseY = 10;
baseZ = 4;

//translate([-10,0,2]) rotate([0,-90,0]) import("led_rgb.stl");

cube([baseX,baseY,baseZ],center=true);

grill();
mirror([0,0,90]) grill();

module grill(){

tz = (baseZ/2);

color("red") translate([0,-1.1,tz]) cube([baseX,.5,2],center=true);
color("green") translate([0,0,tz]) cube([baseX,.5,2],center=true);
color("blue") translate([0,1.1,tz]) cube([baseX,.5,2],center=true);

tWid = 3.1;

color("black") translate([0,(baseY/2)-(tWid/2),tz]) cube([baseX,tWid,2],center=true);
mirror([0,90,0]) color("black") translate([0,(baseY/2)-(tWid/2),tz]) cube([baseX,tWid,2],center=true);
	
}