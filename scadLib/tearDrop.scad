
tearDrop();

translate([0,10,0])
tearDrop(5,10,false);

translate([0,20,0])
tearDropFlatBottom(16,10,16);


module tearDrop(iDiameter=5, iLength=10, iPoint=true){
difference(){
  hull(){
    rotate([0,90,0])
      cylinder(h=iLength, d=iDiameter, center=true);
    translate([0,0,iDiameter-(iDiameter/3)])
    rotate([0,90,0])
      cylinder(h=iLength, d=.1, center=true);
    }
    if(iPoint==false){
      translate([0,0,iDiameter])
        cube([iLength+2,iDiameter,iDiameter],center=true);
    }    
  }
}
///////////////////////////////////////////////////////////
module tearDropFlatBottom(iDiameter=5, iDepth=10,iHeigth=5, iPoint=true){
difference(){
  hull(){
    rotate([0,90,0])
      cylinder(h=iDepth, d=iDiameter, center=true);
    translate([0,0,iDiameter-(iDiameter/3)])
    rotate([0,90,0])
      cylinder(h=iDepth, d=.1, center=true);
    translate([0,0,-iHeigth/2.5])
      rotate([90,0,90])
      plate4Point(iDiameter,iHeigth,iDepth,4);
    }
    if(iPoint==false){
      translate([0,0,iDiameter])
        cube([iDepth+2,iDiameter,iDiameter],center=true);
    }
  }
}
///////////////////////////////////////////////////////////
module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}