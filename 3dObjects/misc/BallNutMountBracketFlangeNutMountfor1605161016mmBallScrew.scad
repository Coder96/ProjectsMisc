$fn = 30;

M5ShaftDiameter = 5.3;
M5HeadDiameter = 9.3;

M5ThreadInsertDiameter = 4.9;
M5ThreadInsertOutsideDiameter = 4.2;

difference(){
  cube([5,48,35],center=true); // block size
  blockMountHoles();

}

module blockMountHoles(width=38,heigth=22){
  translate([0,width/2,heigth/2]) screw5mm();
  translate([0,-width/2,heigth/2]) screw5mm();
  translate([0,width/2,-heigth/2]) screw5mm();
  translate([0,-width/2,-heigth/2]) screw5mm();
}

module screw5mm(){
	color("Green") rotate([0,90,0]) cylinder(d=M5ShaftDiameter,h=20,center=true);
  color("Green") translate([-5,0,0]) rotate([0,90,0]) cylinder(d=M5HeadDiameter,h=10,center=true);
}
