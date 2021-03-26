$fn=60;

gCenterBoltCutout=4.2;
gcorneCutout=2; 

//translate([-2.5,15.35,12])rotate([90,0,0]) #import("../EM/43884119/cubeSocket.stl");


//OuterPlate();
//InnerPlate();
centerCollar();

/////////////////////////////////////
module InnerPlate(){
	difference(){
		basePlate();
		translate([(-75/2)-3, 0, 0])
			cutoutHalfSide();
		mirror([1, 1, 0])
		translate([(-75/2)-3, 0, 0])
			cutoutWideSide();
		mirror([1, 0, 0])
		translate([(-75/2)-3, 0, 0])
			cutoutDoubbleSide();
		cutoutCenterPost();
		cutoutCornerPosts();
	}
}
/////////////////////////////////////
module basePlate(){	
	cornerCutOffset=2;
	difference(){
// Base
		cube([75, 75, 4],center=true);
// corners
		for(a=[[1,1],[-1,1],[-1,-1],[1,-1]]){
			translate([
				a[1]*(75/2)+(a[1]*cornerCutOffset),
				a[0]*(75/2)+(a[0]*cornerCutOffset), 
				0])
				rotate([0, 0, 45])
				cube([20,20,5],center=true);
		}
	}
}
/////////////////////////////////////
module cutoutWideSide(){

	hull(){
		for(a=[[10,13],[-10,28],[-10,-28],[10,-13]]){
			translate([a[0], a[1], 0])
				cube([.1, .1, 5],center=true);
		}
	}
}
/////////////////////////////////////
module cutoutHalfSide(){

	hull(){
		for(a=[[10,6],[-10,21],[-10,-21],[10,-6]]){
			translate([a[0], a[1], 0])
				cube([.1, .1, 5],center=true);
		}
	}
}
/////////////////////////////////////
module cutoutDoubbleSide(){

	translate([0, 13, 0])
	hull(){
		for(a=[[10,5],[-10,20],[-10,-20],[10,-5]]){
			translate([a[0], a[1], 0])
				cube([.1, .1, 5],center=true);
		}
	}
	translate([0, -12, 0])
	hull(){
		for(a=[[10,6],[-10,21],[-10,-21],[10,-6]]){
			translate([a[0], a[1], 0])
				cube([.1, .1, 5],center=true);
		}
	}
}
/////////////////////////////////////
module cutoutCenterPost(){
	cylinder(d=gCenterBoltCutout,h=10,center=true);
}
/////////////////////////////////////
module cutoutCornerPosts(){
	cornerCutOffset=-9;
	for(a=[[1,1],[-1,1],[-1,-1],[1,-1]]){
		translate([
			a[1]*(75/2)+(a[1]*cornerCutOffset),
			a[0]*(75/2)+(a[0]*cornerCutOffset), 
			0])
			cylinder(d=gcorneCutout,h=10,center=true);
		}
}
/////////////////////////////////////
module OuterPlate(){
	difference(){
		basePlate();
		cutoutCenterPost();
		cutoutCornerPosts();
	}
}
/////////////////////////////////////
module centerCollar(){
	difference(){
		cylinder(d=gCenterBoltCutout+4,h=4,center=true);
		cutoutCenterPost();
		
	}
}
/////////////////////////////////////
/////////////////////////////////////
