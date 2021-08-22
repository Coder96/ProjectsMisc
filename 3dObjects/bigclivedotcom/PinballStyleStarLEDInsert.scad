//Pinball style star LED insert
$fn=100;
//You can adjust the variables below
size=25;        //diameter of insert in mm
depth=5;        //depth of insert
face=1;         //thickness of front face
led=5.2;          //diameter of LED
stem=15;    //length of LED stem
//don't adjust anything below here
difference(){
union(){
difference(){
union(){
//main disk
cylinder(h=depth, d=size);
}
//internal cylinder
translate([0,0,face])  
cylinder(h=depth,d=size-2);
}
//star fins
for (i=[0:36:350])rotate([0, 0, i]){
translate([0,-.5,face])
cube([(size/2)-1,1,depth-face]);
}
//LED pillar
cylinder(h=stem,d=led+2);
}
//led hole
translate([0,0,face])  
cylinder(h=stem+1,d=led);
}
