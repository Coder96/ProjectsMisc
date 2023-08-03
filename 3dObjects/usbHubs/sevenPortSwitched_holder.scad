$fn=60;

use<../../scadLib/library.scad>;

//translate([-10,0,0]) import("sevenPortSwitched.stl");

bodyWidth=157.35;
bodyDepth=43.53;
bodyHeigth=15.52;

topBumpMidFromBodyEdge=2;
topBumpMidWidth=152.45;
topBumpMidDepth=25.22;
topBumpMidHeigth=1;

topBumpTopFromMidEdge=2;
topBumpTopWidth=148.08;
topBumpTopDepth=20.69;
topBumpTopHeigth=3;

//botBumpWidth=; // from edge
//botBumpDepth=;
//botBumpHeigth=;

squareCornerX=(bodyWidth/2);
squareCornerY=31;
squareCornerZ=12.30;

baseCase();

module baseCase(){
//!  scale([1.01,1.01,1.01]) import("sevenPortSwitched.stl");


  wallwidth = 4;
  difference(){
    translate([0, 0, 0]) color("green")
      plate4Point(bodyWidth+wallwidth,bodyDepth+wallwidth,bodyHeigth+wallwidth,8);
    

    scale([3.5,1,1]) cylinder(d=bodyDepth-4, h=40, center=true);

    scale([1.01,1.01,1.01]) import("sevenPortSwitched.stl");
  // Virtical cut
    translate([0, 0, -.08])
      cube([bodyWidth-8,bodyDepth+10,bodyHeigth], center=true);
    translate([0, 0, 5])
      cube([bodyWidth-8,bodyDepth+10,bodyHeigth], center=true);

    translate([0, 0, -.08])
      cube([bodyWidth-8,bodyDepth+10,bodyHeigth], center=true);
    translate([0, 0, 5])
      cube([bodyWidth-8,bodyDepth+10,bodyHeigth], center=true);
  // Horizontal cut
    translate([0, 0, -.08])
      cube([bodyWidth+10,bodyDepth-8,bodyHeigth], center=true);
    translate([0, 0, 5])
      cube([bodyWidth+10,bodyDepth-8,bodyHeigth], center=true);

    translate([0, 0, -.08])
      cube([bodyWidth+10,bodyDepth-8,bodyHeigth], center=true);
    translate([0, 0, 5])
      cube([bodyWidth-8,bodyDepth-8,bodyHeigth], center=true);
  // Horizontal cut
    translate([-10, -10, -.08])
      cube([bodyWidth+10,bodyDepth-8,bodyHeigth], center=true);
    translate([-10, -10, 5])
      cube([bodyWidth-8,bodyDepth+10,bodyHeigth], center=true);
  //cut corners
    for(a = [[1,1],[1,-1],[-1,-1],[-1,1]]){
    
      translate([a[0]*(bodyWidth/2)-(6*a[0]), a[1]*(bodyDepth/2)-(6*a[1]), 5]) rotate([0,0,45])
        cube([10,10,bodyHeigth], center=true);
    }
    brDifferenece = -1;
    translate([-(bodyWidth/2)+brDifferenece, -(bodyDepth/2)+brDifferenece, -9]) rotate([0,0,-45]) color("green")
      cube([20,10,5], center=true);
    
  }
  brDifferenece = 4.7;
  translate([-(bodyWidth/2)+brDifferenece, -(bodyDepth/2)+brDifferenece, 0]) rotate([0,0,-45]) color("green")
    plate2Point(15.66,bodyHeigth+wallwidth,8);
  color("green")
  hull(){
    translate([-(bodyWidth/2)+brDifferenece, -(bodyDepth/2)+brDifferenece, ((bodyHeigth+wallwidth)/2)-1]) rotate([0,0,-45]) color("green")
    plate2Point(15.66,2,8);

    brDifferenece2 = 5.7;
    translate([-(bodyWidth/2)+brDifferenece2, -(bodyDepth/2)+brDifferenece2, ((bodyHeigth+wallwidth)/2)-1]) rotate([0,0,-45]) color("red")
      plate2Point(11.66,2,8);
  }
}


// Mid Bump
//translate([0, ((bodyDepth/2)-(topBumpMidDepth/2))-topBumpTopFromMidEdge, (bodyHeigth/2)+(topBumpTopHeigth/2)]) color("red")
//plate4Point(topBumpTopWidth,topBumpTopDepth,topBumpTopHeigth,8);