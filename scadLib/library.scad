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
module plate2Point(x,z,d){
	hull(){
		color("green") translate([(x/2) -(d/2),0 ,0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([-(x/2)+(d/2),0 ,0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triagleSphere(iX, iY, iZ, iD){
	
	halfD = iD/2;
	hull(){
		color("red")		translate([-halfD   , (iY/2)-halfD, halfD]) sphere(d=iD);	
		color("grey")		translate([-iX+halfD, (iY/2)-halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , (iY/2)-halfD, iZ-halfD]) sphere(d=iD);

		color("red")		translate([-halfD   , -(iY/2)+halfD, halfD]) sphere(d=iD);
		color("grey")		translate([-iX+halfD, -(iY/2)+halfD, halfD]) sphere(d=iD);
		color("green")	translate([-halfD   , -(iY/2)+halfD, iZ-halfD]) sphere(d=iD);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cubeSphere(iX, iYm, iZ, iD){

	edgeDiamitor = iD;
	
	hull(){
		for(a=[[1,1,1],[-1,1,1],[1,-1,1],[-1,-1,1],[1,1,-1],[-1,1,-1],[1,-1,-1],[-1,-1,-1]]){
			translate([
				a[0]*((iX/2) -(edgeDiamitor/2)), 
				a[1]*((iYm/2)-(edgeDiamitor/2)), 
				a[2]*((iZ/2) -(edgeDiamitor/2))]) sphere(d=edgeDiamitor);
		}
	}
} 
////////////////////////////////////////////////////////////////////////////////////////////////////
module mText(l, letter_size = 10, letter_height = 4) {
// Use linear_extrude() to make the letters 3D objects as they
// are only 2D shapes when only using text()
	font = "Bitstream Vera Sans:style=Bold" ;
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	}
}
module roundedTrapezoid(x1=1, y1=1,x2=1, y2=1, z1=1, d1=6){
  hull(){
  // top Right
    translate([-x1,y1,0])
      cylinder(h=z1,d=d1,center=true);
  // Top Left
    translate([-x1,-y1,0])
      cylinder(h=z1,d=d1,center=true);
  // Bottom Right
    translate([-x2,y2,0])
      cylinder(h=z1,d=d1,center=true);
  // Bottom Left
    translate([-x2,-y2,0])
      cylinder(h=z1,d=d1,center=true);
  }
}