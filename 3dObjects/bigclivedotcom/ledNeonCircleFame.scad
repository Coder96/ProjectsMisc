//LED neon circle frame
//Two main adjustable variables
thick=5;     //thickness of LED neon
diam=121; //diameter of circular frame
//More specialist variables
wall=1.2;    //wall thickness
height=6;   //depth of groove
$fn=100;    //circle segments
//Don't change variables below here
wl=wall*2;
thk=thick*2;
radius=diam/2;
difference(){
//main disk
cylinder(h=height+1, d=diam);
//central void
translate([0,0,-1])
cylinder(h=height+2, d=diam-thk-(wall*4));
//cable hole
translate([0,radius-wall-(thick/2),-1])
cylinder(h=height+2, d=thick-1);
difference(){
//channel groove outer dimension
translate([0,0,1])
cylinder(h=height+1, d=diam-wl);
//channel groove inner dimension
translate([0,0,-1])
cylinder(h=height+1, d=diam-wl-thk);
}
}
