$fn = 60;

beringDiamiter = 16;
screwDiamiter = 5;

screw3mm = 3.2;

//import("../../Downloads/2020extrusion_cap-nohole.stl");

translate([0,-40,0]) forkPlate(20, 4);
translate([0,40,0]) pinPlate(20, 4);
basePlate(20, 4);
////////////////////////////////////////////////////////////////////////////////////////////////////
module basePlate(isize, iwidth){
	Heigth = 10;
	difference(){
		union(){
			plate4Point(isize,isize,iwidth,iwidth);
			for(a=[0, 180]){
				rotate([0,0,a]){
					translate([-7.5,0,Heigth/2]) plate4Point(5,5.8,Heigth,1); // Arrow Tail
					hull(){
						translate([-5.3,0,Heigth/2]) plate4Point(1.7,5.4,Heigth,1); // Arrow Point
						translate([-5.7,0,Heigth/2]) plate4Point(1,7.8,Heigth,1); // Arrow Edge
					}
				}
			}
		}
		for(a=[0, 180]){
			rotate([0,0,a]){
				translate([-7,0,Heigth/2]) cylinder(d=3.3, h=Heigth*2,center=true);
				translate([-5,0,(Heigth/2)+(iwidth/2)]) cube([5,1,Heigth],center=true);
			}
		}
	}
	for(a=[0, 180]){
		rotate([0,0,a]){
			translate([-5.5,1.5,(Heigth/2)]) cube([1.5,1,Heigth],center=true);
			translate([-5.5,-1.5,(Heigth/2)]) cube([1.5,1,Heigth],center=true);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module pinPlate(isize, iwidth){
	difference(){
		union(){
			plate4Point(isize,isize,iwidth,iwidth);
			translate([0,0,iwidth+5]) resize([0,isize-8.3,0]) rotate([-90,0,0]) virticalMount(isize,iwidth);
		}
		translate([0,0,-iwidth-8]) cube([isize+1,isize+1,20],center=true);
//		translate([0,0,iwidth+4]) rotate([90,0,0]) cylinder(h=iwidth+10, d=screwDiamiter, center=true);
		translate([0,10,iwidth+8]) rotate([90,-90,0]) TearDrop((screwDiamiter/2)+.1, iwidth+20);
		for(a=[0,180]){
			rotate([0,0,a]){
				translate([-7,0,12]) screwCutOut(6, screw3mm+1.5,20);
			}
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module forkPlate(isize, iwidth){
	difference(){
		union(){
			plate4Point(isize,isize,iwidth,iwidth);
			translate([0,(isize/2)-2,iwidth+5]) rotate([-90,0,0]) virticalMount(isize,iwidth);
			translate([0,-(isize/2)+2,iwidth+5]) rotate([-90,0,0]) virticalMount(isize,iwidth);
		}
		translate([0,0,-iwidth-8]) cube([isize+1,isize+1,20],center=true);
//		translate([0,0,iwidth+8]) rotate([90,0,0]) cylinder(h=iwidth+20, d=screwDiamiter, center=true);
		translate([0,12,iwidth+8]) rotate([90,-90,0]) TearDrop(screwDiamiter/2, iwidth+20);
		for(a=[0,180]){
			rotate([0,0,a]){
				translate([-7,0,12]) screwCutOut(6, screw3mm+1.5,20);
			}
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module virticalMount(isize, iwidth){
	translate([0,(isize/2)-2,0]) plate4Point(isize,isize,iwidth,iwidth);
	cylinder(h=iwidth, d=isize, center=true);
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
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwCutOut(headDiamitor, shaftDiamitor, shaftLength){

	cylinder(h=shaftLength, d=headDiamitor, center=true);
	translate([0,0,-9])
		cylinder(h=shaftLength, d=shaftDiamitor, center=true);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module screwSlot(headDiamitor, shaftDiamitor, slotWidth){

	plate2Point(slotWidth,30,headDiamitor);
	translate([0,0,-9])
		plate2Point(slotWidth-shaftDiamitor,20,shaftDiamitor);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module nuttSlot(){
	cube([7,20,3],center=true);
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module TearDrop(radius, height) {
	translate([0,0,height/2]) {
		union() {
			cylinder(h=height,r=radius, center=true);
			intersection() {
				rotate(45,[0,0,1]) scale([1,1,1.01]) cube([2*radius,2*radius,height], center=true);
				translate([1.75*radius, 0, 0]) scale([1,1,1.01]) cube([2*radius,2*radius,height], center=true);
			}
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
