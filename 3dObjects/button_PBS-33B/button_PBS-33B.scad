$fn = 60;

buttonOD = 10;
buttoniD = 5.6;
buttonHeigth = 1.6;
//buttonHeigth = 2.6;

headOD   = 17.5;
headMD  = 14.83;
headID  = 11.8;
headHeigth = 5.5;

stepShaftOD  = 13.5; // 13.1
stepShaftHeigth = 2; // .6

threadOD = 12.2; //12 // M12x0.75
threadFD = 11.1; //11
threadHeigth = 7;

plugOD = 8.7;
plugHeigth = 2;

pinHeigth = 3.6;
pinWidth = 2.8;
pinDepth = 1;
pinSeperation = 4.6;

main("C");

////////////////////////////////////////////////////////////////////////////////////////////////////
module PBS_33B_Simple(){
	main("S");
}

////////////////////////////////////////////////////////////////////////////////////////////////////
module main(type){
	intersection(){
		union(){
			translate([0,0,stepShaftHeigth]) 
				head();
			translate([0,0,headHeigth+2.2]) 
				button();
			shaft();
			if(type == "C"){
				translate([0,0,(-threadHeigth)-(plugHeigth/2)]) 
					Plug();
			}
		}
		cube([20,20,30],center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module head(){
	difference(){
		intersection(){
			sphere(d=headOD,center=true);
			translate([0,0,headHeigth/2])
				cube([headOD,headOD,headHeigth],center=true);
		}
		cylinder(d=headID,h=headOD+1,center=true);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module button(){
	intersection(){
		cylinder(d=headID-.1,h=buttonHeigth+10,center=true); 
		button2();
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module button2(){
	intersection(){
		translate([0,0,-8])
			sphere(d=buttonOD+10,center=true);
		translate([0,0,buttonHeigth/2])
			cube([headID,headID,buttonHeigth],center=true);
	}
	translate([0,0,-buttonHeigth/2])
		cylinder(d=headID-.1,h=buttonHeigth,center=true); 
//	#cylinder(d=buttoniD,h=buttoniD+10,center=true); 
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module shaft(){
	translate([0,0,stepShaftHeigth/2])
		cylinder(d=stepShaftOD,h=stepShaftHeigth,center=true);
	translate([0,0,(stepShaftHeigth/2)-.1])
		cylinder(d=stepShaftOD,h=stepShaftHeigth,center=true);
	intersection(){
		translate([0,0,-threadHeigth/2]){
			intersection(){
				cylinder(d=threadOD,h=threadHeigth,center=true);
				cube([threadOD,threadFD,threadHeigth],center=true);
			}
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module Plug(){
	cylinder(d=plugOD,h=plugHeigth,center=true);
	for (a =[1,-1]){
		translate([0,a*(pinSeperation/2),-(pinHeigth/2)])
			cubeSphere(pinWidth,pinDepth,pinHeigth,1);
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module cubeSphere(iX, iYm, iZ, iD){

	edgeDiamitor = iD;
	
	hull(){
		for(a=[[1,1,1],[-1,1,1],[1,-1,1],[-1,-1,1],[1,1,-1],[-1,1,-1],[1,-1,-1],[-1,-1,-1]]){
			translate([
				a[0]*((iX/2) -(edgeDiamitor/2)), 
				a[1]*((iYm/2)-(edgeDiamitor/2)), 
				a[2]*((iZ/2) -(edgeDiamitor/2))]) sphere(d=edgeDiamitor);
		}
	}
}
