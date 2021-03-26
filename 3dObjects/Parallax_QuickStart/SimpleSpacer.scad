$fn = 30;

/* 
This is for the Parallax QickStart Dev Board

Borad size

Width		76mm
Depth	52mm

Holes are 3mm wide

Holes on center

Width		70mm
Depth	44.5 mm


*/

boardWidth = 77;
boardDepth = 51.5;

holeSpaceWidth = 70;
holeSpaceDepth = 44.5;

borderWidth = 3;

spacerHeigth = 2;
screwHoleSize = 4;


//%cube([76, 52, 2], center=true); // Board 

difference(){
	plate4Point(boardWidth, boardDepth, spacerHeigth, screwHoleSize+borderWidth);
	plate4Point(boardWidth - borderWidth, boardDepth-borderWidth, spacerHeigth+1, screwHoleSize);
}

screwHoles();

module screwHoles(){

	translate([(boardWidth/2)-borderWidth-.5, (boardDepth/2)-borderWidth-.5, 0]) screwBorder(spacerHeigth); // Top Left
	translate([-(boardWidth/2)+borderWidth+.5, (boardDepth/2)-borderWidth-.5, 0]) screwBorder(spacerHeigth); // Top Right
	translate([(boardWidth/2)-borderWidth-.5, -(boardDepth/2)+borderWidth+.5, 0]) screwBorder(spacerHeigth); // Botton Left
	translate([-(boardWidth/2)+borderWidth+.5, -(boardDepth/2)+borderWidth+.5, 0]) screwBorder(spacerHeigth); // Bottom Right

}

module screwBorder(h){

	difference(){
		cylinder(h = h, d = borderWidth+screwHoleSize, center = true);
		cylinder(h = h + 1, d = screwHoleSize, center = true);
	}

}

module plate2Point(x,z,d){
	hull(){
		color("green") translate([(x/2) -(d/2), 0, 0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([-(x/2)+(d/2), 0, 0]) cylinder(h=z, d=d, center=true);
	}
}

module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}