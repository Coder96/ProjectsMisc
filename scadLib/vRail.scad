include<library.scad>;

$fn=30;

  vslotRailFiller_offSet=.2;
  
  vslotRailFiller_totalHeigth=1.85;
  vslotRailFiller_heigthCutBy=1.5;
  vslotRailFiller_vslotRailFiller_topWidth=6.2;
  vslotRailFiller_botWidth=9.55;


vslotRailTest();

////////////////////////////////////////////////////////////////////////////////////////////////////
module vslotRailTest(){
  difference(){
    union(){
      color("green") vslotRailFillerShort(15);
      translate([0,0,-1])
        plate4Point(20,20,2,4);
    }
    cylinder(d=4.2,h=10,center=true);
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
module vslotRailFillerShort(iLength){
  difference(){
    vslotRailFiller(iLength);
    translate([0,0,(vslotRailFiller_totalHeigth*1.5)-vslotRailFiller_heigthCutBy])
      cube([iLength,10,vslotRailFiller_totalHeigth],center=true);
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module vslotRailFiller(iLength){
  
  translate([0,0,(vslotRailFiller_totalHeigth/2)])
	hull(){
// Top
		translate([0,0,vslotRailFiller_totalHeigth/2])
      cube([iLength-4,6.2-vslotRailFiller_offSet,.001],center=true);
// Bot
		translate([0,0,-vslotRailFiller_totalHeigth/2])
			cube([iLength,vslotRailFiller_botWidth-vslotRailFiller_offSet,.001],center=true);
// vslotRailFiller_offSet
		translate([0,0,-(vslotRailFiller_totalHeigth/2)-vslotRailFiller_offSet])
			cube([iLength,vslotRailFiller_botWidth-vslotRailFiller_offSet,.001],center=true);
	}
}