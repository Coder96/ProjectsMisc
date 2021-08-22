 
$fn=60;

tearDrop();
translate([0,10,0])
tearDrop(5,10,false);

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