

$fn=60;


topOutterDiamiter=19.42;
topInnerSize=19.5;
topHeigth=.35;

pinCenterHeigth=14.5;
pinCenterDiamiter=8;

pinSholderHeigth=5.002;
pinSholderDiamiter=10.3;

difference(){
  translate([0,0,2.5])
  rotate([0,90,0])
    pinWhole();

  translate([0,0,-25])
  cube([50,50,50],center=true);
}
////////////////////////////////////////////////////////////////////////////////
module pinWhole(){
  pinMod();
  top();  
}
////////////////////////////////////////////////////////////////////////////////
module pinMod(){
  difference(){
    union(){
      centerPin();
      sholderPin();
    }
    hull(){
      translate([0,0,4])
        rotate([0,90,0])
        cylinder(h=topOutterDiamiter,d=2,center=true);

      translate([0,0,pinCenterHeigth])
        rotate([0,90,0])
        cylinder(h=topOutterDiamiter,d=2,center=true);
    }
    translate([0,0,(-pinCenterHeigth/2)-1])
      cylinder(h=topOutterDiamiter,d=topOutterDiamiter+.2,center=true);
  }
}
////////////////////////////////////////////////////////////////////////////////
module centerPin(){
color("orange")
  hull(){
    cylinder(h=pinCenterHeigth*2,d=pinCenterDiamiter-2,center=true);    // Inner
    cylinder(h=(pinCenterHeigth*2)-2,d=pinCenterDiamiter,center=true);  // Outter
  }
}
////////////////////////////////////////////////////////////////////////////////
module sholderPin(){
color("red")
  hull(){
    cylinder(h=pinSholderHeigth*2,d=pinSholderDiamiter-.6,center=true);    // Inner
    cylinder(h=(pinSholderHeigth*2)-.6,d=pinSholderDiamiter,center=true);  // Outter
  }
}
////////////////////////////////////////////////////////////////////////////////
module top(){
  translate([0,0,1+topHeigth])
    color("CadetBlue")
    hull(){
      cylinder(h=topHeigth*2,d=topOutterDiamiter,center=true);  // Outter

      translate([0,0,.65])
      cylinder(h=.01,d=topOutterDiamiter-.6,center=true);  // Inner Bottom

      translate([0,0,-1-topHeigth])
      cylinder(h=.01,d=topOutterDiamiter-2,center=true);  // Inner Top
    }
}




