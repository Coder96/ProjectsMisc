//
// USB A Male
//
AM_boardLength=15.1;
AM_boardWidth=15.1;
AM_boardHeigth=1.6;

AM_usbLength=18.7;
AM_usbWidth=12.3;
AM_usbHeigth=4.47;
AM_usbLengthOffset=3.25;
AM_usbHeigthOffset=AM_boardHeigth;

AM_boardBoltHoleDiamiter=3.22;
AM_boardBoltHoleSperation=9.8;
AM_boardBoltHoleFromEdge=1.3;
AM_boardBoltHoleFromBack=4.5;
//
// USB A Female
//
AF_boardLength=17.1;
AF_boardWidth=17.1;
AF_boardHeigth=1.2;

AF_usbLength=14.16;
AF_usbWidth=13.2;
AF_usbHeigth=4.47;
AF_usbLengthOffset=7.0;
AF_usbHeigthOffset=-AF_boardHeigth;

AF_boardBoltHoleDiamiter=3.22;
AF_boardBoltHoleSperation=12.2;
AF_boardBoltHoleFromEdge=1.3;
AF_boardBoltHoleFromBack=4.25;
//////////////////////////////////////
module boardMountingHoles(iHoleSperation,iHoleDiamiter,iZ){
  for(a=[1,-1]){
    translate([0,a*(iHoleSperation/2),0])
      color("silver")
      boardMountingHole(iHoleDiamiter,iZ);
  }
}
//////////////////////////////////////
module boardMountingHole(iHoleDiamiter,iZ){
  rotate([0,0,90])
    cylinder(d=iHoleDiamiter,h=iZ+1,center=true);
}