$fn=12;

boardDepth = 40;
boardWidth = 45;
boardHeigth = 10;

boardThickness = 2;

boardHoleDepth = boardDepth - 5;
boardHoleWidth = boardWidth - 5;
boardHolediamiter = 3;

baseDepth = boardDepth + 2;
baseWidth = boardWidth + 2;
baseHeigth = boardThickness + 2;

baseCornerDiameter = 4;

//% board();

translate([0,0,-baseHeigth/2])
	base();
//feet();


////////////////////////////////////////////////////////////////////////////////////////////////////
module board(){
	difference(){
		plate4Point(boardWidth,boardDepth,boardThickness,1);
		for(a=[[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([
				a[0] * boardHoleWidth/2,
				a[1] * boardHoleDepth/2,
				0
			])
				cylinder(h=5,center=true);
		}
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////
module base(){

	difference(){
		// 
		union(){
			plate4Point(baseWidth,baseDepth,baseHeigth,4);
			rotate([0,0,90]) 
				feet();
		}
		for(a=[[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([
				a[0] * boardHoleWidth/2,
				a[1] * boardHoleDepth/2,
				0
			])
				cylinder(h=5,d=boardHolediamiter-.5,center=true);
		}
		// Board cut out
		translate([0,0,baseHeigth-2.9]) plate4Point(boardWidth,boardDepth,boardThickness,1);
		// center cutout
		plate4Point(baseWidth-8,baseDepth-8,10,6);
	}

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module feet(){
	
	lenAdd = 12;
	footLen = baseWidth + lenAdd;
	
 for(a=[1, -1]){
	translate([a*(baseDepth/2) - a*2, 0, 0]) 
		difference(){
			plate2Point(footLen, baseHeigth,6);
			for(b=[1,-1]){
				translate([0, b*(footLen/2) - b*3, 0])
					cylinder(h=5,d=boardHolediamiter,center=true);
			}
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
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}