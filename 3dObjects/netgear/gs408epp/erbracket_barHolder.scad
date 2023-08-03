$fn=30;
use<../../../scadLib/library.scad>;

boxWidth  = 380;
boxDepth  = 100;
boxHeigth = 43.2;

boxEarWidth  = 52;
boxEarDepth  = 39.3;
boxEarHeigth = 43.2;
boxEarThick  = 2.15;

boxEarMountDiamiter  = 4.5;
boxEarMountSperation = 15;

boxEarMountWidth  = 11;
boxEarMountHeigth = 7.3;
boxEarMountEdgeW  = 3.5;
boxEarMountEdgeH  = 2.2;


fromClampToBarCenter = 77;
barDiamiter = 10.6;

fromClampToPowerCord = 16;

wallThickness = 3;
outterCornerDiamiter = barDiamiter+wallThickness*2;


//ngBox();
// Cord
// translate([0,-fromClampToPowerCord,0]) rotate([0,90,0]) cylinder(h=100, d=6, center=true);
difference(){
  translate([0,30,0])
    mountCutEarSlot();
   translate([-10,0,0])
    slatCut();
//  translate([20,0,0]) mirror([90,0,0])
//   slatCut();
}
//----------------------------------------------------------------------------
module slatCut(){
  hull(){
    rotate([0,0,5])
      cube([10,100,100],center=true); 
    translate([-25,0,0])
      rotate([0,0,5])
      cube([10,100,100],center=true); 
  }    
}
//----------------------------------------------------------------------------
module mountCutEarSlot(){
  difference(){
   mount();
   translate([0,.25,0])
    translate([0,(boxEarDepth/2)-(boxEarThick/2),0]) color("green") scale([1,1,1.02]) ngBoxEar();
   translate([0,-.25,0])
    translate([0,(boxEarDepth/2)-(boxEarThick/2),0]) color("green") scale([1,1,1.02]) ngBoxEar();
  }
}
//----------------------------------------------------------------------------
module mount(){
  translate([0,-(fromClampToBarCenter/2)+(outterCornerDiamiter/2)-(wallThickness),0]) rotate([0,90,0])
    difference(){
      plate4Point(
        boxEarHeigth+(outterCornerDiamiter),
        fromClampToBarCenter+(outterCornerDiamiter/2),
        boxEarWidth-10,
        outterCornerDiamiter);
      plate4Point(
        boxEarHeigth+(outterCornerDiamiter)-wallThickness*2,
        fromClampToBarCenter+(outterCornerDiamiter/2)-wallThickness*2,
        boxEarHeigth+1,outterCornerDiamiter-6);
    }
  for(a=[1,-1]){
    translate([0,0,a*(boxEarHeigth/2)]) rotate([0,90,0])
      cylinder(d=outterCornerDiamiter, h=boxEarWidth-10, center=true);
  }
  translate([
    0,
    -(fromClampToBarCenter)+(outterCornerDiamiter/2)+(wallThickness/2)-.5,
    (boxEarHeigth/2)]) rotate([0,90,0]) color("orange")
    barMount(boxEarWidth-10);
}
//----------------------------------------------------------------------------
module barMount(iLen){
  difference(){
    cylinder(d=outterCornerDiamiter, h=iLen, center=true);
    cylinder(d=barDiamiter, h=iLen+2, center=true);
  }
}
//----------------------------------------------------------------------------
module ngBox(iShowEars=False){
  
  cube([boxWidth,boxDepth,boxHeigth],center=true);
  
}

//----------------------------------------------------------------------------
module ngBoxEar(){
  difference(){
    cube([boxEarWidth,boxEarDepth,boxEarHeigth],center=true);

    translate([boxEarThick,boxEarThick,0])
      cube([boxEarWidth,boxEarDepth,boxEarHeigth+1],center=true);
    for(a=[[1,1],[1,-1],[-1,1],[-1,-1]]){
      rotate([0,90,0])
      translate([a[0]*boxEarMountSperation/2,a[1]*boxEarMountSperation/2,0])
        cylinder(d=boxEarMountDiamiter,h=boxEarWidth+2,center=true);
    }
    /*
    for(c=[1,-1]){
      translate([
        (boxEarWidth/2)-(boxEarMountWidth/2)-(boxEarMountEdgeW),
        0,
        c*((boxEarHeigth/2)-(boxEarMountHeigth/2)-(boxEarMountEdgeH))])
      hull(){
        for(b=[1,-1]){
          rotate([90,0,0])
          translate([b*((boxEarMountHeigth/2)-(boxEarMountHeigth)),0,0])
            cylinder(d=boxEarMountHeigth,h=boxEarDepth+2,center=true);
        }
      }
    }*/
  }
}






