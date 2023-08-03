$fn=60;

use<../../scadLib/library.scad>;
use<../../scadLib/tearDrop.scad>;
use<../../scadLib/switchCutoutRockerOnOff.scad>;
use<../../scadLib/edgeTools/corner_tools.scad>;

use<../../scadLib/BatteryHolder9v.scad>;

include<../../scadLib/boltHolesCutout_h.scad>
use<../../scadLib/boltHolesCutout.scad>

meterBodyWidth  = 45;
meterBodyDepth  = 26;
meterBodyHeigth = 22;

meterFaceWidth  = 48;
meterFaceDepth  = 29;
meterFaceHeigth = 3;

outterShellWidth  = 142;
outterShellDepth  = 70;
outterShellHeigth = 40;
outterShellCorner = 10;
outterShellWallThickness = 4;

innerShellWallThickness = 4;
innerShellWidth  = outterShellWidth;
innerShellDepth  = meterFaceDepth + 5 + innerShellWallThickness;
innerShellHeigth = outterShellHeigth;
innerShellCorner = 10;

innerShellTopCutoutWidth  = innerShellWidth - 3;
innerShellTopCutoutDepth  = innerShellDepth - 3;
innerShellTopCutoutHeigth = outterShellHeigth;
innerShellTopCutoutCorner = 10;

innerShellTopWidth  = innerShellTopCutoutWidth - 1;
innerShellTopDepth  = innerShellTopCutoutDepth - 1;
innerShellTopHeigth = 4;
innerShellTopCorner = 10;

innerShellTopInset = 6;
innerTopMountingHolesInset = 5;

innerShellTopTextProductName  = "vam_case_001";
innerShellTopTextVoltageRange = "DC 0-100 Volts";
innerShellTopTextAmpsRange    = "0-5 Amps";
//innerShellTop

switchShellWidth = 40;
switchShellDepth = 20;
switchShellHeigth = innerShellHeigth - 10;

switchShellTopWidth = switchShellWidth - 3;
switchShellTopDepth = switchShellDepth - 3;
switchShellTopHeigth = 3;

fuseShellWidth = 40;
fuseShellDepth = 20;
fuseShellHeigth = innerShellHeigth - 25;

fuseShellTopWidth = switchShellWidth - 3;
fuseShellTopDepth = switchShellDepth - 3;


fuseShellTopBottomHeigth = 4;

fuseHolderWidth = 20;
fuseHolderDepth = 7;
fuseHolderHeight = 7.5 ;

// for visual not part of the object
//translate([32,-(outterShellDepth/2)+(innerShellDepth/2),9.25]) batteryHolder9vCage();
//translate([32,0,4.25]) batteryHolder9vCage();

case();

//wireClampBar();

//switchShellTop();
//
//translate([0,0,0])
//  fuseShellTop();
//
//translate([0,0,0])
//  fuseShellTopBottom();



//translate([-(meterFaceWidth/2)-8,-(outterShellDepth/2)+(innerShellDepth/2),11]) vamModel();

//translate([
//  0,
//  -(innerShellTopDepth/2)+(1),
//  (outterShellHeigth/2)-(innerShellTopHeigth/2)-2
//  ]){
//	innerShellTop(); 
//}


//cubeSphere(iX, iYm, iZ, iD)

////////////////////////////////////////////////////////////////////
module case(){
  difference(){
    union(){
      outterShell();
      translate([
        0,
        -(outterShellDepth/2)+(innerShellDepth/2),0])
        innerShell();
			
      translate([
        0,
        (outterShellDepth/2)-(innerShellDepth/2)+(innerShellWallThickness/2),0])
        innerShellEmpty();
			
			translate([32,-(outterShellDepth/2)+(innerShellDepth/2),-16]) batteryHolder9vBase(9);
      
      translate([0,(switchShellDepth/2)+1.5,-5])
        powerSwitchFuseHolder();
    }
    translate([
      0,
      -(outterShellDepth/2)+(innerShellDepth/2),
      outterShellHeigth-innerShellTopInset])
      innerShellTopCutout();
		translate([
			0,
			-(innerShellTopDepth/2)+(1),
			(outterShellHeigth/2)-(innerShellTopHeigth/2)-16
			])
			innerTopMountingHoles("t");
    
// Switch
    translate([-19,2,-15])
      rotate([0,0,90])
      tearDropFlatBottom(24,6,20);
// Fuse
    translate([19,2,-33])
      rotate([180,0,90])
      tearDropFlatBottom(20,6,20);

// Switch side cable
    translate([-52,2,-20])
      rotate([0,0,90])
      tearDropFlatBottom(12,6,10);
// Fuse side cable
    translate([52,2,-20])
      rotate([0,0,90])
      tearDropFlatBottom(12,6,10);
      
  }
  difference(){
    translate([0,0,((-outterShellHeigth/2)-2)]) plate4Point(outterShellWidth,outterShellDepth,4,outterShellCorner);

    color("Fuchsia")
      translate([0,outterShellDepth/2,((-outterShellHeigth/2)-4)])
      rotate ([90,0,-90]) 
      chamfer_e(outterShellWidth,3,1);

    color("green")
      translate([0,-outterShellDepth/2,((-outterShellHeigth/2)-4)])
      rotate ([90,0,90]) 
      chamfer_e(outterShellWidth,3,1);

    color("orange")
      translate([-outterShellWidth/2,0,((-outterShellHeigth/2)-4)])
      rotate ([90,0,0]) 
      chamfer_e(outterShellDepth,3,1);

    color("Violet")
      translate([outterShellWidth/2,0,((-outterShellHeigth/2)-4)])
      rotate ([90,-90,0]) 
      chamfer_e(outterShellDepth,3,1);
    
    for(a=[[1,1,90],[1,-1,0],[-1,-1,-90],[-1,1,180]]){
      translate([
        a[0]*(outterShellWidth/2)-(a[0]*4),
        a[1]*(outterShellDepth/2)-(a[1]*4),
        ((-outterShellHeigth/2)-4)
      ])
        rotate([0,0,a[2]])
        difference(){
          rotate ([0,180,0])
            chamfer_r(3,4,1,fn=$fn);
          translate([-2,0,2])
            cube([4,10,5],center=true);
          translate([0,2,2])
            cube([10,4,5],center=true);
      }
    } 
//   // Switch side cable
    translate([-48,-6,((-outterShellHeigth/2)-1)])
        rotate([0,0,45])
      wireClampHoles();
// Fuse side cable
      translate([44,-6,((-outterShellHeigth/2)-1)]) 
        rotate([0,0,-45])
        wireClampHoles();
  } 
}
////////////////////////////////////////////////////////////////////
module wireClampHoles(){
  translate([-5,0,0])
    rotate([0,0,90])
    cylinder(d=bhc_m3ShaftThread,h=4,center=true);
  translate([5,0,0])
    rotate([0,0,90])
    cylinder(d=bhc_m3ShaftThread,h=4,center=true);
}
////////////////////////////////////////////////////////////////////
module wireClampBar(){
  difference(){
    translate([0,0,0])
      rotate([0,0,90])
      plate2Point(15,2,5);
    translate([0,-5,0])
      cylinder(d=bhc_m3ShaftSlip,h=10,center=true);
    translate([0,5,0])
      cylinder(d=bhc_m3ShaftSlip,h=10,center=true);
  }
  difference(){
    translate([0,0,-4])
      rotate([0,90,90])
      plate2Point(15,4,5);
    translate([0,0,-10])
    cube([10,10,20],center=true);
  }
}
////////////////////////////////////////////////////////////////////
module outterShell(){
	difference(){
		plate4Point(outterShellWidth,outterShellDepth,outterShellHeigth,outterShellCorner);

		plate4Point(
			outterShellWidth-outterShellWallThickness,
			outterShellDepth-outterShellWallThickness,
			outterShellHeigth+1,
			outterShellCorner
		);
	}
}
////////////////////////////////////////////////////////////////////
module innerShell(){
  difference(){
    union(){
      emptyShell0(innerShellWidth,innerShellDepth,innerShellHeigth,innerShellWallThickness,innerShellCorner,innerShellCorner+20);
      cube([3,innerShellDepth,innerShellHeigth],center=true);
      for(a=[[1,0],[-1,180]]){
        translate([0,a[0]*((innerShellDepth/2)-(innerShellWallThickness/2)),0])
          rotate([0,0,a[1]])
            sideSupportBolt();
      }
      for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
        translate([
          a[0]*(innerShellTopWidth/2)-a[0]*innerTopMountingHolesInset,
          a[1]*(innerShellTopDepth/2)-a[1]*innerTopMountingHolesInset,
          0
        ])
          cylinder(d=6,h=innerShellHeigth,center=true);
      }
      for(a=[1,-1]){
        translate([
          0,
          a*(innerShellTopDepth/2)-a*(innerTopMountingHolesInset),
          0
        ])
          cylinder(d=6,h=innerShellHeigth,center=true);
      }
    }
    translate([0,0,-10])
      tearDropFlatBottom(30,6,20);
  }
}
////////////////////////////////////////////////////////////////////
module switchShell(){
	difference(){
		union(){
			difference(){
				plate4Point(switchShellWidth,switchShellDepth,switchShellHeigth,innerShellCorner);

				plate4Point(
					switchShellWidth-innerShellWallThickness,
					switchShellDepth-innerShellWallThickness,
					switchShellHeigth+1,
					innerShellCorner 
				);
			}
      translate([-switchShellWidth+(innerShellWallThickness/2),-.5,0]){
        difference(){
          emptyShell(
            switchShellWidth,
            switchShellDepth,
            switchShellHeigth,
            innerShellWallThickness,
            innerShellCorner);
          translate([-switchShellWidth/2,0,0])
          cube([
            switchShellWidth+1,
            switchShellDepth+1,
            switchShellHeigth+1,
          ],center=true);
          translate([0,switchShellDepth/2,0])
          cube([
            switchShellWidth+1,
            switchShellDepth+1,
            switchShellHeigth+1,
          ],center=true);
        }
      }
      translate([switchShellWidth-(innerShellWallThickness/2),-.5,0]){
        difference(){
          emptyShell(
            switchShellWidth,
            switchShellDepth,
            switchShellHeigth,
            innerShellWallThickness,
            innerShellCorner);
          translate([switchShellWidth/2,0,0])
          cube([
            switchShellWidth+1,
            switchShellDepth+1,
            switchShellHeigth+1,
          ],center=true);
          translate([0,switchShellDepth/2,0])
          cube([
            switchShellWidth+1,
            switchShellDepth+1,
            switchShellHeigth+1,
          ],center=true);
        }
      }
			for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
				translate([
					a[0]*(switchShellWidth/2)-a[0]*innerTopMountingHolesInset,
					a[1]*(switchShellDepth/2)-a[1]*innerTopMountingHolesInset,
					0
				])
					difference(){
						cylinder(d=6,h=switchShellHeigth,center=true);
						cylinder(d=3,h=switchShellHeigth+1,center=true);
				}
			}
		}
		hull(){
			translate([0,0,(switchShellHeigth/2)-(switchShellTopHeigth/2)-1])
				switchShellTop();
			translate([0,0,(switchShellHeigth/2)])
				switchShellTop();
		}
	}
}
////////////////////////////////////////////////////////////////////
module switchShellTop(){
	difference(){
		plate4Point(switchShellTopWidth,switchShellTopDepth,switchShellTopHeigth,innerShellCorner);
		translate([0,0,-2]) rotate([0,0,90]) switchCutoutRockerOnOff();
		for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
				translate([
					a[0]*(switchShellWidth/2)-a[0]*innerTopMountingHolesInset,
					a[1]*(switchShellDepth/2)-a[1]*innerTopMountingHolesInset,
					0
				])
					difference(){
            m3BoltSlip();
//						cylinder(d=3.3,h=switchShellHeigth+1,center=true);
				}
			}
		
	}
}
////////////////////////////////////////////////////////////////////
module fuseShell(){
		
	difference(){
		union(){
			difference(){
				plate4Point(fuseShellWidth,fuseShellDepth,fuseShellHeigth,innerShellCorner);

				plate4Point(
					fuseShellWidth-innerShellWallThickness,
					fuseShellDepth-innerShellWallThickness,
					fuseShellHeigth+1,
					innerShellCorner 
				);
			}
      translate([fuseShellWidth-(innerShellWallThickness/2),-.5,0]){
        difference(){
          emptyShell(
            fuseShellWidth,
            fuseShellDepth,
            fuseShellHeigth,
            innerShellWallThickness,
            innerShellCorner);
          translate([fuseShellWidth/2,0,0])
          cube([
            fuseShellWidth+1,
            fuseShellDepth+1,
            fuseShellHeigth+1,
          ],center=true);
          translate([0,fuseShellDepth/2,0])
          cube([
            fuseShellWidth+1,
            fuseShellDepth+1,
            fuseShellHeigth+1,
          ],center=true);
        }
      }

			for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
				translate([
					a[0]*(fuseShellWidth/2)-a[0]*innerTopMountingHolesInset,
					a[1]*(fuseShellDepth/2)-a[1]*innerTopMountingHolesInset,
					0
				])
					difference(){
						cylinder(d=6,h=fuseShellHeigth,center=true);
            m3BoltThreaded();
//						cylinder(d=3,h=fuseShellHeigth+1,center=true);
				}
			}
		}
		hull(){// change
			translate([0,0,(fuseShellHeigth/2)-(fuseHolderHeight/2)+.001])
				fuseShellTop();
      
			translate([0,0,(fuseShellTopBottomHeigth/2)])
				fuseShellTopBottom();
		}
	}
}
////////////////////////////////////////////////////////////////////
module fuseShellTop(){
	difference(){
		plate4Point(switchShellTopWidth,switchShellTopDepth,fuseHolderHeight+1,innerShellCorner);
		translate([0,0,-.501]) fuseCutouts("c");
		for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
			translate([
				a[0]*(switchShellWidth/2)-a[0]*innerTopMountingHolesInset,
				a[1]*(switchShellDepth/2)-a[1]*innerTopMountingHolesInset,
				0
			])
				difference(){
					m3BoltSlip();
			}
		}
	}
}
////////////////////////////////////////////////////////////////////
module fuseShellTopBottom(){
//#		translate([0,0,1.7]) fuseCutouts("c");

	difference(){
		plate4Point(switchShellTopWidth,switchShellTopDepth,fuseShellTopBottomHeigth,innerShellCorner);
		for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
			translate([
				a[0]*(switchShellWidth/2)-a[0]*innerTopMountingHolesInset,
				a[1]*(switchShellDepth/2)-a[1]*innerTopMountingHolesInset,
				0
			])
			m3BoltSlip();
			for(a=[1,-1]){
			translate([
				a*(fuseHolderWidth/2)-(a*3),
				0,
				0
			])
			cylinder(h=fuseShellTopBottomHeigth+1,d=7,center=true);
			}
		}
	}
}
////////////////////////////////////////////////////////////////////
module innerShellEmpty(){
	wInnerShellDepth = outterShellDepth - innerShellDepth+(innerShellWallThickness/2);
	difference(){
    plate4Point(innerShellWidth,wInnerShellDepth,innerShellHeigth,innerShellCorner);

		plate4Point(
			innerShellWidth-innerShellWallThickness,
			innerShellDepth-innerShellWallThickness,
			innerShellHeigth+1,
			innerShellCorner + 20
		);
	}
	
}
////////////////////////////////////////////////////////////////////
module innerShellTop(){
  difference(){
		plate4Point(innerShellTopWidth,innerShellTopDepth,innerShellTopHeigth,innerShellTopCorner);
		innerTopMountingHoles("s");
		translate([-(meterFaceWidth/2)-8,0,0]) vamModel();
	}
  color("green"){
  translate([32,10,0])
    mText(innerShellTopTextProductName, letter_size = 5, letter_height = 3);
  translate([32,0,0])
    mText(innerShellTopTextVoltageRange, letter_size = 5, letter_height = 3);
  translate([32,-7,0])
    mText(innerShellTopTextAmpsRange, letter_size = 5, letter_height = 3);
  }
}
////////////////////////////////////////////////////////////////////
module innerTopMountingHoles(iType){
 
  
  for(a=[[1,1],[1,-1],[-1,-1],[-1,1]]){
    translate([
      a[0]*(innerShellTopWidth/2)-a[0]*innerTopMountingHolesInset,
      a[1]*(innerShellTopDepth/2)-a[1]*innerTopMountingHolesInset,
      -10
    ])
      //m3BoltThreaded();
      innerTopMountHolestype(iType);
  }
  for(a=[1,-1]){
    translate([
      0,
      a*(innerShellTopDepth/2)-a*innerTopMountingHolesInset,
      -10
    ])
      //m3BoltSlip();
      innerTopMountHolestype(iType);
  }
  
}
////////////////////////////////////////////////////////////////////
module innerTopMountHolestype(iType){
  if(iType == "s"){
    m3BoltSlip();
  }else{
    m3BoltThreaded();
  }
}
////////////////////////////////////////////////////////////////////
module innerShellTopCutout(){
  plate4Point(
    innerShellTopCutoutWidth,
    innerShellTopCutoutDepth,
    innerShellTopCutoutHeigth,
    innerShellTopCutoutCorner); 
}
////////////////////////////////////////////////////////////////////
module sideSupportBolt(){
	dropDiam = 5;
	difference(){
		union(){
			rotate([0,90,0])
				tearDrop(dropDiam,innerShellHeigth);
			rotate([0,-90,0])
				tearDrop(dropDiam,innerShellHeigth);
		}
		translate([0,(dropDiam/2)+.2,0])
			cube([dropDiam+(dropDiam/2),dropDiam,innerShellHeigth+1],center=true);
	}
}
////////////////////////////////////////////////////////////////////
module vamModel(){
	translate([0,0,(meterBodyHeigth/2)-(meterFaceHeigth/2)])
		cube([meterFaceWidth,meterFaceDepth,meterFaceHeigth],center=true);
	cube([meterBodyWidth,meterBodyDepth,meterBodyHeigth],center=true);
}
////////////////////////////////////////////////////////////////////
module powerSwitchFuseHolder(){
  
  fuseShellMoveDown =
    -(switchShellHeigth/2)+(fuseShellHeigth/2);
  
  translate([-(switchShellWidth/2)+1,0,0])
    switchShell();
  
  translate([(fuseShellWidth/2)-.5,0,fuseShellMoveDown])
    fuseShell();
  
  
  translate([0,(fuseShellDepth/2),fuseShellMoveDown])
    triangleCurveFiller(fuseShellHeigth);  
  translate([fuseShellWidth-(innerShellWallThickness/2)+.75,-fuseShellDepth/2,fuseShellMoveDown]) rotate([0,0,180])
    triangleCurveFiller(fuseShellHeigth);

  translate([-switchShellWidth+(innerShellWallThickness/2)-.25,-switchShellDepth/2,0]) rotate([0,0,180])
    triangleCurveFiller(switchShellHeigth);
  translate([0+.25,-fuseShellDepth/2,0]) rotate([0,0,180])
    triangleCurveFiller(switchShellHeigth);

}
////////////////////////////////////////////////////////////////////
module triangleCurveFiller(iHeight){
  difference(){
     rotate([0,0,45])
      cube([7,7,iHeight],center=true);

    translate([0,3,0])
      cube([10,6,iHeight+1],center=true);
  }
 }
////////////////////////////////////////////////////////////////////
 module emptyShell(iX,iY,iZ,iW,iC,iC2=10){
   
  difference(){
    plate4Point(iX,iY,iZ,iC);
    plate4Point(
      iX-iW,
      iY-iW,
      iZ+1,
      iC 
    );
  }
}
////////////////////////////////////////////////////////////////////
 module emptyShell0(iX,iY,iZ,iW,iC,iC2){
   
  difference(){
    plate4Point(iX,iY,iZ,iC);
    plate4Point(
      iX-iW,
      iY-iW,
      iZ+1,
      iC2
    );
  }
}
////////////////////////////////////////////////////////////////////
module m3BoltThreaded(){

	color("grey")
    bhc_bolt(bhc_m3ShaftThread, outterShellHeigth+10, bhc_m3CapSocket, 4);
 
  
  
//  studLegth = 25;
//	color("grey"){
//    translate([0,0,studLegth/2])
//    #cylinder(h=studLegth,d=bhc_m3ShaftThread,center=true);
//    
//    translate([0,0,studLegth-.1])
//      cylinder(h=4,d=bhc_m3CapSocket,center=true);
//  }
}
////////////////////////////////////////////////////////////////////
module m3BoltSlip(){
	color("grey")
    bhc_bolt(bhc_m3ShaftSlip, outterShellHeigth+10, bhc_m3CapSocket, 4);
}
////////////////////////////////////////////////////////////////////
module fuseCutouts(inType="m"){

	wallThickness = 1.2;
	
	feetWidth = 1.62;
	feetDepth = .38;
	feetHeight = 2.45;
	
	if(inType == "m"){
		difference(){
			cube([fuseHolderWidth,fuseHolderDepth,fuseHolderHeight],center=true);
			translate([0,0,wallThickness])
				cube([fuseHolderWidth-(wallThickness*2),fuseHolderDepth-(wallThickness*2),fuseHolderHeight],center=true);
		}
	} else {
		union(){
			cube([fuseHolderWidth,fuseHolderDepth,fuseHolderHeight],center=true);
      for(a=[[1,1],[1,-1],[-1,1],[-1,-1]]){
        translate([
          a[0]*(fuseHolderWidth)/2,
          a[1]*(fuseHolderDepth)/2,
          0
        ])
          cylinder(d=1,h=fuseHolderHeight,center=true);
      }
		}
		translate([0,0,10])
			cube([fuseHolderWidth-(wallThickness),fuseHolderDepth-(wallThickness),fuseHolderHeight+10],center=true);
	}
	
}
////////////////////////////////////////////////////////////////////
module unionRound(r, detail = 5) {
  epsilon = 1e-6;
  children(0);
  children(1);
  step = 1 / detail;
  for (i = [0: step: 1 - step]) {
    {
      x = r - sin(i * 90) * r;
      y = r - cos(i * 90) * r;
      xi = r - sin((i + step) * 90) * r;
      yi = r - cos((i + step) * 90) * r;
      //            color(rands(0, 1, 3, i))
      hull() {
        intersection() {
          // shell(epsilon) 
          ur_clad(x) children(0);
          // shell(epsilon) 
          ur_clad(y) children(1);
          }
        intersection() {
          // shell(epsilon) 
          ur_clad(xi) children(0);
          // shell(epsilon) 
          ur_clad(yi) children(1);
        }
      }
    }
  }
}
// unionRound helper expand by r
module ur_clad(r) {
    minkowski() {
        children();
        //        icosphere(r,2);
        sphere(r, $fn = 19.5);
    }
}
// unionRound helper
module ur_shell(r) {
    difference() {
        ur_clad(r) children();
        children();
    }
}