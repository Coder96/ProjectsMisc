$fn=30;

include<../../../../scadLib/library.scad>

//
//translate([0,0,0]) rotate([-90,0,0])
//import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
//
//translate([-60,60,-14])
//import("SwitchPlateBracketRocker.stl");

tallwrapBack();
/////////////////////////////////////////////////////////
module tallBack(){
  import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
  translate([0,9,80])
    rotate([90,0,0])
      cubeSphere(40, 60, 2, 2);  
}
/////////////////////////////////////////////////////////
module tallwrapBack(){
  import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
  difference(){
    translate([0,0,50])
      import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
    translate([0,0,50])
      cube([70,25,6],center=true);
  }
}
/////////////////////////////////////////////////////////
module tallwrapBackCut(){
  import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
  difference(){
    translate([0,0,50])
      import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
    translate([0,0,50])
      cube([70,25,6],center=true);
    translate([0,-6,80])
      cube([70,25,60],center=true);
  }
}