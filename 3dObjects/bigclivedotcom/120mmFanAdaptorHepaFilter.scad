//120mm fan adaptor HEPA filter
$fn=100;
//You can adjust these four variables
//Primarily the filter hole diameter
screwhole=5;     //fan screw hole diameter (5)
filterhole=92;     //HEPA filter hole diameter
thickness=1.5;  //Thickness of plastic layer (1.5)
insert=10;          //Length of insert into filter (10)
//Do not adjust anything below here
cone=(120-filterhole)/1.5;
wall=thickness*2;
difference(){
union(){
//flange
translate([0,0,0])
cube([120,120,thickness]);
//taper to filter insert
translate([60,60,0])  
cylinder(h=cone,d1=120,d2=filterhole);
//filter insert
translate([60,60,cone])  
cylinder(h=insert,d=filterhole);
}
//taper to filter insert
translate([60,60,0])  
cylinder(h=cone,d1=116,d2=filterhole-wall);
//filter insert
translate([60,60,cone])  
cylinder(h=insert,d=filterhole-wall);
//fan attachment holes
translate([7.5,7.5,-1])  
cylinder(h=thickness+2,d=screwhole);
translate([7.5,112.5,-1])  
cylinder(h=thickness+2,d=screwhole);
translate([112.5,7.5,-1])  
cylinder(h=thickness+2,d=screwhole);
translate([112.5,112.5,-1])  
cylinder(h=thickness+2,d=screwhole);
}
