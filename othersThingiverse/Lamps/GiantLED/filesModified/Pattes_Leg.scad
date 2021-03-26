$fn=10;

gHeigth=203;
gX=20;
gY=20;
gY2=31.8;

gFootX=4;
gWallthickness=3;

//translate([11+10,-300-17.35,-28])
// import("../files/Pattes.stl");

triagleCylinderE(10, 10, 1, 2);

//difference(){
// union(){
//  plate4Point(gX,gY,gHeigth,5); // Shaft
//  translate([0,0,(gHeigth/2)-(gFootX/2)])
//   cube([gX,gY2,gFootX],center=true); // Top foot
//  translate([0,0,-(gHeigth/2)+(gFootX/2)])
//   cube([gX,gY2,gFootX],center=true); // Bot foot
//  translate([0,0,33])
//   cube([gX,gY2,40],center=true); // Middle 
// }
// plate4Point(gX-gWallthickness,gY-gWallthickness,gHeigth+1,5); // Cutout Center
//} 
////////////////////////////////////////////////////////////////////////////////////////////////////
 module plate4Point(x,y,z,d){
 hull(){
  color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
	color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
	color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
 }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triagleCylinderE(iW, iY, iZ, iD){
 halfD = iD/2;
 halfW = iW/2;
// hull(){
  color("red")	 translate([halfW , 0, 0]) cylinder(d=iD,h=iZ,center=true);
  color("grey")	 translate([-halfW, 0, 0]) cylinder(d=iD,h=iZ,center=true);
  color("green") translate([0, 0, 0]) cylinder(d=iD,h=iZ,center=true);
	
//  color("grey")	 translate([-iX+halfD, (iY/2)-halfD, halfD]) sphere(d=iD);
//  color("green") translate([-halfD   , (iY/2)-halfD, iZ-halfD]) sphere(d=iD);

//  color("red")	 translate([-halfD   , -(iY/2)+halfD, halfD]) sphere(d=iD);
//  color("grey")	 translate([-iX+halfD, -(iY/2)+halfD, halfD]) sphere(d=iD);
//	color("green") translate([-halfD   , -(iY/2)+halfD, iZ-halfD]) sphere(d=iD);
// }
}
