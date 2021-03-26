//
// Hole spacing for mounting holes on the openBuilds cable chain. SKU:2450
//
// 
//
$fn=30;
dragChainHoles2450();

module dragChainHoles2450(heigthPins=10, diamiterPins=2.8){
	
	wSpacing = 10.2;
	dSpacing = 8.7;

	color("green") translate([-(wSpacing/2),0,-1]) cylinder(h=heigthPins,d=diamiterPins,center=true);
	color("green") translate([ (wSpacing/2),0,-1]) cylinder(h=heigthPins,d=diamiterPins,center=true);
	color("green") translate([-0,-dSpacing,-1]) cylinder(h=heigthPins,d=diamiterPins,center=true);

//	For testing
//	heightPlate = 2;
//	translate([0, -dSpacing/2, -(heigthPins/2)]) plate4Point(wSpacing + diamiterPins, dSpacing + diamiterPins, heightPlate, 2);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
