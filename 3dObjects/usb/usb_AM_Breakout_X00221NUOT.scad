$fn=30;

include<usb_BreakoutShared.scad>;

//////////////////////////////////////
module AM_boardModel(){
  difference(){
    union(){
// Circit Board
      color("LimeGreen")
      cube([AM_boardLength, AM_boardWidth, AM_boardHeigth],center=true);
//  USB Connector
      translate([-AM_usbLength+AM_usbLengthOffset,0,(AM_usbHeigth/2)-(AM_usbHeigthOffset/2)])
        color("silver")
        cube([AM_usbLength, AM_usbWidth, AM_usbHeigth],center=true);
    }
// Mounting Holes
    AM_boardMounts();
  }
}
//////////////////////////////////////
module AM_boardMounts(){
  translate([(AM_boardLength/2)-((AM_boardBoltHoleDiamiter/2)+AM_boardBoltHoleFromBack),0,0])
    boardMountingHoles(AM_boardBoltHoleSperation,AM_boardBoltHoleDiamiter,AM_boardHeigth);  
}
//////////////////////////////////////
//////////////////////////////////////
