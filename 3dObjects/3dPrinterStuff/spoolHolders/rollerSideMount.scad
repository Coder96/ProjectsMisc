use<../../../scadLib/honeycomb_mesh.scad>;
include<shared.scad>;


//rollerSideMountBaseCutOut();

rollerSideMountMesh();

/////////////////////////////////////////////
module rollerSideMountMesh(){
  difference(){
    rollerSideMountBase();
    translate([0,-.5,0])
      scale([0.95,0.9,1.2])
      rollerSideMountBaseNoangle();
  }
  //  Mesh
  intersection(){
  translate([0,0,-side_hc_offset/2])
    hexagonal_grid([sideTopCutoutX+10, sideTopCutoutY+10, side_hc_height], side_hc_diameter, side_hc_thickness);
    rollerSideMountBaseNoangle();
  }
}
/////////////////////////////////////////////
module rollerSideMountBase(){
  intersection(){
    rollerSideMountEdges();
    translate([0,-40])
      cylinder(d=100,h=gZ,center=true);
  }
}
/////////////////////////////////////////////
module rollerSideMountBaseNoangle(){
  intersection(){
    cube([sideTopCutoutX,sideTopCutoutY,gZ],center=true);
    translate([0,-40])
      cylinder(d=100,h=gZ,center=true);
  }
}
/////////////////////////////////////////////
module rollerSideMountBaseCutOut(){
  rollerSideMountEdges();
}
/////////////////////////////////////////////
module rollerSideMountEdges(){
  hull(){
    // sides
    translate([sideTopCutoutX/2,0,0])
      rollerSideountEdge();
    translate([-sideTopCutoutX/2,0,0])
      rollerSideountEdge();
    // bottom
    translate([0,-(sideTopCutoutX/2)+3,0])
      resize([sideTopCutoutY+5,0,0])
      rotate([0,0,90])
      rollerSideountEdge();
  }
}
/////////////////////////////////////////////
module rollerSideountEdge(){
  resize([4,0,0]) 
    rotate([0,45,0])
    cube([gZ,sideTopCutoutY-1,gZ],center=true);
}