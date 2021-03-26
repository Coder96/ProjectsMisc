$fn = 60;

difference(){
	union(){
		cylinder(d=150,h=8,center=true); // Bottom
		translate([0,0,48])
			cylinder(d1=150,d2=80,h=100,center=true);
	}
		
	translate([0,0,44])
		cylinder(d=75,h=80,center=true); // Center Removal
	
	cWidth = 35;
	
	translate([0,0,39])
		cube([200,cWidth,70],center=true); // Chanel Removal
	rotate([0,0,90])
		translate([0,0,39])
			cube([200,cWidth,70],center=true); // Chanel Removal
	
	translate([0,0,85])
		cube([100,100,30],center=true); // Top Removal
	
	// Little Channels
	CutoutLong();
	rotate([0,0,90])
		CutoutLong();
	translate([0,0,4])
		CutOutRigs(70);
	translate([0,0,4])
		CutOutRigs(62);
	translate([0,0,4])
		CutOutRigs(54);
	translate([0,0,4])
		CutOutRigs(46);

}

module CutOutRigs(iDiamiter){
	
	difference(){
		cylinder(d=iDiamiter,h=10,center=true); 	
		cylinder(d=iDiamiter-4,h=12,center=true); 
	}
}


module CutoutLong(){
	translate([0,0,4])
		cube([140,2,10],center=true); // Chanel Removal	
	translate([0,4,4])
		cube([140,2,10],center=true); // Chanel Removal	
	translate([0,-4,4])
		cube([140,2,10],center=true); // Chanel Removal
	translate([0,8,4])
		cube([140,2,10],center=true); // Chanel Removal	
	translate([0,-8,4])
		cube([140,2,10],center=true); // Chanel Removal
	translate([0,12,4])
		cube([140,2,10],center=true); // Chanel Removal	
	translate([0,-12,4])
		cube([140,2,10],center=true); // Chanel Removal
	
}
