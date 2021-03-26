
wallHeigth = 5;
boardHeight =  5;

boardDepth = 51;
boardWidth = 70;

depth = boardDepth + 4;
width = boardWidth + 4;

%translate([0,0,boardHeight+wallHeigth])  cube(size=[boardWidth,boardDepth,.5], center=true);

difference(){
	union(){
	
		translate([-(boardWidth/2)-2,-(boardDepth/2)-2,0]) 
			color([1,0,0]) 
		cube([width,depth,wallHeigth], center=false); // Outside wall
	
		translate([0,0,0]) 
			color([0,0,1]) 
			cube(size=[width+2,depth+2,1.5], center=true); // bottom plate

		pinWidth = 5;
		pinHeigth = boardHeight+2;
		pinDepth = 2;
		
		translate([-(width/2)+10,(depth/2)-2.5,wallHeigth])
			color([0,1,0])
			cube(size=[pinWidth,pinDepth,pinHeigth], center=false);
		
		translate([(width/2)-15,(depth/2)-2.5,wallHeigth]) 
			color([0,1,0]) 
			cube(size=[pinWidth,pinDepth,pinHeigth], center=false);
		
		translate([(width/2)-.4,0,wallHeigth])
			color([0,1,0]) 
			rotate(a=[0,0,90]) 
			cube(size=[pinWidth,pinDepth,pinHeigth], center=false);
		
		translate([0,-(depth/2)+.5,wallHeigth]) 
			color([0,1,0]) 
			cube(size=[pinWidth,pinDepth,pinHeigth], center=false);
		
		translate([-(width/2)+2.5,0,wallHeigth]) 
			color([0,1,0]) 
			rotate(a=[0,0,90]) 
			cube(size=[pinWidth,pinDepth,pinHeigth], center=false);

		//$fn=20;

		//translate([-7,9.2,0]) rotate(a=[0,90,0]) cylinder(h = 5, r=1, center=true);
		//translate([7,9.2,0]) rotate(a=[0,90,0]) cylinder(h = 5, r=1, center=true);
		//translate([-7,-9.2,0]) rotate(a=[0,90,0]) cylinder(h = 5, r=1, center=true);
		//translate([7,-9.2,0]) rotate(a=[0,90,0]) cylinder(h = 5, r=1, center=true);
	}
	
	union(){
		$fn=20;
		translate([-(boardWidth/2)+.5,-(boardDepth/2)+.5,1]) cube([width-5,depth-5,wallHeigth], center=false); // carve out box
		
		KeyHole((width/2)-15, (depth/2)-5);
		KeyHole(-(width/2)+15, (depth/2)-5);
		
		//translate([(width/2)-5,(depth/2)-5,-2])  cylinder(h = 5, r=1, center=true);
		
		barRad = .75;
		
		translate([0,(depth/2)-2.5 ,boardHeight+wallHeigth]) rotate(a=[0,90,0]) cylinder(h = width, r=barRad, center=true);
		translate([0,-(depth/2)+2.5,boardHeight+wallHeigth]) rotate(a=[0,90,0]) cylinder(h = width, r=barRad, center=true);
		translate([-(width/2)+2.5,0,boardHeight+wallHeigth]) rotate(a=[90,0,0]) cylinder(h = depth, r=barRad, center=true);
		translate([(width/2)-2.5,0 ,boardHeight+wallHeigth]) rotate(a=[90,0,0]) cylinder(h = depth, r=barRad, center=true);
	}
}

module KeyHole(iwidth, idepth){
		translate([iwidth,idepth-5,0])  cylinder(h = 5, r=2, center=true);
		translate([iwidth,idepth-6,0])  cylinder(h = 5, r=2, center=true);
		translate([iwidth,idepth-7,0])  cylinder(h = 5, r=2, center=true);
		translate([iwidth,idepth-9,0])  cylinder(h = 5, r=3.5, center=true);
}