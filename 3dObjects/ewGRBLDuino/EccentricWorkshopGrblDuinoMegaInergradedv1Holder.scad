//
// Eccentric Workshop GrblDuino Mega Inergraded v1 Holder
//
// 
//
$fn=30;

boardBlankX = 90;
boardBlankY = 59.2;
boardBlankZ = 1.6;
boardBlankScrewTerminalY = 7.6;
boardBlankScrewTerminalZ = 10.2;
boardBlankScrewTerminalPinRowY = 1.5;
boardBlankScrewTerminalPinRowZ = 2.5;

topPlateX = boardBlankX + 20;
topPlateY = boardBlankY + 4;
topPlateZ = boardBlankZ + 2;

bottomPlateX = topPlateX + 20;
bottomPlateY = topPlateY;
bottomPlateZ = topPlateZ;

holdDownPlateAX = 0;
holdDownPlateAY = 0;
holdDownPlateAZ = 0;

holdDownPlateBX = 0;
holdDownPlateBY = 0;
holdDownPlateBZ = 0;

%boardBlank(); // display



boardMount();

HoldDownPlateA();
HoldDownPlateB();

////////////////////////////////////////////////////////////////////////////////////////////////////
module boardMount(){
	difference(){
		union(){
			plate4Point(topPlateX,topPlateY,topPlateZ,4);					// top plate
			translate([0,0,-2]) bottomPlate();
		}
		plate4Point(boardBlankX-1,boardBlankY-4,boardBlankZ+40,4);	// middle cutout
		translate([0,0,1.2]) boardBlank();													// Board Cutout
		
		translate([(-boardBlankX/2)-8,10.5,2.5]) rotate([90,0,90]) plate4Point(12,8,40,3); // usb cutout
		
		boardCornerHoles(6, 3.4);
		
		HoldDownHolesA();

		HoldDownHolesB();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bottomPlate(){

	width = 10;

	translate([0,(bottomPlateY/2)-(width/2),0]) plate4Point(bottomPlateX,width,bottomPlateZ,4);
	translate([0,-(bottomPlateY/2)+(width/2),0]) plate4Point(bottomPlateX,width,bottomPlateZ,4);
	difference(){
		cube([bottomPlateX-10,bottomPlateY,bottomPlateZ],center=true);
		translate([-(bottomPlateX/2)-17,0,0]) plate4Point(50,bottomPlateY-(width*2),bottomPlateZ+2,4);
		translate([(bottomPlateX/2)+17,0,0]) plate4Point(50,bottomPlateY-(width*2),bottomPlateZ+2,4);
	}
	
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module HoldDownPlateA(){
	difference(){
		translate([-(topPlateX/2)+6,-9,4])
			plate4Point(10,20,3,4);
		HoldDownHolesA();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module HoldDownPlateB(){
	difference(){
		translate([(topPlateX/2)-5.4,0,4])
			plate4Point(11,35,3,4);
		HoldDownHolesB();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module HoldDownHolesA(){

	translate([-(topPlateX/2)+5,-3,0]){
		cylinder(h=20,d=3.4,center=true);
		translate([0,0,-2.6]) hexNut3mm();
	}
	translate([-(topPlateX/2)+5,-15,0]){
		cylinder(h=20,d=3.4,center=true);
		translate([0,0,-2.6]) hexNut3mm();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module HoldDownHolesB(){

	translate([(topPlateX/2)-5,13,0]){
		cylinder(h=20,d=3.4,center=true);
		translate([0,0,-2.6]) hexNut3mm();
	}
	translate([(topPlateX/2)-5,-13,0]){
		cylinder(h=20,d=3.4,center=true);
		translate([0,0,-2.6]) hexNut3mm();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module boardCornerHoles(dHead, dShaft){
	for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([
			a[0]*((bottomPlateX/2)-(6/2)-2.1),
			a[1]*((bottomPlateY/2)-(6/2)-2.1),
			4])
			screwCutOut(dHead, dShaft);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module boardCornerConeMounts(dShaft){
	for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([
			a[0]*((bottomPlateX/2)-(6/2)-2.1),
			a[1]*((bottomPlateY/2)-(6/2)-2.1),
			4])
			difference(){
				cylinder(d1=dShaft+12, d2=dShaft+4, h=10, center=true);
				translate([0,0,2]) screwCutOut(4, 4);
			}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module boardBlank(){

	boardBlankScrewTerminalOffset = 2.32;
	boardBlankScrewTerminalPinOffsetX = 2;

//
// Board
//
	cube([boardBlankX,boardBlankY,boardBlankZ],center=true);
//
// Screw Terminals
//
	for (a = [1, -1]){
	//
	// Top Terminals
	//
	color("green")
		translate ([
			0,
			a*(((boardBlankY/2)-(boardBlankScrewTerminalY/2))-(boardBlankScrewTerminalOffset)),
			(boardBlankScrewTerminalZ/2)+(boardBlankZ/2)
			]) 
			cube([boardBlankX,boardBlankScrewTerminalY,boardBlankScrewTerminalZ],center=true);
	//
	// Bottom Pins
	//
	color("red")
		translate ([
			0,
			a*(((boardBlankY/2)-(boardBlankScrewTerminalY/2))-(boardBlankScrewTerminalOffset)),
			-(boardBlankScrewTerminalPinRowZ/2)-(boardBlankZ/2)
			]) 
			cube([boardBlankX-(boardBlankScrewTerminalPinOffsetX*2),boardBlankScrewTerminalPinRowY,boardBlankScrewTerminalPinRowZ],center=true);
	}
	//
	// usb connector
	//
	usbX = 10;
	usbY = 7.8;
	usbZ = 4.1;
	boardBlankUsbPinOffsetX = 1.35;
	boardBlankUsbPinOffsetY = 15;

	color("orange")
	translate ([
			((usbX/2)-(boardBlankX/2))-boardBlankUsbPinOffsetX,
			(((boardBlankY/2)-(usbY/2))-(boardBlankUsbPinOffsetY)),
			(usbZ/2)+(boardBlankZ/2)
			])
			cube([usbX,usbY,usbZ],center=true);
	//
	// button
	//
	buttonX = 6;
	buttonY = 6;
	buttonZ = 5.1;
	boardBlankbuttonOffsetX = 2.1;
	boardBlankbuttonOffsetY = 29.5;

	color("grey")
	translate ([
			((buttonX/2)-(boardBlankX/2))+boardBlankbuttonOffsetX,
			(((boardBlankY/2)-(buttonY/2))-(boardBlankbuttonOffsetY)),
			(buttonZ/2)+(boardBlankZ/2)
			])
			cube([buttonX,buttonY,buttonZ],center=true);
	//
	// Pin Headers
	//
	pinHeadersX = 7.75;
	pinHeadersY = 3.75;
	pinHeadersZ = 5.1;
	boardBlankPinHeadersXOffsetX = 1.35;
	boardBlankPinHeadersXOffsetY = 42.19;

	color("blue")
	translate ([
			((pinHeadersX/2)-(boardBlankX/2))+boardBlankPinHeadersXOffsetX,
			(((boardBlankY/2)-(pinHeadersY/2))-(boardBlankPinHeadersXOffsetY)),
			(pinHeadersZ/2)+(boardBlankZ/2)
			])
			cube([pinHeadersX,pinHeadersY,pinHeadersZ],center=true);
	//
	// Motor Contoler Header
	//
	mcHeadersX = 14.60;
	mcHeadersY = 20;
	mcHeadersZ = 8.43;
	boardBlankMcHeadersXOffsetX = 1.1;
	boardBlankMcHeadersXOffsetY = 26.66;

	color("blue")
	mirror([90,0,0])
	translate ([
			((mcHeadersX/2)-(boardBlankX/2))+boardBlankMcHeadersXOffsetX,
			(((boardBlankY/2)-(mcHeadersY/2))-(boardBlankMcHeadersXOffsetY)),
			(mcHeadersZ/2)+(boardBlankZ/2)
			])
			cube([mcHeadersX,mcHeadersY,mcHeadersZ],center=true);
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
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwCutOut(headDiamitor, shaftDiamitor){

	cylinder(h=10, d=headDiamitor, center=true);
	translate([0,0,-9])
		cylinder(h=10, d=shaftDiamitor, center=true);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwSlot(headDiamitor, shaftDiamitor, slotWidth){

	plate2Point(0,slotWidth,10,headDiamitor);
	translate([0,0,-9])
		plate2Point(0,slotWidth-shaftDiamitor,10,shaftDiamitor);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module hexNut3mm(){
	hull(){
		cube([5.6,3.2,2.5],center=true);
		rotate([0,0,(360/3)]) cube([5.6,3.2,2.5],center=true);
		rotate([0,0,(360/6)]) cube([5.6,3.2,2.5],center=true);
	}
}
