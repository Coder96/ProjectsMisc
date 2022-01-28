$fn = 60;


fuseHolderWidth = 20;
fuseHolderDepth = 7;
fuseHolderHeight = 7.5 ;

blankHoleOffsetX = 1;
blankHoleOffsetY = 1;

boltHole = 3.6;

cableDiamiter = 3.3;

perfBoardSpacing=2.54;
perfBoardSpacesDepth=8;
perfBoardSpacesWide=14;

boltHolsWidth = perfBoardSpacing * perfBoardSpacesWide;
boltHolsDepth = perfBoardSpacing * perfBoardSpacesDepth;

baseHolderWidth = boltHolsWidth + 6; //40;
baseHolderDepth = boltHolsDepth + 6; //23;

baseHolderHeight = fuseHolderHeight + 1;

//color("grey",.5)
translate([0,0,10]) top();

//color("grey",.5)
//bottom();

//color("grey",.5)
//translate([0,0,-6]) legs();

//holderBlock("c");

////////////////////////////////////////////////////////////////////////////////////////////////////
module legs(){

	legHeigth = 17;
	legWidth = 6;
	legTopHeigth = 4;
	footWidth = 16;
	footHeigth = 4;
	footDepth =14;

		
	difference(){
		union(){
			plate4Point(baseHolderWidth,baseHolderDepth,legTopHeigth,4);   // Top Plate
				
			translate([0, (-1*(footDepth/3))+.1, -1*((legHeigth)-(footHeigth))])
				plate4Point(baseHolderWidth, footDepth, legTopHeigth, 6);   // foot

			difference(){
				for(a=[1,-1]){
					difference(){
						translate([a*(baseHolderWidth-legWidth)/2, 0, -1*(legHeigth/2)+(legTopHeigth/2)])
							plate2Point(baseHolderDepth,legHeigth,legWidth);   // Leg
					}
				}
//				translate([0,10.5,-13])
//					rotate([0,90,0])
//					scale([1.5,.8,1])
//					cylinder(d=20.2, h=baseHolderWidth+5, center=true);
				}
		}
		translate([0,5,0])																								// Top Cutout
			plate4Point(baseHolderWidth-12,baseHolderDepth+20,legTopHeigth+1,4);

		rotate([0,0,90])																									// Screw slot
			translate([-(baseHolderWidth-footWidth-15)/2, 0, 2])
			screwSlot(12, 5.5, baseHolderWidth-4-legWidth*2);
			
		for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([																											// Corner Hole
				a[0]*((baseHolderWidth/2)-(4/2)-blankHoleOffsetX),
				a[1]*((baseHolderDepth/2)-(4/2)-blankHoleOffsetY),
				0])
				cylinder(d=boltHole, h=20, center=true);
			translate([																											// Nutt Slot
				a[0]*((baseHolderWidth/2)-(4/2)-blankHoleOffsetX),
				a[1]*((baseHolderDepth/2)-(4/2)-blankHoleOffsetY),
				-3.5]) // nut slot
				rotate([0,0,90])
				nuttSlot();
		}

		translate([0,-9.5,-7.5])
		 cube([50,9,7],center=true);
			
		translate([0,7.45,-12])
			cube([baseHolderWidth+5,10,30],center=true);

	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bottom(){
	difference(){
		union(){
			plate4Point(baseHolderWidth,baseHolderDepth,(baseHolderHeight/2)+1,4);
      cableSupport();
      }
      cableSupportDel();
   translate([0,0,5.25])																	              // Cut Support Flat Top
      plate4Point(baseHolderWidth+20,baseHolderDepth+10,(baseHolderHeight/2)+1,5);
    
    translate([0,0,-4.75])																	            // Cut Support Flat BotTOM
      plate4Point(baseHolderWidth+20,baseHolderDepth+10,(baseHolderHeight/2)+1,5);
    
      bottomFuseCutouts();
      boltHolesCorners();
	}
  
		for(a = [[-1,0],[1,0]]){
			translate([																											// Line up bumps
				a[0]*((baseHolderWidth/2)-(4/2)-blankHoleOffsetX),
				a[1]*((baseHolderDepth/2)-(4/2)-blankHoleOffsetY),
				(baseHolderHeight/4)])
				sphere(d=boltHole-1);
		}
    cableSupportAdd();

  }
////////////////////////////////////////////////////////////////////////////////////////////////////
module top(){
	difference(){
		plate4Point(baseHolderWidth,baseHolderDepth,baseHolderHeight,4);
		translate([0,0,(-(baseHolderHeight - fuseHolderHeight)/2)-2.6])
      bottomFuseCutouts();
//		translate([
//      (baseHolderWidth/2)-(fuseHolderWidth)-3,
//      -(baseHolderDepth/2)+(fuseHolderDepth*2.3),
//      (-(baseHolderHeight - fuseHolderHeight)/2)-.1
//    ])
//			holderBlock("c");
//		translate([(baseHolderWidth/2)-(fuseHolderWidth/2)-7,-(baseHolderDepth/2)+(fuseHolderDepth),(-(baseHolderHeight - fuseHolderHeight)/2)-.1])
//			holderBlock("c");
      boltHolesCorners();
		for(a = [[-1,0],[1,0]]){
			translate([																											// Center Hole
				a[0]*((baseHolderWidth/2)-(4/2)-blankHoleOffsetX),
				a[1]*((baseHolderDepth/2)-(4/2)-blankHoleOffsetY),
				-2])
				cylinder(d=boltHole, h=5, center=true);
			
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module holderBlock(inType="m"){

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
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
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

	plate2Point(slotWidth,30,headDiamitor);
	translate([0,0,-9])
		plate2Point(slotWidth-shaftDiamitor,20,shaftDiamitor);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module nuttSlot(){
	cube([7,20,3],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module boltHolesCorners(){
	for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([
			a[1]*((boltHolsWidth/2)),
			a[0]*((boltHolsDepth/2)),
			0])
			cylinder(d=boltHole, h=20, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cableSupport(){
  difference(){
    for(b=[1,-1]){
      hull(){
        translate([0,b*4.5,0])															// Strap Support
            rotate([0,90,0])
            cylinder(d=cableDiamiter*2, h=baseHolderWidth+18, center=true);
        translate([0,b*4.5,3])															// Strap Support
            rotate([0,90,0])
            cylinder(d=cableDiamiter*2, h=baseHolderWidth+18, center=true);
      }
    }
  	for(b=[1,-1]){
			translate([((baseHolderWidth/2)+5),b*4.5,5])					// Strap Cutout Top
				cube([4,10,10],center=true);
			translate([-((baseHolderWidth/2)+5),b*4.5,5])					// Strap Cutout Top
				cube([4,10,10],center=true);
      }
    }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cableSupportAdd(){
    translate([(                                                        // Center fuse seperator
       baseHolderWidth/2)-(fuseHolderWidth)-3,
      -(baseHolderDepth/2)+(fuseHolderDepth*2.5),
      (-(baseHolderHeight - fuseHolderHeight)/2)+.87
      ]) color("Chartreuse")
        cube([3,fuseHolderDepth+1,baseHolderHeight-4],center=true);
    translate([(
      baseHolderWidth/2)-(fuseHolderWidth/2)-7,
      -(baseHolderDepth/2)+(fuseHolderDepth)+1.6,
      (-(baseHolderHeight - fuseHolderHeight)/2)+.87
      ]) color("GreenYellow")
        cube([3,fuseHolderDepth+1,baseHolderHeight-4],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cableSupportDel(){
  for(a=[[1,3],[-1,-3]]){                                            // cable openings
		hull(){
			translate([0,a[0]*4.5,.5])
				rotate([0,90,0])
				cylinder(d=cableDiamiter, h=baseHolderWidth+20, center=true);
			translate([0,a[0]*4.5,5])
				rotate([0,90,0])
				cylinder(d=cableDiamiter, h=baseHolderWidth+20, center=true);
		}
 	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bottomFuseCutouts(){
  for(a=[[1,3],[-1,-3]]){                                             // Fuse cutouts
		translate([
      (baseHolderWidth/2)-(fuseHolderWidth)-a[1],
      a[0]*4.5,
      (-(baseHolderHeight - fuseHolderHeight)/2)+3
      ])
      holderBlock("c");
  }
}