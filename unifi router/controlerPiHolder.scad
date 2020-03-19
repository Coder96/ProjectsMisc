$fn=30;

use <../honeycomb_mesh.scad>;

frontPlatechannelHeigth = 40;
frontPlatechanneldepth = 2.3;

frontPlateFrontHeigth = frontPlatechannelHeigth -3;
frontPlateFrontWidth = 90;
frontPlateFrontdepth = 3.7;

grillHoleHeigth = 6;
grillHoleWidth = frontPlateFrontWidth - 4;

piBoardWidth = 56;
piBoardOffSetY = -7;

piFrontPlateFrontWidth = 80;

tfCardHolderWidth = 25;
tfCardHolderDepth = 32.75;
tfCardHolderHeigth = 7.06;

usgWidth =  135;
usgHeigth = 28;

M2SizeT = 2.0;
M2SizeS = 2.3;

M3SizeT = 3.2;
M3SizeS = 3.4;

M4SizeT = 4.1;
M4SizeS = 4.4;


//#translate([-30.7,piBoardOffSetY,-86.5]) rotate([-90,-90,0]) color("green") import ("../../Projects/objects/Raspberry_Pi_3_Light_Version.STL");
//#translate([0,piBoardOffSetY-1.6,-40]) rotate([-90,0,0]) cube([18,13,6.6],center=true); //heat skink block
	
//translate([-35,-29,2]) rotate([0,0,0]) color("green") import ("../../Projects/objects/Raspberry_Pi_3_Light_Version.STL");
	
//PowerFrontPlate();
//FanSpeedFrontPlate();
//piFrontPlate();
//usbMiniMount();


//tfCardHolderFrontPlate(10);
//tfCardHolderBackSupport();


//difference(){

//#color("green") translate([-37,10,0]) cube([frontPlateFrontWidth,frontPlatechannelHeigth+20,10],center=true);

//#color("green") translate([0,-7,0]) cube([frontPlateFrontWidth+10,frontPlatechannelHeigth,10],center=true);
//}




//frontPlatePiSide();
 piBackPlate();


//piFrontPlate(piFrontPlateFrontWidth+3);
//  difference(){
//   	translate([-1.1,piBoardOffSetY-3.21,-51.2]) rotate([-90,-90,0]) piTray();
//   	translate([0,-(frontPlateFrontHeigth/2)+3,-40]) color("blue") cube([300,5,300],center=true); // Floor	
//  }


//unifiFrontSide();
//unifiBackSide();
//unifiUsgTray();

////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiFrontSide(){

//	translate([-268/2,0,0]) cube([268,4,10],center=true);
//	translate([-110/2,10,0]) cube([110,4,10],center=true);

	translate([-30/2,0,0]) powerFrontPlate(30);
	translate([-50,0,0]) fanSpeedFrontPlate(45);

	translate([-80,0,0]) frontPlate(25);
	
	translate([-179,0,0]) unifiFront(180);
	translate([-2,0,0])
		tab(8);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiFront(iWidth){ 
		
//	translate([0,0,(-usgWidth/2)]) translate([0,5,3.71]) cube([usgWidth+1,usgHeigth+1,.0001],center=true);
//	translate([(-usgWidth/2)+22,5,-usgWidth/2]) rotate([0,90,0]) cube([usgWidth+1,usgHeigth+1,.0001],center=true);
	
	unifiUsgAdds();
	
	difference(){
		frontPlate(iWidth);
	
		translate([0,0,3.71]) unifiUsgCutout();
		translate([(-usgWidth/2)-5.3,-18.489,-2.8])
			rotate([-90,-90,0]){
				translate([-5,0,25]) rotate([0,90,0]) cylinder(h=20,d=M2SizeT,center=true);
				translate([-5,0,15]) rotate([0,90,0]) cylinder(h=20,d=M2SizeT,center=true);
			}
		mirror([90,0,0])
		translate([(-usgWidth/2)-5.3,-18.489,-2.8])
			rotate([-90,-90,0]){
				translate([-5,0,25]) rotate([0,90,0]) cylinder(h=20,d=M2SizeT,center=true);
				translate([-5,0,15]) rotate([0,90,0]) cylinder(h=20,d=M2SizeT,center=true);
			}
		}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiUsgTray(){


	difference(){
		union(){
			unifiUsgTraySide();
			mirror([90,0,0]) unifiUsgTraySide();
		}
		translate([0,-(frontPlateFrontHeigth/2)+3,-90]) color("blue") cube([300,5,300],center=true); // Floor
		translate([-10,-12,-160]) rotate([-90,-40,0]) fanMountHoles();
	}
	translate([-10,-12,-160]) rotate([-90,-40,0]) fanMount();
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiUsgTraySide(){

//	translate([(-usgWidth/2)+16,-2,(-usgWidth/2)+3.71]) rotate([0,180,0]) rotate([0,90,90]) import("../USG.H.Feet_low_profile.stl");
	translate([(-usgWidth/2)+22,-11.489,(-usgWidth/2)+3.71]) rotate([0,180,0]) rotate([0,90,90]) unifiUsgTrayUnderSupport();
	
// Under suports
//	cubeSphere(10, 30, 7, 4);
	
// Front Supports
	translate([(-usgWidth/2)-5.3,-18.489,-2.8])
		rotate([-90,-90,0]){
			difference(){
				union(){
				translate([-5,0,16])
					cylinder(h=28,d=10,center=true);
				translate([-5,0,30])
					sphere(d=10);
				}
				translate([0,0,25]) rotate([0,90,0]) cylinder(h=20,d=M2SizeS,center=true);
				translate([0,0,15]) rotate([0,90,0]) cylinder(h=20,d=M2SizeS,center=true);
			}
			translate([-11.95,0,5])
				cubeSphere(18, 10, 7, 4);
			translate([-15.99,9,5])
				cubeSphere(10, 18, 7, 4);
		}
/*
// Back Side Supports
	translate([(-usgWidth/2)-5.3,-18.489,-usgWidth+31.2])
		rotate([-90,-90,0]){
			translate([-5,0,16])
				cylinder(h=28,d=10,center=true);
			translate([-5,0,30])
				sphere(d=10);
			translate([-5,8,5])
				cubeSphere(10, 20, 7, 4);
	}
*/
/*
// Back Supports
	translate([(-usgWidth/2)+8.5,-18.489,-usgWidth+3.5])
		rotate([-90,-90,0]){
			translate([-5,0,16])
				cylinder(h=28,d=10,center=true);
			translate([-5,0,30])
				sphere(d=10);
			translate([8,0,5])
				cubeSphere(30, 10, 7, 4);
	}
*/
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiUsgTrayUnderSupport(){
//	translate([0,0,9.489]) import("../USG.H.Feet_low_profile.stl");

	cubeSphere(15, 15, 5, 4); // center support
	translate([0,0,-1]) cubeSphere(15, 15, 5, 4); // center support
	
	translate([0,0,-2]) cubeSphere(100, 15, 5, 4); // Long bar

	translate([-30,0,-2]) cubeSphere(100, 15, 5, 4); // Long bar
	rotate([0,0,90]) translate([20,80,-2]) cubeSphere(55, 15, 5, 4); // Fan Connector

// end points
	for(a=[1,-1]){
		translate([(a*50)-(a*5),-10,-1]) cubeSphere(10, 15, 5, 4); 
		translate([(a*50)-(a*5),-10,-2]) cubeSphere(10, 15, 5, 4); 
	}
	translate([0,0,1.989]) cylinder(h=5,d=7.5,center=true); // center
// Cross
	for(a=[0,90]){
		rotate([0,0,a]) translate([0,0,1.989]) plate2Point(13,5,3);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiUsgAdds(){


}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiUsgCutout(){


	translate([0,5,-usgWidth/2]) cube([usgWidth,usgHeigth,usgWidth],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module unifiBackSide(){ 
	plateWidth = 209.5;

difference(){
		union(){
		translate([plateWidth/2,0,0])
			plate4Point(plateWidth,frontPlatechannelHeigth,frontPlatechanneldepth,4);
		}
		translate([plateWidth/2,0,0])
			plate4Point(plateWidth-6,frontPlatechannelHeigth-6,frontPlateFrontdepth+2,4);
	}
	difference(){
		union(){
			translate([plateWidth/2,0,1])
				hexagonal_grid([plateWidth-5,frontPlatechannelHeigth-5,frontPlatechanneldepth+2], 7, 2);
			translate([180,0,1]) cylinder(h=frontPlatechanneldepth+2,d=20,center=true);
		}
			translate([180,0,0]) cylinder(h=frontPlatechanneldepth+10,d=13,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piBackPlate(){

	resetX = 30;
	resetY = 5;

	powerX = 120;
	powerY = 5;

	plateWidth = 220;

	difference(){
//		union(){
		translate([plateWidth/2,5.5,frontPlatechanneldepth/2])
			plate4Point(plateWidth,frontPlatechannelHeigth,frontPlatechanneldepth,4);
//		}
		translate([plateWidth/2,5.5,frontPlatechanneldepth/2])
			plate4Point(plateWidth-6,frontPlatechannelHeigth-6,frontPlateFrontdepth+2,4);
	}
	difference(){
		union(){
			translate([plateWidth/2,5,(frontPlatechanneldepth/2)])
				hexagonal_grid([plateWidth-5,frontPlatechannelHeigth-5,frontPlatechanneldepth], 7, 2);
			translate([resetX,resetY,(frontPlatechanneldepth/2)]) cylinder(h=frontPlatechanneldepth,d=20,center=true);
		}
		translate([powerX,powerY,2.3])
			plate4Point(24,24,6,4);
		translate([resetX,resetY,0]) cylinder(h=frontPlatechanneldepth+10,d=13,center=true);
	}
	translate([powerX,powerY,2]) rotate([90,0,180]) usbMiniMount();
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module usbMiniMount(){

//	translate([-(20.3/2),0,-2]) import ("../../Projects/sparkFun/3D_Models/products/12035/stl/Breakout_20Board_20for_20USB_20microB.stl");
	difference(){
		translate([0,-1,0]) rotate([90,0,0]) plate4Point(25,25,2,4);
		translate([0,-1,0]) rotate([90,0,0]) plate4Point(10,5,4,4);
	}
//	translate([0,-1.95,0]) rotate([90,0,0]) plate4Point(20,20,.1,4);
	difference(){
		translate([0,3,-7]) cubeSphere(25, 8, 8, 2);
//		translate([0,-1,-3]) mirror([0,0,180]) rotate([0,90,90]) triagleCylinder(8, 25, 8, 2);
		translate([(15.22/2),2.55,-10]) cylinder(h=20,d=M3SizeT,center=true);
		translate([-(15.22/2),2.55,-10]) cylinder(h=20,d=M3SizeT,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module frontPlatePiSide(){
	
//	translate([2,5.5,frontPlatechanneldepth/2])
//		plate4Point(8,frontPlatechannelHeigth,frontPlatechanneldepth,4);
	difference(){
		union(){
			translate([2,0,0])
				tab(8);
			
			translate([30/2,0,0]) powerFrontPlate(30);
			
			translate([(piFrontPlateFrontWidth/2)+27,0,0]) piFrontPlate(piFrontPlateFrontWidth+3);
			
			translate([115,0,0]) tfCardHolderFrontPlate(20);
			
			translate([139,0,0]) fanSpeedFrontPlate(35);
		}
		color("green") translate([106,24,0]) rotate([0,0,90]) plate2Point(8,10,4);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module fanSpeedFrontPlate(iWidth){
	
	FanSpeedHole = 7;
	FanSpeedHoleIndent = 16;
	
	difference(){
		frontPlate(iWidth);
		translate([0,17,0]) cylinder(h=20,d=5,center=true);	// led 

		translate([0,0,0]) cylinder(h=20,d=FanSpeedHole,center=true);	
		translate([0,0,9]) cylinder(h=20,d=FanSpeedHoleIndent,center=true);	

		
	}	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module powerFrontPlate(iPlateWidth){

	powerSwitchWidth = 13;
	powerSwitchHeigth = 19;
	powerSwitchClipWidth = 5.7;
	powerSwitchClipHeigth = 20.5;
	
	difference(){
		frontPlate(iPlateWidth);
		translate([0,17,0]) cylinder(h=20,d=5.1,center=true);	// led 
		cube([powerSwitchWidth,powerSwitchHeigth,10],center=true);
		cube([powerSwitchClipWidth,powerSwitchClipHeigth,10],center=true);
		translate([0,0,-3]) cube([powerSwitchClipWidth,powerSwitchClipHeigth+4,10],center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module frontPlate(iWidth){
	union(){
//		translate([0,5.5,frontPlatechanneldepth/2])
//#			plate4Point(iWidth,frontPlatechannelHeigth,frontPlatechanneldepth,4);
		hull(){
			translate([0,5.5,frontPlatechanneldepth]) color("orange")
				plate4Point(iWidth,frontPlatechannelHeigth,.1,4);
				
			translate([0,5.5,0]) color("green")
				plate4Point(iWidth,frontPlateFrontHeigth,.1,4);
}
		translate([0,5.5,frontPlateFrontdepth/2])
			cube([iWidth,frontPlateFrontHeigth,frontPlateFrontdepth],center=true);
// back side
		translate([0,5.5,-1])
			cube([iWidth,frontPlateFrontHeigth,frontPlateFrontdepth],center=true);

	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piFrontPlate(iPlateWidth){
	difference(){
		frontPlate(iPlateWidth);
		PiFrontPlateCutouts();
	}
		piFrontPlateAdds();
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module PiFrontPlateCutouts(){
	translate([0,-piBoardOffSetY-1,-2]) piFrontPorts();
	
	translate([0,0,-8]) piFrontPlateSupportPost();

	translate([-19,17,0]) rotate([0,90,90]) tfCardslot();
	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piFrontPlateAdds(){

	//piFrontPlateSupportPost();
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piFrontPlateSupportPost(){
//bot
	translate([(piBoardWidth/2)+7,-4,0]) 
		cylinder(h=20,d=M2SizeT,center=true);
//		supportPost();
	
	translate([-(piBoardWidth/2)-7,-4,0]) 
		cylinder(h=20,d=M2SizeT,center=true);
//		supportPost();
//top
	translate([(piBoardWidth/2)+7,10,0]) 
		cylinder(h=20,d=M2SizeT,center=true);
//		supportPost();
	
	translate([-(piBoardWidth/2)-7,10,0]) 
		cylinder(h=20,d=M2SizeT,center=true);
//		supportPost();
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piTray(){

holeSeperationWidth = 58;
holeSeperationDepth = 49;

	for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
		translate([a[0]*(holeSeperationWidth/2),a[1]*(holeSeperationDepth/2),0]){
			difference(){
				cylinder(h=10,d1=10,d2=5,center=true);
				cylinder(h=20,d=M2SizeT,center=true);
			}
		}
	}
// wide rails
	rotate([90,0,0]) translate([(holeSeperationWidth/2),-3,0])
		cylinder(h=70,d=8,center=true);
	
//	rotate([90,0,0]) translate([(-holeSeperationWidth/2),-3,0])
//		cylinder(h=70,d=6,center=true);
// long rails
	rotate([0,90,0]) translate([3,(holeSeperationDepth/2),0])
		cylinder(h=60,d=8,center=true);
	rotate([0,90,0]) translate([3,(-holeSeperationDepth/2),0])
		cylinder(h=60,d=8,center=true);
		
	translate([48.2,(piBoardWidth/2)+8.5,-7])
		piTrayAngleSupport();
		
	translate([48.2,-(piBoardWidth/2)-5.5,-7])
		piTrayAngleSupport();
	
	translate([-90,-5,-2]) rotate([0,0,45])fanMount();
	rotate([0,90,0]) translate([3,(-holeSeperationDepth/2),-58])
		cylinder(h=100,d=8,center=true);
	rotate([-15,90,-2]) translate([3,(holeSeperationDepth/2)+6,-42])
		cylinder(h=40,d=8,center=true);	
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piTrayAngleSupport(){
	difference(){
		union(){
			difference(){
//				triagleCylinder(30, 10, 32, 4);
//				translate([-26,0,10]) cube([10,12,15],center=true);
			}
			translate([-5,0,16])
				cylinder(h=30,d=10,center=true);
			translate([-5,0,31]) sphere(d=10);
//				cubeSphere(10, 10, 30, 4);
			translate([-12.95,0,5])
				cubeSphere(20.4, 10, 8, 4);
		}
		translate([0,-.4,13.2])
			rotate([0,90,0]) cylinder(h=60,d=M2SizeS,center=true);
		translate([0,-0.4,27.2])
			rotate([0,90,0]) cylinder(h=60,d=M2SizeS,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardSupportPost(){
	translate([(tfCardHolderWidth/2)+(tfCardHolderHeigth/2),0,0]) plate4Point(tfCardHolderHeigth,tfCardHolderHeigth,6,4);
	translate([(-tfCardHolderWidth/2)-(tfCardHolderHeigth/2),0,0]) plate4Point(tfCardHolderHeigth,tfCardHolderHeigth,6,4);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardSupportHoles(){
	translate([(tfCardHolderWidth/2)+(tfCardHolderHeigth/2)-1,0,0]) cylinder(h=20,d=M2SizeT,center=true);
	translate([(-tfCardHolderWidth/2)-(tfCardHolderHeigth/2)+1,0,0]) cylinder(h=20,d=M2SizeT,center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardHolderFrontPlate(iPlateWidth){
	difference(){
		frontPlate(iPlateWidth);
		tfCardHolderCutout();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardHolderCutout(){

	translate([0,5.5,-9.8]) rotate([0,0,90]) cube([tfCardHolderWidth,tfCardHolderHeigth,33],center=true); // Card Holder
	translate([0,5.5,-9]) rotate([0,0,90]) tfCardSupportHoles();

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardHolderBackSupport(){
	translate([0,5.5,-9]) rotate([0,0,90]) translate([(tfCardHolderWidth/2)+(tfCardHolderHeigth/2)-1,0,1.6]) 
//	cylinder(h=9,d=5,center=true);
	plate4Point(4.9,10,9,3);
	translate([0,5.5,-9]) rotate([0,0,90])translate([(-tfCardHolderWidth/2)-(tfCardHolderHeigth/2)+1,0,0]) cylinder(h=9,d=3,center=true);
#	translate([0,5.5,-9]) rotate([0,0,90])tfCardSupportHoles();
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module supportPost(){
	difference(){
		plate4Point(tfCardHolderHeigth,tfCardHolderHeigth,6,4);
		cylinder(h=20,d=2.2,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module piFrontPorts(){

	cube([15.5,15.94,20],center=true); // Left usb
	
	translate([17.85,0,0])
		cube([15.5,15.94,20],center=true); // Right usb

	translate([-18.8,-1.75,0])
		cube([16.5,14.5,20],center=true); // Ethernet

	translate([0,-9.4,-39])
		rotate([90,0,0])
		plate4Point(60,86,3,4);
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
module plate2Point(x,z,d){
	hull(){
		color("green") translate([(x/2) -(d/2),0 ,0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([-(x/2)+(d/2),0 ,0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triagleCylinder(iX, iY, iZ, iD){
	
	halfD = iD/2;
	hull(){
		color("red")		translate([-halfD   , (iY/2)-halfD, halfD]) sphere(d=iD);	
		color("grey")		translate([-iX+halfD, (iY/2)-halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , (iY/2)-halfD, iZ-halfD]) sphere(d=iD);

		color("red")		translate([-halfD   , -(iY/2)+halfD, halfD]) sphere(d=iD);	
		color("grey")		translate([-iX+halfD, -(iY/2)+halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , -(iY/2)+halfD, iZ-halfD]) sphere(d=iD);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cubeSphere(iX, iYm, iZ, iD){

	edgeDiamitor = iD;
	
	hull(){
		for(a=[[1,1,1],[-1,1,1],[1,-1,1],[-1,-1,1],[1,1,-1],[-1,1,-1],[1,-1,-1],[-1,-1,-1]]){
			translate([
				a[0]*((iX/2) -(edgeDiamitor/2)), 
				a[1]*((iYm/2)-(edgeDiamitor/2)), 
				a[2]*((iZ/2) -(edgeDiamitor/2))]) sphere(d=edgeDiamitor);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tfCardslot() {
	width = 12;
	thickness = 1.4;
	cube(size=[11.25, width, thickness],center=true);
	translate([-5,0,0]) cube(size=[2, width, thickness+1],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module tab(iWidth){
	hull(){
		translate([0,5.5,frontPlatechanneldepth]) color("orange")
			plate4Point(iWidth,frontPlatechannelHeigth,.1,4);
			
		translate([0,5.5,0]) color("green")
			plate4Point(iWidth-4,frontPlateFrontHeigth,.1,4);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module fanMount(){
	holeSeperationOC = 57;

	difference(){
		union(){
			plate2Point(holeSeperationOC,2,6);
			rotate([0,0,90]) plate2Point(holeSeperationOC,2,6);
			for(a=[1,-1]){
				translate([a*(holeSeperationOC/2),0,2]){
						cylinder(h=6,d1=10,d2=8,center=true);
				}
			}
		}
		fanMountHoles();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module fanMountHoles(){
	holeSeperationOC = 57;
	
	for(a=[1,-1]){
		translate([a*(holeSeperationOC/2),0,2]) cylinder(h=20,d=M4SizeT,center=true);
	}
}
