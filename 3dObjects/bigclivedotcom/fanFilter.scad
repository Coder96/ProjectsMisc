//MKII adaptor for 120mm fan
$fn=100;
//You can adjust the two variables below
depth=40;       //depth of air chamber (40)
hole=4;             //fan screw holes (4)
difference(){
union(){
//baseplate
hull() {
for (i=[0:90:330])rotate([0, 0, i]){
translate([74,0,0])
cylinder(h=1.5, d1=15, d2=15);
}
}
//Main outer cylinder
cylinder(h=depth, d1=120, d2=120);
}
//internal cylinder
translate([0,0,-1])  
cylinder(h=depth+2,d1=118,d2=118);
//screw holes
for (i=[0:90:330])rotate([0, 0, i]){
translate([74.5,0,-1])
cylinder(h=4, d1=hole, d2=hole);
}
    }


The second script is for the top platen for the filter paper.

//MK3 platen for filter paper on 120mm fan
$fn=100;
//You can adjust the variables below
depth=10;       //depth of lip and fins (10)
platen=1.5;     //thickness of platen (1.5)
//don't adjust anything below here
hole=platen+2;
difference(){
union(){
//platen
cylinder(h=platen, d1=140, d2=140);
//Main outer cylinder
cylinder(h=depth+platen, d1=118, d2=118);
}
//internal cylinder
translate([0,0,platen])  
cylinder(h=depth+platen,d1=116,d2=116);
//filter hole pattern
for (i=[0:45:330])rotate([0, 0, i]){
translate([35,0,-1])
cylinder(h=hole, d1=20, d2=20);
translate([16,0,-1])
cylinder(h=hole, d1=10, d2=10);
}
for (i=[22.5:45:350])rotate([0, 0, i]){
translate([24,0,-1])
cylinder(h=hole, d1=10, d2=10);
translate([41,0,-1])
cylinder(h=hole, d1=10, d2=10);
translate([32.5,0,-1])
cylinder(h=hole, d1=5, d2=5);
}
translate([0,0,-1])
cylinder(h=hole, d1=20, d2=20);
    }
//anti turbulence fins
    difference(){
        for (i=[0:45:330])rotate([0, 0, i]){
translate([46,-0.5,0])
cube([12,1,depth+platen]);
}
}



The third script is for the feet.  You will need to print four of them.

//MKII leg for 120mm fan
$fn=100;
//You can adjust the two variables below
depth=50;       //height of leg
hole=4;             //screw holes
difference(){
union(){
//Main outer cylinder
cylinder(h=depth, d1=12, d2=12);
}
//internal cylinder
translate([0,0,2])  
cylinder(h=depth+2,d1=10,d2=8);
translate([0,0,-1])  
cylinder(h=4,d1=hole,d2=hole);
translate([0,0,depth-1])  
cylinder(h=2,d1=10,d2=10);
}
    

The last script is for the weighted paper ring if desired.

//Weighted ring for paper
$fn=100;
//The variables below can be adjusted if desired
depth=2;       //depth (weight) of ring
inner=100;       //inner hole diameter of ring
outer=140;      //outer diameter of ring
difference(){
union(){
//main disk
cylinder(h=depth, d1=outer, d2=outer);
}
//hole in middle
translate([0,0,-1])  
cylinder(h=depth+2,d1=inner,d2=inner);
}
