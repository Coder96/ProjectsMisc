module smooth_concave(r=1,fn=$fn)
{
  difference()
  {
    cube(1000-3*r,center=true);
    minkowski()
    {
      difference()
      {
        cube(1000,center=true);
        minkowski()
        {
          children();
          sphere(r=r,$fn=fn);
        }
      }
      sphere(r=r,$fn=fn);
    }
  }
}

module smooth_convex(r=1,fn=$fn)
{
  minkowski()
  {
    difference()
    {
      cube(1000-3*r,center=true);
      minkowski()
      {
        difference()
        {
          cube(1000,center=true);
          children();
        }
        cube(2*r,center=true);
      }
    }
    sphere(r=r,$fn=fn);
  }
}

module smooth(r=1,fn=$fn)
{
  smooth_concave(r,fn)
    smooth_convex(r,fn)
      children();
}



module o()
{
  cube(10,center=true);
  cube([3,3,20],center=true);
}


$fn=12;
translate([-6,0,0])
  smooth_concave()
    o();
translate([6,0,0])
  smooth_convex()
    o();
translate([18,0,0])
  smooth()
    o();
