$fn = 60;


totalHeigth = 140;


ID = 22.63;

OD = 25;

ringSd = 27.56;
ringSh = 1.76;

ringBd = 31.82;
ringBh = 2.39;

threadOD = 27.28;
tubeHeigth = totalHeigth-(OD/2);

difference(){
	union(){
	tube(OD);
		translate([0,0,((tubeHeigth/2)-(ringSh/2)-.315)-22.65]) bigRing();
		translate([0,0,((tubeHeigth/2)-(ringSh/2))-14.22]) smallRing();
	}
	tube(ID);
	translate([0,0,2]) tube(ID);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
module tube(idiamiter){
	cylinder(h=tubeHeigth, d=idiamiter,center=true);
	translate([0,0,(-tubeHeigth/2)]) sphere(d=idiamiter,center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bigRing(){
	hull(){
		cylinder(h=ringBh,d=OD,center=true);
		translate([0,0,-ringBh/2])
			cylinder(h=1.70,d=ringBd,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module smallRing(){
	hull(){
		cylinder(h=ringSh,d=OD,center=true);
		translate([0,0,-ringSh/2])
			cylinder(h=.1,d=ringSd,center=true);
	}
}
