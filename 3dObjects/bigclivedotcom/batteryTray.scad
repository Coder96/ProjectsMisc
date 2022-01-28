//Custom battery tray - bigclivedotcom
$fn=50;
//You can adjust these variables.
width=4;            //number of horizontal cups
height=4;           //number of vertical cups
depth=10;          //internal depth of cups
diameter=15;    //diameter of cylinder AA=15 AAA=11
thickness=1;    //thickness of wall
base=1;             //thickness of cup bases
//don't adjust stuff below here
columns=width-1;
rows=height-1;
wall=thickness*2;
dia=diameter+thickness;
cup=depth+base;
difference(){
union(){
//main body
for (x=[0:columns]){
for (y=[0:rows]){ 
translate([x*dia,y*dia,0])  
cylinder(h=cup,d=diameter+wall);
}
}
}
//hollow cores
 for (x=[0:columns]){
 for (y=[0:rows]){ 
translate([x*dia,y*dia,base])  
cylinder(h=cup,d=diameter);
}
}
}
