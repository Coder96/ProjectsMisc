sphereSize = 100;

difference(){
translate([0,0,-90])
	sphere(sphereSize,10);

translate([0,0,sphereSize -(sphereSize/.50)] )
	cylinder(h = sphereSize*2, r=sphereSize,center=true);
	
translate([0,0,sphereSize -(sphereSize/.50)])
	cylinder(h=sphereSize*3, r=14, center=true);
	
translate([0,0,sphereSize-75])
	cylinder(h=sphereSize, r1=1, r2=50, center=true);

translate([0,0,sphereSize-60])
	cylinder(h=sphereSize, r1=1, r2=100, center=true);
	
translate([0,0,sphereSize-83])
	cylinder(h=sphereSize*.25, r1=1, r2=200, center=true);
}
difference(){
	translate([0,0,-12])
		cylinder(h=24, r=20, center=true);
	translate([0,0,sphereSize -(sphereSize/.50)])
		cylinder(h=sphereSize*3, r=14, center=true);
}