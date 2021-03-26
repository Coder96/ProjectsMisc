$fn = 60;

blankX = 202; // 190
blankY = 82;
blankZ = 30 ;

//color("green") rotate([0,0,90]) import("Wide_Filament_Spool_Holder.stl");

base();
//translate([0,0,(blankZ/2-1)])
// top();


module top(iClips="Y"){
	
	difference(){
		plate4Point(blankX-2.3,blankY-2.5,2,40);
		for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([a[0]*(blankX/6.2),a[1]*(blankY/3.4),-1])
			cylinder(d=3.5,h=blankZ,center=true);
		}
			for(x = [.0:.05:.7]){
				for(x2 = [1,-1]){
					translate([x2*x*(blankX/2),0,0])
						rotate([0,0,0])
						plate2Point(0,blankY-12,6,2);
				}
		}
		for(x = [.7:.05:.75]){
			for(x2 = [1,-1]){
				translate([x2*x*(blankX/2),0,0])
					plate2Point(0,blankY-60,6,2);
				for(y2 = [1,-1]){
					translate([x2*x*(blankX/2),y2*(blankY/2)-y2*(12),0])
						plate2Point(0,10,6,2);
				}
			}
		}
		for(x = [1,-1]){
			translate([x*.8*(blankX/2),0,0])
				plate2Point(0,blankY-16,6,2);
			translate([x*.85*(blankX/2),0,0])
				plate2Point(0,blankY-16,6,2);
			translate([x*.9*(blankX/2),0,0])
				plate2Point(0,blankY-22,6,2);
		}
	}
	for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
		translate([a[0]*(blankX/6.2),a[1]*(blankY/3.4),0])
		tube(10,3.5,2);
	}
	if(iClips == "Y"){
		for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
			for(a2 = [[2.81,3.8],[2.81,5.35],[2.65,4.2],[2.65,4.8]]){
				translate([a[0]*(blankX/a2[0]),a[1]*(blankY/a2[1]),2])
					plate2Point(0,4,5,2);
			}
		}
	}
}

module base(){

	difference(){
		plate4Point(blankX,blankY,blankZ,40);				// Outside
		translate([0,0,2])
			plate4Point(blankX-4,blankY-4,blankZ,40);	// Inside
		translate([0,0,(blankZ/2)-.5])
			plate4Point(blankX-2,blankY-2,3,40);			// Ledge
			
		for(x = [1,-1]){						// Short Side
			for(y = [.05:.1:.55]){
				for(y2 = [1,-1]){
					translate([x*(blankX/2),y2*y*(blankY/2),0])
						rotate([90,0,90])
						plate2Point(0,blankZ-8,6,2);
				}
			}
		}
		for(y = [1,-1]){						// Long Side
			for(x = [.00:.05:.9]){
				for(x2 = [1,-1]){
					translate([x2*x*(blankX/2),y*(blankY/2),0])
						rotate([90,0,0])
						plate2Point(0,blankZ-8,8,2);
				}
			}
		}
	}
	difference(){									// Center supports
		union(){
			for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
				translate([a[0]*(blankX/6.2),a[1]*(blankY/3.4),-1])
					tube(8,1,blankZ-2);
			}
			for(a = [1,-1]){
				translate([a*(blankX/6.2),0,-1])
					cube([2,blankY,blankZ-2],center=true);
			}
		}
		for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
			translate([a[0]*(blankX/6.2),a[1]*(blankY/3.4),-1])
			cylinder(d=2.9,h=blankZ,center=true);
		}
		for(x = [1,-1]){
			for(y = [.88,.8,.72,.45,.35,.25,.15,.05]){
				for(y2 = [1,-1]){
					translate([x*(blankX/6.2),y2*y*(blankY/2),0])
						rotate([90,0,90])
						plate2Point(0,blankZ-8,4,2);
				}
			}
		}
	}
	difference(){									// Outter supports
		union(){
			for(a = [[1,1],[-1,1],[1,-1],[-1,-1]]){
				translate([a[0]*(blankX/2.75),a[1]*(blankY/4.5),-1])
					tube(6,0,blankZ-2);
			}
			for(a = [1,-1]){
				translate([a*(blankX/2.75),0,-1])
					cube([2,blankY,blankZ-2],center=true);
			}
		}
		for(x = [1,-1]){
			for(y = [.88,.8,.72,.64,.56,.25,.15,.05]){
				for(y2 = [1,-1]){
					translate([x*(blankX/2.75),y2*y*(blankY/2),0])
						rotate([90,0,90])
						plate2Point(0,blankZ-8,4,2);
				}
			}
		}
	}
}

module plate2Point(x,y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}

module plate4Point(x,y,z,d){
	hull(){
		color("green") translate([(x/2)-(d/2) ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([(x/2)-(d/2) ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
		color("red")   translate([-(x/2)+(d/2),(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("grey")  translate([-(x/2)+(d/2),-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}


module screwCutOut(headDiamitor, shaftDiamitor){

	cylinder(h=10, d=headDiamitor, center=true);
	translate([0,0,-9])
		cylinder(h=10, d=shaftDiamitor, center=true);

}

module screwSlot(headDiamitor, shaftDiamitor, slotWidth){

	plate2Point(0,slotWidth,10,headDiamitor);
	translate([0,0,-9])
		plate2Point(0,slotWidth-shaftDiamitor,10,shaftDiamitor);

}

module boardBlank(){
	
	difference(){
		cube([blankX,blankY,blankZ],center=true);
		
		translate([((blankX/2)-2)-holeOffsetX,((blankY/2)-1)-holeOffsetY,0]) color("green")
			cylinder(h=10, d=4, center=true);
		
		mirror([90,0,0])
			translate([((blankX/2)-2)-holeOffsetX,((blankY/2)-1)-holeOffsetY,0]) color("green")
			cylinder(h=10, d=4, center=true);
		
		translate([((blankX/2)-2)-holeOffsetX,-(((blankY/2)-1)-holeOffsetY),0]) color("green")
			cylinder(h=10, d=4, center=true);
		
	mirror([90,0,0])
		translate([((blankX/2)-2)-holeOffsetX,-(((blankY/2)-1)-holeOffsetY),0]) color("green")
		cylinder(h=10, d=4, center=true);
	}
}

module triangle(o_len, a_len, depth){
    linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module tube(od, id, heigth){
	
	difference(){
		cylinder(h=heigth, d=od, center=true);
		cylinder(h=heigth+2, d=id, center=true);
	}
}