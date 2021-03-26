$fn = 30;

//baseCutOut();

//difference(){
//  hexagon(60, 20);
//  baseCutOut(5,5,5);
//}

color("green") Tshape(5,5,5,2); // bottom T
translate([0, 16.65, 17.7]) rotate([-45,0,0]) Tshape(5,5,50,2); // shaft T
//translate([0, 34.35, 34.35]) rotate([-90,0,0]) color("green") Tshape(5,5,5,2); // top T


translate([0, 38, 36.9]) difference() { // ring
  cylinder(d=14, h=2, center=true);
  cylinder(d=6, h=4, center=true);
}

translate([0, 38, 35]) difference() { // support ring
  cylinder(d=10, h=5, center=true);
  cylinder(d=8, h=6, center=true);
}


module Tshape(w,d,h,t){
  cube([t,w,h],center=true);
  translate([0,-2.5,0]) rotate([0,0,90]) cube([t,w,h],center=true);
}

module baseCutOut(){
  // 48 mm Base
  color("RED") cylinder(d=50, h=11, center=true); // Round Base

  // 48 mm hex
  color("RED") translate([0,0,9]) hexagon(50, 12); // Hex base
}

// size is the XY plane size, height in Z
module hexagon(size, height) {
  boxWidth = size/1.75;
  for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}




//iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
