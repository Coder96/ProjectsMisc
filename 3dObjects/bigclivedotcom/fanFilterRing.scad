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
