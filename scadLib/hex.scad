

hex(12);

module hex(iwidth,iCornerRad=1,iZ=2){
  hull(){
  for(a=[1:6]){
      rotate([0,0,60*a])
      translate([iwidth/2-iCornerRad,0,0])
      cylinder(r=iCornerRad,h=iZ,center=true);
    }
  }
} 
