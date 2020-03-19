$fn=30;

use <../library.scad>;

psWidth = 39;
psLength = 89;
psHeigth = 28;

M3SizeT = 3.2;
M3SizeS = 3.5;

//rotate([0,90,0]) psModel();

//translate([0,psLength/3,0]) arm();
//translate([0,-psLength/3,0]) 
//difference(){
arm();
//translate([1,0,-10]) cube([50,11,40],center=true);
//translate([10,0,10]) cube([40,11,50],center=true);
//}
//translate([0,-psHeigth-7,psHeigth+5.5]) bar();

////////////////////////////////////////////////////////////////////////////////////////////////////
module Holder(){


}
////////////////////////////////////////////////////////////////////////////////////////////////////
module arm(){

	addEnd = 6;
//color("red")	translate([-psHeigth-4,0,17.9]) cubeSphere(30, 10, 3.2, 3);        // Spacer
 	translate([-psHeigth-20,0,(psWidth/2)-1.7]) cubeSphere(3, 10, 9.3, 3); // Vir
	translate([-psHeigth-17.5,0,(psWidth/2)-4.8]) cubeSphere(8, 10, 3.2, 3);        // Hook
	
	

//color("red")
	translate([-28,0,(psWidth/2)+(3/2)]) cubeSphere(psHeigth+15, 10, 3, 3);
	
	translate([0,0,-(psWidth/2)-(3/2)]) cubeSphere(psHeigth+addEnd, 10, 3, 3);

	hull(){
		translate([-(psHeigth/2)-(3/2),0,0]) cubeSphere(3, 10, psWidth+addEnd, 3);
		translate([-(psHeigth/2),0,0]) cubeSphere(3, 10, psWidth+addEnd, 3);
	}

	

//	translate([(psHeigth/2)+(3/2)+3,0,0]) cubeSphere(3, 10, psWidth, 3);
	difference(){
		union(){
			difference(){
				union(){ 
					translate([6,0,(psWidth/2)+(3/2)]) cubeSphere(psHeigth+addEnd, 10, 3, 3);
					hull(){
						translate([-4,0,23]) cubeSphere(3, 10, 7, 3);
						translate([4,0,23]) cubeSphere(3, 10, 7, 3);
					}
				}
				translate([0,0,2.5]) cylinder(h=100, d=M3SizeT, center=true);
			}
//			translate([6,0,-(psWidth/2)-(3/2)]) cubeSphere(psHeigth+addEnd, 10, 3, 3);
//color("red")
			hull(){
				translate([(psHeigth/2)+(3/2)+1,0,17.5]) cubeSphere(3, 10, 10, 3);
				translate([(psHeigth/2)+(3/2)+8,0,17.5]) cubeSphere(3, 10, 10, 3);
			}
			hull(){
				translate([(psHeigth/2)+(3/2)+1,0,-17.5]) cubeSphere(3, 10, 10, 3);
				translate([(psHeigth/2)+(3/2)+8,0,-17.5]) cubeSphere(3, 10, 10, 3);
			}
		}
		translate([(psHeigth/2)+(3/2)+4,0,2.5]) cylinder(h=100, d=M3SizeS, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module bar(){
	difference(){
		rotate([0,-135,0]) triagleSphere(8, (psLength*2)-(psLength/3), 8, 3);
		translate([0,(psLength/3)+35,2]){
			cubeSphere(10, 10, 10, 3);
			cylinder(h=100, d=M3SizeS, center=true);
		}
		translate([0,-(psLength/3)+35,2]){ 
			cubeSphere(10, 10, 10, 3);
			cylinder(h=100, d=M3SizeS, center=true);
		}
	}
	difference(){
		translate([0,-(psLength)+(psLength/2),-9]) cubeSphere(10.3, psLength-(psLength/3), 9.5, 3);
		translate([0,-(psLength)+(psLength/3),-9]) rotate([90,0,90]) plate2Point(14,20,3);
		translate([0,-(psLength)+((psLength/3)*2),-9]) rotate([90,0,90]) plate2Point(14,20,3);
	}
	translate([0,-(psLength)+(psLength/2),-18]) rotate([0,-315,0]) triagleSphere(8, psLength-(psLength/3), 8, 3);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module psModel(){
	cubeSphere(psWidth, psLength, psHeigth, 3);
}
