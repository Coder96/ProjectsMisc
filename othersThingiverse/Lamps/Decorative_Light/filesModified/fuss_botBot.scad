$fn=90;


difference(){
  import("../files/fuss.stl");

  translate([2,0,-5])
    cylinder(d=45,h=10,center=true);

  translate([-25,0,-5])
    cube([10,14,10],center=true);

}
//ring(2,57,20); 


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