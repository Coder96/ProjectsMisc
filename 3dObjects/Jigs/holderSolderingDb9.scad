use<../../scadLib/library.scad>;

$fn=60;

db9Width  = 18.9 + .1;
db9Depth  = 10;
db9Heigth = 9.4 + .6;

spaceBetweenConnectors = 6;

difference(){
	union(){
		plate4Point(60,15,4,6);
		
		translate([0,0,1.25])
			plate4Point(23,15,spaceBetweenConnectors,6);
		
		translate([22.5,0,3])
			plate4Point(15,15,4,6);
		translate([-22.5,0,3])
			plate4Point(15,15,4,6);
	}
//	for(a=[[-30],[0],[30]]){
//		translate([a[0],0,0])
			cutout();
//	}
}
module cutout(){
	plate4Point(db9Width,db9Heigth,db9Depth,2);

}