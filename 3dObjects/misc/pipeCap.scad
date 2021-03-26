$fn = 60;

pipeOSD = 103;
pipeISD = 89;

capHeigth = 40;

//translate([0,-55,15]) cube([10,10,20],center=true);


difference(){
	translate([0,0,5]) cylinder(h=capHeigth,d=pipeOSD+5,center=true);
	color("RED")  pipeCuout();
	translate([0,40,-10]) cube([pipeOSD+10,pipeOSD,capHeigth],center=true);
	rotate([22,0,0]) translate([0,-80,0]) cube([pipeOSD+10,pipeOSD,capHeigth],center=true);
	translate([0,-85,-10]) cube([pipeOSD+10,pipeOSD,capHeigth],center=true);
	
	mirror([1,.65,0]) translate([0,-pipeOSD/2,0])	zipTieHole();
	mirror([1,-.65,0]) translate([0,-pipeOSD/2,0])	zipTieHole();
}

module pipeCuout(){
	difference(){
		cylinder(h=40, d=pipeOSD, center=true);
		translate([0,0,30]) cylinder(h=35, d=pipeISD, center=true);
	}
	cylinder(h=40, d=pipeISD -5, center=true);
}

module zipTieHole(){
	
	rotate([90,90,0]) scale([1.6,1,1]) cylinder(h=10, d=6, center=true);
	
}