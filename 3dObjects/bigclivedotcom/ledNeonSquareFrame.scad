//LED neon square frame
//Adjust these main variables to suit
thick=5;     //thickness of LED neon strip
width=100; //width of frame
//More specialist variables
height=6;   //depth of groove
wall=1.2;    //wall thickness
curve=20;  //corner outer radius
$fn=100;    //circle segments
//Don't change variables below here
wl=wall*2;
crv=curve*2;
thk=thick*2;
crz=(width/2)-curve;
difference(){
//main frame
hull() {
translate([-crz,crz,0])
cylinder(h=height+1, d=crv);
translate([crz,crz,0])
cylinder(h=height+1, d=crv);
translate([-crz,-crz,0])
cylinder(h=height+1, d=crv);
translate([crz,-crz,0])
cylinder(h=height+1, d=crv);
}
//central void
hull() {
translate([-crz,crz,-1])
cylinder(h=height+3, d=crv-wl-wl-thk);
translate([crz,crz,-1])
cylinder(h=height+3, d=crv-wl-wl-thk);
translate([-crz,-crz,-1])
cylinder(h=height+3, d=crv-wl-wl-thk);
translate([crz,-crz,-1])
cylinder(h=height+3, d=crv-wl-wl-thk);
}
//cable hole
translate([0,(width/2)-wall-(thick/2),-1])
cylinder(h=height+2, d=thick-1);
difference(){
//channel groove outer
hull() {
translate([-crz,crz,1])
cylinder(h=height+1, d=crv-wl);
translate([crz,crz,1])
cylinder(h=height+1, d=crv-wl);
translate([-crz,-crz,1])
cylinder(h=height+1, d=crv-wl);
translate([crz,-crz,1])
cylinder(h=height+1, d=crv-wl);
}
//channel groove inner
hull() {
translate([-crz,crz,1])
cylinder(h=height+1, d=crv-wl-thk);
translate([crz,crz,1])
cylinder(h=height+1, d=crv-wl-thk);
translate([-crz,-crz,1])
cylinder(h=height+1, d=crv-wl-thk);
translate([crz,-crz,1])
cylinder(h=height+1, d=crv-wl-thk);
}
}
}
