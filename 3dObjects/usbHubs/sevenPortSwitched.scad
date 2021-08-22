$fn=60;

use<../../scadLib/library.scad>;

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

hull(){
  translate([
    (4/2)-(bodyWidth/2), 
    ((-4/2)+(bodyDepth/2))-15, // Top
    0]) color("GreenYellow") rotate([0, 0, 90])
    cylinder(h=bodyHeigth,d=4,center=true);
  translate([
    (4/2)-(bodyWidth/2), 
    ((-4/2)+(bodyDepth/2))-25, // Mid ********
    0]) color("Aqua") rotate([0, 0, 90])
    cylinder(h=bodyHeigth,d=4,center=true);
  translate([
    ((4/2)-(bodyWidth/2))+15, // bottom *********
    ((4/2)-(bodyDepth/2)), 
    0]) color("Fuchsia") rotate([0, 0, 90])
    cylinder(h=bodyHeigth,d=4,center=true);
translate([
    ((4/2)-(bodyWidth/2))+20, // bottom right
    ((4/2)-(bodyDepth/2)), 
    0]) color("DarkGreen") rotate([0, 0, 90])
    cylinder(h=bodyHeigth,d=4,center=true);
}


// Main body
difference(){
plate4Point(bodyWidth,bodyDepth,bodyHeigth,8);
// Cut corner out
  translate([4, 4, 0])
  translate([
    -bodyWidth/2, 
    -bodyDepth/2, 
    0]) color("blue")
    rotate([0, 0, 45])
    cube([14 ,40, bodyHeigth+2],center=true);
}
translate([
    ((4/2)-(bodyWidth/2))+20, // bottom right
    ((4/2)-(bodyDepth/2)), 
    0]) color("DarkGreen") rotate([0, 90, 0])
    cylinder(h=bodyHeigth+4,d=4,center=true);
// Square Corner
difference(){
  translate([
    (squareCornerX/2)-(bodyWidth/2), 
    (-squareCornerY/2)+(bodyDepth/2), 
    0]) color("orange")
    cube([squareCornerX ,squareCornerY, squareCornerZ],center=true);

  translate([
    -bodyWidth/2, 
    bodyDepth/2, 
    0]) color("blue")
    cube([10 ,20, squareCornerZ+2],center=true);
}

// Mid Bump
translate([0, ((bodyDepth/2)-(topBumpMidDepth/2))-topBumpMidFromBodyEdge, (bodyHeigth/2)+(topBumpMidHeigth/2)]) color("green")
plate4Point(topBumpMidWidth,topBumpMidDepth,topBumpMidHeigth,8);

// Mid Bump
translate([0, ((bodyDepth/2)-(topBumpMidDepth/2))-topBumpTopFromMidEdge, (bodyHeigth/2)+(topBumpTopHeigth/2)]) color("red")
plate4Point(topBumpTopWidth,topBumpTopDepth,topBumpTopHeigth,8);