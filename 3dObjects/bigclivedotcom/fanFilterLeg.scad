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
