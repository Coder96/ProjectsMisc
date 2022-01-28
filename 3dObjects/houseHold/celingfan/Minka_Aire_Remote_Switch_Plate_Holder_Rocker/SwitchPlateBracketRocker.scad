$fn=30;

include<../../../../scadLib/library.scad>
include<../../../../scadLib/edgeTools/corner_tools.scad>

//import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Switch_Plate_Bracket.stl");
//
//translate([60,-60,14]) rotate([-90,0,0])
//import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Fan_Remote_Bucket.stl");
//

mountHolesSeperation=96.8;
mountHolesSeperationSmall=60.1;

openingWidth=33.2;
openingHeigth=66.8;

//#mesureMents();s

difference(){
  union(){
    difference(){
      union(){
        translate([0,(-mountHolesSeperation/2),0])
          import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Switch_Plate_Bracket.stl");
        translate([0,(-mountHolesSeperation/2)+(mountHolesSeperation-mountHolesSeperationSmall),0])
          import("../Minka_Aire_Remote_Switch_Plate_Holder/files/Switch_Plate_Bracket.stl");
      }
      translate([16.4,0,0]) 
        plate4Point(openingWidth,openingHeigth-31,10,4);
    }
    hull(){
      translate([31,0,2])
      rotate([90,0,0])
      cylinder(h=36,d=2,center=true);

      translate([36,0,2])
      rotate([90,0,0])
      cylinder(h=36,d=2,center=true);

      translate([31.11,0,0])
      rotate([90,45,0])
      translate([-1,0,0])
      cube([1,1,36],center=true);

      translate([36.11,0,.5])
      rotate([90,0,0]) 
      cube([1,1,36],center=true);
    }
  }
    plate4Point(openingWidth,openingHeigth-24,10,4);
    translate([13.4,0,0]) 
      plate4Point(openingWidth,openingHeigth-24,10,4);
    
}

module mesureMents(){
  translate([0,mountHolesSeperation/2,0])
    cylinder(h=.10,d=3,center=true);
  translate([0,-mountHolesSeperation/2,0])
    cylinder(h=.1,d=3,center=true);
  plate4Point(openingWidth,openingHeigth,4,4);
}