//Pinball style fresnel LED insert
$fn=100;
//You can adjust the variables below
size=25;       //diameter of insert in mm
depth=5;     //depth of insert
face=1;         //thickness of front face
led=5.2;          //diameter of LED
stem=15;    //length of LED stem
difference(){
//main disk
cylinder(h=depth, d=size);
//internal cylinder
translate([0,0,face])  
cylinder(h=depth,d=size-2);
}
//concentric rings
for (i=[0:4:size-8]){
difference(){
cylinder(h=face+1, d=size-i-1.5);
cylinder(h=face+1.1, d=size-i-3.5);
}
}
//LED pillar
difference(){
cylinder(h=stem,d=led+2);
//led hole
translate([0,0,face])  
cylinder(h=stem+1,d=led);
}
