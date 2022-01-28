include<../../scadLib/library.scad>;
use<../../scadLib/honeycomb_mesh.scad>;

$fn=30;

  baseMountWidth=180;
  baseMountDepth=80;
  baseMountThickness=4;
  baseMountCorner=4;
  
  baseMountCenterSeperation=152;
  baseMountCenter=5.5;
  baseMountCenterHead=8.5;
  baseMountCenterHeadDepth=2.0;
  
  circuitBoardMountHolesSeperation=134;
  circuitBoardMountHolesSize=4;
  circuitBoardMountPostDiamiter=circuitBoardMountHolesSize+2;
  circuitBoardMountPostDepthOffset=2.5;
  circuitBoardMountPostHeigth=4;

  difference(){
    union(){  
      base();
      circuitBoardMountPost(circuitBoardMountPostDiamiter,circuitBoardMountPostHeigth);
    }
      centerMountingHoles();
//       baseCutouts();
plate4Point(circuitBoardMountHolesSeperation-11,baseMountDepth-6,baseMountThickness+2,baseMountCorner);
    
        circuitBoardMountPost(3,circuitBoardMountPostHeigth+10);
  }
    hexagonal_grid([circuitBoardMountHolesSeperation-7,baseMountDepth-5,baseMountThickness], 10, 2);
 
////////////////////////////////////////////////////////////////////////////////////////////////////
module base(){
  difference(){
    translate([0,0,-baseMountThickness/2])
      cubeSphere(baseMountWidth,baseMountDepth,baseMountThickness*2,baseMountCorner);
    
    translate([0,0,-baseMountThickness])
      plate4Point(baseMountWidth+4,baseMountDepth+4,baseMountThickness,baseMountCorner);
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module baseCutouts(){
  for(a=[1,-1]){
    rotate([0,0,a*90]) 
      translate([(baseMountDepth/2)-3,0,0]) 
      triangleCutout2((baseMountDepth/2)-6, (circuitBoardMountHolesSeperation/2)-4);
  }
  
  for(a=[[0,0],[0,180],[180,0],[180,180]]){
    rotate([0,a[1],a[0]])
    translate([(circuitBoardMountHolesSeperation/2)-4,-3,0])
      triangleCutout((circuitBoardMountHolesSeperation/2)-16,(baseMountDepth/2)-13);
  }
  
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module centerMountingHoles(){
  for(a=[1,-1]){
    translate([a*(baseMountCenterSeperation/2),0,0])
      centerMountingHole();
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module centerMountingHole(){

  seperation = 6;

  hull(){
    for(a=[1,-1]){
      translate([a*(seperation/2),00]) 
        cylinder(d=baseMountCenter,h=baseMountThickness+2,center=true);
    }  
  }
  hull(){
    for(a=[1,-1]){
      translate([a*(seperation/2),0,baseMountThickness-baseMountCenterHeadDepth]) 
        cylinder(d=baseMountCenterHead,h=baseMountThickness,center=true);
    }  
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module circuitBoardMountPost(iDiamiter,iHeigth){
  for(a=[1,-1]){
    for(b=[1,-1]){
      translate([
        a*(circuitBoardMountHolesSeperation/2),
        b*(baseMountDepth/2)-b*(circuitBoardMountPostDiamiter/2)-b*circuitBoardMountPostDepthOffset,
        circuitBoardMountPostHeigth
      ])
      cylinder(d=iDiamiter,h=iHeigth,center=true);
      translate([
        a*(circuitBoardMountHolesSeperation/2),
        b*(baseMountDepth/2)-b*(circuitBoardMountPostDiamiter/2)-b*circuitBoardMountPostDepthOffset,
        circuitBoardMountPostHeigth-1
      ])
      cylinder(d=iDiamiter,h=iHeigth,center=true);
    }
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triangleCutout(iH,iW){
  rotate([90,0,0]) triagleSphere(iH, 10, iW, 4);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module triangleCutout2(iH,iW){
  translate([0,2,0]) rotate([90,0,0]) triagleSphere(iH, 10, iW, 4);
  translate([0,-2,0]) rotate([-90,0,0]) triagleSphere(iH, 10, iW, 4);  
}