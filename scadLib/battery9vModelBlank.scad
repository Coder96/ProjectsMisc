
$fn=60;

include<battery9vModelBlank_h.scad>;

b9mb_battery9vModelBlank(true);

/////////////////////////////////////////////////////////////
module b9mb_battery9vModelBlank(batteryExernalCenter=false, batteryCenter=false){

	union(){
		translate([0,0,b9mb_battery9vBodyHeigth/2])
		// Body
			color("grey")
			b9mb_plate4Point(
				b9mb_battery9vBodyWidth,
				b9mb_battery9vBodyDepth,
				b9mb_battery9vBodyHeigth,
				3
			);
			
		// Connector
		translate([0,0,
			(b9mb_battery9vBodyHeigth/2)+b9mb_battery9vConnectorsHeigth]
		)
			color("silver")
			b9mb_plate4Point(20,8,b9mb_battery9vBodyHeigth,6);	
		if(batteryExernalCenter==true){
			translate([0,0,b9mb_battery9vTotalHeigth+(b9mb_battery9vExternalConnectorHeigth/2)])
				b9mb_battery9vExternalConnector();
		}
	}
}
/////////////////////////////////////////////////////////////
module b9mb_battery9vExternalConnector(){

    b9mb_plate4Point(24,14,b9mb_battery9vExternalConnectorHeigth,8);	
}
/////////////////////////////////////////////////////////////
module b9mb_plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}