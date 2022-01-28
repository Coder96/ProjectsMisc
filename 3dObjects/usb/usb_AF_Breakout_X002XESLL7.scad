$fn=30;

include<usb_BreakoutShared.scad>;



AF_boardModel();

//////////////////////////////////////
module AF_boardModel(){
  difference(){
    union(){
// Circit Board
      color("LimeGreen")
      cube([AF_boardLength, AF_boardWidth, AF_boardHeigth],center=true);
//  USB Connector
      translate([-AF_usbLength+AF_usbLengthOffset,0,(AF_usbHeigth/2)-(AF_usbHeigthOffset/2)])
        color("silver")
        cube([AF_usbLength, AF_usbWidth, AF_usbHeigth],center=true);
    }
// Mounting Holes
    AF_boardMounts();
  }
}
//////////////////////////////////////
module AF_boardMounts(){
  translate([(AF_boardLength/2)-((AF_boardBoltHoleDiamiter/2)+AF_boardBoltHoleFromBack),0,0])
    boardMountingHoles(AF_boardBoltHoleSperation,AF_boardBoltHoleDiamiter,AF_boardHeigth); 
}
//////////////////////////////////////
//////////////////////////////////////
