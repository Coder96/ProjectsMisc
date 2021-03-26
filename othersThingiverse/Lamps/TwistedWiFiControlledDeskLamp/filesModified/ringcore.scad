$fn=90;

difference(){
}

difference(){
  union(){
    translate([0,0,-23.5])
      import("../files/Core.stl");
//    ring(3,57,45); 
    ring(3,70,55); 
  }
//  translate([0,0,-1])
//    ring(5,72,56); 
//  cylinder(h=4,d=45,center=true);
  translate([0,0,-5])
    rotate([0,0,23])
    make_ring_of (31, 8)
    cylinder(h=10, r=2);
}

module ring(h=1,od = 10,id = 5,de = 0.1){
  difference() {
    cylinder(h=h, r=od/2);
    translate([0, 0, -de])
      cylinder(h=h+2*de, r=id/2);
  }
}
module make_ring_of (radius, count){
  for (a = [0: count -1]){
    angle = a * 360 /count;
    translate (radius * [sin(angle), -cos(angle), 0])
    rotate ([0, 0, angle])
      children ();
  }
}