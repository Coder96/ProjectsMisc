 
    ////////////////////////////////////////////////////////
    /*
    unionRound() Module by Torleif Ceder - TLC123 late summer 2021
     Pretty fast Union with radius, But limited to a subset of cases
    Usage 
     unionRound( radius , detail , epsilon )
        {
         YourObject();
         YourObject(); 
        } 
    limitations: 
     0. Only really fast when boolean operands are convex, 
            Minkowski is fast in that case. 
     1. Boolean operands may be concave but can only touch 
            in a single convex area
     2. Radius is of elliptic type and is only approximate r
            were operand intersect at perpendicular angle. 
    */
    //////////////////////////////////////////////////////// 
//  $fn=60;
    // Demo code
  unionRound(1, 15) {
    translate([2, 5, 5]) sphere(6);
    rotate([10, 20, 30]) cube(10, true);
  }
    // End of demo code

module unionRound(r, detail = 5) {
  epsilon = 1e-6;
  children(0);
  children(1);
  step = 1 / detail;
  for (i = [0: step: 1 - step]) {
    {
      x = r - sin(i * 90) * r;
      y = r - cos(i * 90) * r;
      xi = r - sin((i + step) * 90) * r;
      yi = r - cos((i + step) * 90) * r;
//            color(rands(0, 1, 3, i))
      hull() {
        intersection() {
          // shell(epsilon) 
          ur_clad(x) children(0);
          // shell(epsilon) 
          ur_clad(y) children(1);
        }
        intersection() {
          // shell(epsilon) 
          ur_clad(xi) children(0);
          // shell(epsilon) 
          ur_clad(yi) children(1);
        }
      }
    }
  }
}
// unionRound helper expand by r
module ur_clad(r) {
  minkowski() {
    children();
    //        icosphere(r,2);
    sphere(r, $fn = 19.5);
  }
}
// unionRound helper
module ur_shell(r) {
  difference() {
    ur_clad(r) children();
    children();
  }
}