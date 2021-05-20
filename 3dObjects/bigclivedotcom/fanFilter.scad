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


