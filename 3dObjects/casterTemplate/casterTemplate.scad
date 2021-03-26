$fn = 30;


//edge();
//corner();
//botplate();

edge2();
//corner2();
botplate2();

module edge2(){
	translate([0,-15.5,9]) plate(40, 9, 10);
}

module corner2(){
	difference(){
		union(){
			translate([-15.5,0,9]) plate(9, 40, 10);
			translate([0,-15.5,9]) plate(40, 9, 10);
		}
		translate([-6,-6,10]) cylinder(h = 20,d = 10,center=true);
	}
}

module botplate2(){
	difference(){
		color("RED") plate(40, 40, 10 );
		translate([15,15,0]) cylinder(h = 20,d = 6,center=true);
	}
}

module botplate(){
	difference(){
		color("RED") plate(80, 80, 10 );
		translate([20,20,0]) boltHolePattern();
	}
}

module edge(){
	translate([0,-35.5,9]) plate(80, 9, 10);
}

module corner(){
	difference(){
		union(){
			translate([-35.5,0,9]) plate(9, 80, 10);
			translate([0,-35.5,9]) plate(80, 9, 10);
		}
		translate([-26,-26,10]) cylinder(h = 20,d = 10,center=true);
	}
}
//translate([-27,-27,0]) cylinder(h = 20,d = 4,center=true);

module boltHolePattern(){

	$width = 27;
	$holeSize = 6;
	$height = 20;

	translate([ ($width/2), ($width/2),0]) cylinder(h = $height,d = $holeSize,center=true);
	translate([ ($width/2),-($width/2),0]) cylinder(h = $height,d = $holeSize,center=true);
	translate([(-$width/2), ($width/2),0]) cylinder(h = $height,d = $holeSize,center=true);
	translate([-($width/2),-($width/2),0]) cylinder(h = $height,d = $holeSize,center=true);

}

module plate($width,$depth, $height){

	$size = 6;
	hull(){
		translate([ ($width/2), ($depth/2),0]) cylinder(h = $height,d = $size,center=true);
		translate([ ($width/2),-($depth/2),0]) cylinder(h = $height,d = $size,center=true);
		translate([(-$width/2), ($depth/2),0]) cylinder(h = $height,d = $size,center=true);
		translate([-($width/2),-($depth/2),0]) cylinder(h = $height,d = $size,center=true);
	}

}