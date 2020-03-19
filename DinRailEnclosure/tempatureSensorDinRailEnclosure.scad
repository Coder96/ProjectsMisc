$fn=12;


boxDepth = 40;
boxWidth = 80;
boxHeigth = 10;
wallThickness = 2;
wallCornerDiameter = 4;

//translate([0,0,5]) //color("blue")
//	top();

wall();

translate([0,0,-5]) color("green")
	base();




////////////////////////////////////////////////////////////////////////////////////////////////////
module top(){
	difference(){
		plateSphere(boxWidth, boxDepth, wallCornerDiameter);
		translate([0,0,-1])
			plate4Point(boxWidth+1, boxDepth+1, 2, wallCornerDiameter);
		for(a=[-1,1]){
			translate([boxWidth/4*a,0,0])
				rotate([0,0,90])
					GridHolesoffset(2,2,5,8,6);
		}
		translate([0,0,-12])
			screwHoles();

	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module wall(){
	difference(){
		plate4Point(boxWidth,boxDepth,boxHeigth,4);
		plate4Point(boxWidth-wallThickness,boxDepth-wallThickness,boxHeigth+wallThickness,wallCornerDiameter);
		// Long side holes
		for(a=[[-1,1],[1,-1],[-1,-1],[1,1]]){
			translate([-(boxWidth/4)*a[0],(boxDepth/2)*a[1],0])
				rotate([0,90,90])
				GridHolesoffset(2,2,wallThickness+1,2,7);
		}
		// Short side holes
		for(a=[-1,1]){
			translate([boxWidth/2*a,0,0])
				rotate([0,90,0])
				GridHolesoffset(2,2,wallThickness+1,2,7);
		}
			translate([0,0,-19])
			screwHoles();

	}
	cube([2,boxDepth,boxHeigth],true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module base(){
	difference(){
		union(){
//			translate([0,0,1])
//				rotate([180,0,90])
//				import("IRF520_Din_Rail_Mount_v2.stl");



			plate4Point(boxWidth,boxDepth,2,4);
		}
		translate([0,0,0])
			screwHoles();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwHoles(){
	shaftslip = 4;
	shaftThread = 3.5;
	holeOffset = 5;
	for(a=[[-1,1],[1,-1],[-1,-1],[1,1]]){
			translate([
				(-(boxWidth/2)*a[0])+(holeOffset*a[0]),
				(-(boxDepth/2)*a[1])+(holeOffset*a[1]),
				0]){
				translate([0,0,20])
					cylinder(d=shaftslip,h=20,center=true);
				cylinder(d=shaftThread,h=40,center=true);
				
			}
		}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plateSphere(iX, iYm, iD){

	edgeDiamitor = iD;
	
	hull(){
		for(a=[[1,1,1],[-1,1,1],[1,-1,1],[-1,-1,1],[1,1,-1],[-1,1,-1],[1,-1,-1],[-1,-1,-1]]){
			translate([
				a[0]*((iX/2) -(edgeDiamitor/2)), 
				a[1]*((iYm/2)-(edgeDiamitor/2)), 
				0]) sphere(d=edgeDiamitor);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Orginaly done by M_D_K 2019 https://www.thingiverse.com/thing:3645932
GridHolesoffset(3,4,2,2,10);
*/
module GridHolesoffset(holeDiameter,spaceBetweenHoles,thickness,colums,rows){
//	$fn=12;//increase results in longer render time
	hsp=holeDiameter+spaceBetweenHoles;
	q=cos(30);
	xa=(colums-1)*hsp*q+hsp;
	ya=(rows-.5)*hsp+hsp;
//	echo("xa", xa);
//	echo("ya", ya);
//	echo("grid size",xa,ya);
	union(){   
	translate([(-xa/2)-(-hsp/2),(-ya/2)-(-hsp/2),-(thickness/2)])
		for(j=[0:colums-1]){
			translate([hsp*j*q,(j%2)*0.5*hsp,0])
			for(i=[0:rows-1]){
				translate([0,i*hsp,0]) cylinder(d=holeDiameter,h=thickness);
			}
		}
	}
}
