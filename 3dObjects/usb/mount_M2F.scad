$fn=30;

use<usb_AM_Breakout_X00221NUOT.scad>;
use<usb_AF_Breakout_X002XESLL7.scad>;

include<usb_BreakoutShared.scad>;


translate([-11,0,0]){
  AF_boardModel();
  translate([0,0,-.5])
    AF_boardMounts();
translate([2.7,0,0])
      boardMountingHoles(AF_boardBoltHoleSperation,1,5);
}


translate([10,0,0]){
  rotate([0,0,180]){
    AM_boardModel();
    translate([0,0,-.5]){
      AM_boardMounts();

  }
}
translate([-1.5,0,0])
      boardMountingHoles(AM_boardBoltHoleSperation,1,5);

}


cylinder(d=3,h=5,center=true);



