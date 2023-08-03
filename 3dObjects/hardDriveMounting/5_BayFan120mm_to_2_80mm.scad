$fn = 60;

include<../../scadLib/library.scad>;

fan_120mm_FrameWidth = 120;
fan_80mm_FrameWidth = 80;

fan_120mm_mountingHoleWidth = 105;
fan_80mm_mountingHoleWidth  = 71.5;

fan_mounting_Hole_diamiter = 4.4;

fan_mounting_Plate_thick = 3;

topFanOfset = (fan_80mm_FrameWidth/2)+2;
botFanOfset =-(fan_80mm_FrameWidth/2)-2;

//#cube([200,10,10],center=true);

difference(){
  plate4Point(120,162,fan_mounting_Plate_thick,8);

  color("green")
    fanMountingHoles(fan_120mm_mountingHoleWidth);

  color("orange")
    translate([0,topFanOfset,0])
      fanMountingHoles(fan_80mm_mountingHoleWidth);
  color("SandyBrown")
    translate([0,botFanOfset,0])
      fanMountingHoles(fan_80mm_mountingHoleWidth);

  color("Aqua")
    translate([0,topFanOfset,0])
      cylinder(d=fan_80mm_mountingHoleWidth+1, h=fan_mounting_Plate_thick+1, center=true);
  color("navy")
    translate([0,botFanOfset,0])
      cylinder(d=fan_80mm_mountingHoleWidth+1, h=fan_mounting_Plate_thick+1, center=true);
//
// Remove material
//
  color("red")
    for(a = [[1,1],[1,-1],[-1,1],[-1,-1]]){
      translate([a[0]*((120/2)-12),a[1]*(25),0])
        rotate([0,0,90])
       plate2Point(40,fan_mounting_Plate_thick+1,15);
    }
  color("red")
    for(a = [[1,1],[1,-1],[-1,1],[-1,-1]]){
      translate([a[0]*((120/2)-13),a[1]*(120/2)+(a[1]*6),0])
        rotate([0,0,90])
        cylinder(d=20, h=fan_mounting_Plate_thick+1, center =true);
    }
}


module fanMountingHoles(i_holeSeperation){
  for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
    translate([a[0]*i_holeSeperation/2,a[1]*i_holeSeperation/2,0])
      cylinder(d=fan_mounting_Hole_diamiter, h =fan_mounting_Plate_thick+1,center=true);  
  }
}