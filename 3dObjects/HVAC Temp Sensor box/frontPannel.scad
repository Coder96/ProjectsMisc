$fn = 30;

module coverCutouts(){
	
	color("Blue") translate([0, 25,0]) thermostatCutout();
	color("Blue") translate([0,-25,0]) thermostatCutout();

	color("Red") translate([50,25,-1]) switchCutout();

	color("Green") translate([55,-20,0]) buttonCutout();
}

module switchCutout(){
	cube([14,23.5,8.1],center=true);	//	Body
	translate([0,0,7.5]) cube([5.6,12.5,10],center=true);	//	Switch
	translate([0,0,-7.5]) cube([9,19,8],center=true);	//	Legs
}

module switchStudCutout(){
	cube([6, 8, 10],center=true);
	color("Cyan") translate([ 3, 4,0]) cylinder(h=10,d=3,center=true);			//	upper right
	color("Lime") translate([ 3,-4,0]) cylinder(h=10,d=3,center=true);			//	upper left
	color("Cyan") translate([-3, 4,0]) cylinder(h=10,d=3,center=true);			//	lower right
	color("Peru") translate([-3,-4,0]) cylinder(h=10,d=3,center=true);			//	lower left
}

module buttonCutout(){
	cylinder(40,d=31,center=true);			//	Barrel
	translate([0,0,15]) cylinder(9,d=34,center=true);		//	Lip
}

module thermostatCutout(){
	cube([45.5, 26, 17],center=true);	//	Body
	translate([0,0,7]) cube([52, 32, 3],center=true);	//	Lip
}

module switchKnob(){

//			color("Purple") translate([0,15,6.5]) rotate([0, 90, 0]) cylinder(h=13,d=2,center=true);			//	upper 
//			color("Silver") translate([0,-15,6.5]) rotate([0, 90, 0]) cylinder(h=13,d=2,center=true);			//	lower 


//	}
	difference(){
		union(){
			hull(){
				color("Cyan") translate([-6.5,15,0])  cylinder(h=13,d=2,center=true);			//	upper right
				color("Lime") translate([ 6.5,15,0])  cylinder(h=13,d=2,center=true);			//	upper left
				color("Cyan") translate([-6.5,15,6.5])  sphere(d=2,center=true);			//	upper right
				color("Lime") translate([ 6.5,15,6.5])  sphere(d=2,center=true);			//	upper left
			}
			hull(){
				color("Cyan") translate([-6.5,15,0])  cylinder(h=13,d=2,center=true);			//	lower right
				color("Peru") translate([-6.5,-15,0]) cylinder(h=13,d=2,center=true);			//	lower left
				color("Cyan") translate([-6.5,15,6.5])  sphere(d=2,center=true);			//	upper right
				color("Peru") translate([-6.5,-15,6.5]) sphere(d=2,center=true);			//	lower left
			}
				hull(){
				color("Lime") translate([ 6.5,15,0])  cylinder(h=13,d=2,center=true);			//	upper left
				color("Plum") translate([6.5,-15,0])  cylinder(h=13,d=2,center=true);			//	lower right
				color("Lime") translate([ 6.5,15,6.5])  sphere(d=2,center=true);			//	upper left
				color("Plum") translate([6.5,-15,6.5])  sphere(d=2,center=true);			//	lower right
			}
			hull(){
				color("Plum") translate([6.5,-15,0])  cylinder(h=13,d=2,center=true);			//	lower right
				color("Peru") translate([-6.5,-15,0]) cylinder(h=13,d=2,center=true);			//	lower left
				color("Plum") translate([6.5,-15,6.5])  sphere(d=2,center=true);			//	lower right
				color("Peru") translate([-6.5,-15,6.5]) sphere(d=2,center=true);			//	lower left
			}
		
	translate([0,0,0]) cube([14, 31.5, 14],center=true);
		}
		translate([0,0,24.4]) rotate([0,90,0]) cylinder(h=16,d=44.8,center=true, $fn = 90);
		color("Red") translate([0,0,-4]) switchStudCutout();
		
		translate([0,0,2.9]) rotate([0,90,0]) cylinder(h=33,d=3,center=true);			//
		
		translate([0, 7,4]) rotate([0,90,0]) cylinder(h=33,d=3,center=true);			//
		translate([0,-7,4]) rotate([0,90,0]) cylinder(h=33,d=3,center=true);			//
		
		
		
		}
}


module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	letter_height = 4;
	letter_size = 10;
	font = "Bitstream Vera Sans:style=Bold" ;
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	}
}

enclosure_inner_length = 120;
enclosure_inner_width = 105;
enclosure_inner_depth = 50;

enclosure_thickness = 2;

cover_thickness = 3;

part = "cover"; // [enclosure:Enclosure, cover:Cover, both:Enclosure and Cover, switchKnob:Switch Knob]






if ((part == "cover")||(part == "both")) {
	difference(){
		print_part();
		//translate([30, 25, 34]) cube([20,30,3],center=true); // test switch
		//translate([34, -20, 34]) cube([40,40,3],center=true); // test buttun
		//translate([-20, -29, 45]) cube([55,35,3],center=true); // test thermostat
		translate([-20,-5,enclosure_inner_depth]) coverCutouts();
	}
	translate([0,5,enclosure_inner_depth]){
		color("Orange") translate([-20, -10, 3])  letter("Intake");
		color("Orange") translate([-20, 40, 3])  letter("Exhaust");
		color("Orange") translate([44, 7, 3])  letter("F");
		color("Orange") translate([44, 21, 3])  letter("C");
	}
}


if ((part == "enclosure")||(part == "both")){
	difference(){
		print_part();
		color("Lime") translate([(enclosure_inner_length/2)-10 ,( enclosure_inner_width/2)-10,0])  cylinder(h=13,d=4,center=true);			//
		color("Lime") translate([(enclosure_inner_length/2)-10 ,(-enclosure_inner_width/2)+10,0])  cylinder(h=13,d=4,center=true);			//
		color("Lime") translate([(-enclosure_inner_length/2)+10,( enclosure_inner_width/2)-10,0])  cylinder(h=13,d=4,center=true);			//
		color("Lime") translate([(-enclosure_inner_length/2)+10,(-enclosure_inner_width/2)+10,0])  cylinder(h=13,d=4,center=true);			//
	}

	color("Red") translate([29,10,0]) cube([2,20,enclosure_inner_depth-8]);
	color("Red") translate([39,20,0]) rotate([0,0,90] )cube([2,20,enclosure_inner_depth - 15]);

}

	if((part == "switchKnob")) {
	print_part();
}



module print_part() {
	if (part == "enclosure") {
		box2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2-0.10,cover_thickness);
	} else if (part == "cover") {
		lid2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2+0.10,cover_thickness);
	} else if (part == "switchKnob"){
	switchKnob();
	} else {
	both();
	}
}

module both() {

	box2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2-0.10,cover_thickness);
	lid2(enclosure_inner_length,enclosure_inner_width,enclosure_inner_depth,enclosure_thickness,enclosure_thickness/2+0.10,cover_thickness);

}

module screws(in_x, in_y, in_z, shell) {

	sx = in_x/2 - 4;
	sy = in_y/2 - 4;
	sh = shell + in_z - 12;
	nh = shell + in_z - 4;

	translate([0,0,0]) {
		translate([sx , sy, sh]) cylinder(r=1.5, h = 17, $fn=32);
		translate([sx , -sy, sh ]) cylinder(r=1.5, h = 17, $fn=32);
		translate([-sx , sy, sh ]) cylinder(r=1.5, h = 17, $fn=32);
		translate([-sx , -sy, sh ]) cylinder(r=1.5, h = 17, $fn=32);
	
	
		translate([-sx , -sy, nh ]) rotate([0,0,-45]) 
			translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
		translate([sx , -sy, nh ]) rotate([0,0,45]) 
			translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
		translate([sx , sy, nh ]) rotate([0,0,90+45]) 
			translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
		translate([-sx , sy, nh ]) rotate([0,0,-90-45]) 
			translate([-5.75/2, -5.6/2, -0.7]) cube ([5.75, 10, 2.8]);
	}
}

module bottom(in_x, in_y, in_z, shell) {

	hull() {
   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
		translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=shell, $fn=32);
	}
}

module sides(in_x, in_y, in_z, shell) {
	translate([0,0,shell])
	difference() {
		hull() {
	   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
			translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
			translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
			translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=in_z, $fn=32);
		}
	
		hull() {
	   	 	translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
			translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
			translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
			translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell,h=in_z+1, $fn=32);
		}
	}
	
	intersection() {
		translate([-in_x/2, -in_y/2, shell]) cube([in_x, in_y, in_z+2]);
		union() {
			translate([-in_x/2 , -in_y/2,shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
			translate([-in_x/2 , -in_y/2,shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);
		
			translate([in_x/2 , -in_y/2, shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
			translate([in_x/2 , -in_y/2, shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);
		
			translate([in_x/2 , in_y/2,  shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
			translate([in_x/2 , in_y/2,  shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);
		
			translate([-in_x/2 , in_y/2, shell + in_z -6]) cylinder(r=9, h = 6, $fn=64);
			translate([-in_x/2 , in_y/2, shell + in_z -10]) cylinder(r1=3, r2=9, h = 4, $fn=64);
		}
	}
}

module lid_top_lip2(in_x, in_y, in_z, shell, top_lip, top_thickness) {

	cxm = -in_x/2 - (shell-top_lip);
	cxp = in_x/2 + (shell-top_lip);
	cym = -in_y/2 - (shell-top_lip);
	cyp = in_y/2 + (shell-top_lip);

	translate([0,0,shell+in_z])

	difference() {
	
		hull() {
			translate([-in_x/2+shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
			translate([+in_x/2-shell, -in_y/2+shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
			translate([+in_x/2-shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
			translate([-in_x/2+shell, in_y/2-shell, 0]) cylinder(r=shell*2,h=top_thickness, $fn=32);
		}
	
		
		translate([0, 0, -1]) linear_extrude(height = top_thickness + 2) polygon(points = [
			[cxm+5, cym],
			[cxm, cym+5],
			[cxm, cyp-5],
			[cxm+5, cyp],
			[cxp-5, cyp],
			[cxp, cyp-5],
			[cxp, cym+5],
			[cxp-5, cym]]);
	}
}

module lid2(in_x, in_y, in_z, shell, top_lip, top_thickness) {

	cxm = -in_x/2 - (shell-top_lip);
	cxp = in_x/2 + (shell-top_lip);
	cym = -in_y/2 - (shell-top_lip);
	cyp = in_y/2 + (shell-top_lip);	

	difference() {
		translate([0, 0, in_z+shell]) linear_extrude(height = top_thickness ) polygon(points = [
			[cxm+5, cym],
			[cxm, cym+5],
			[cxm, cyp-5],
			[cxm+5, cyp],
			[cxp-5, cyp],
			[cxp, cyp-5],
			[cxp, cym+5],
			[cxp-5, cym]]);
	
			screws(in_x, in_y, in_z, shell);
	}
}

module box2(in_x, in_y, in_z, shell, top_lip, top_thickness) {
	bottom(in_x, in_y, in_z, shell);
	difference() {
		sides(in_x, in_y, in_z, shell);
		screws(in_x, in_y, in_z, shell);
		hole("length_1", 10, [0, 15]);
		
//		hole("back", 8, [0, 0]);


		hole("length_1", 1.5, [-15, 5]);
		hole("length_1", 1.5, [-15, 25]);
		hole("length_1", 1.5, [15, 5]);
		hole("length_1", 1.5, [15, 25]);


}
	lid_top_lip2(in_x, in_y, in_z, shell, top_lip, top_thickness);
}

module punch_hole(cylinder, rotate, translate_coords) {
	translate(translate_coords) rotate (rotate) cylinder (h = cylinder[1], r=cylinder[0], center = false, $fn=32);
}

module hole(side, radius, offset) {
	// side is "[length/width]_[1/2]"
	// radius is hole radius
	// offset is [horizontal, height] from the [center, bottom] of the side, or from the [center, center] of the lid.
//	if (side == "back") {
//		assign (
//			rotate = [0,0,0], 
//			translate_coords = [offset[0], offset[1], 2], 
//			length = enclosure_inner_depth/2) {
//				punch_hole([radius, .10], rotate, translate_coords);
//		}
//	}
	if (side == "length_1") {
		assign (
			rotate = [90,0,90], 
			translate_coords = [enclosure_thickness+1, offset[0], offset[1]], 
			length = enclosure_inner_length/2) {
				punch_hole([radius, length], rotate, translate_coords);
		}
	}
	if (side == "length_2") {
		assign (
			rotate = [90,0,270], 
			translate_coords = [-(enclosure_thickness+1), offset[0], offset[1]], 
			length = enclosure_inner_length/2) {
				punch_hole([radius, length], rotate, translate_coords);
		}
	}
	if (side == "width_1") {
		assign (
			rotate = [90,0,0], 
			translate_coords = [offset[0], -(enclosure_thickness+1), offset[1]], 
			length = enclosure_inner_width/2) {
				punch_hole([radius, length], rotate, translate_coords);
		}
	}
	if (side == "width_2") {
		assign (
			rotate = [90,0,180], 
			translate_coords = [offset[0], enclosure_thickness+1, offset[1]], 
			length = enclosure_inner_width/2) {
				punch_hole([radius, length], rotate, translate_coords);
		}
	}
	if (side == "lid") {
		assign (
			rotate = [0,0,0], 
			translate_coords = [offset[0], offset[1], enclosure_inner_depth-cover_thickness], 
			length = enclosure_inner_depth/2) {
				punch_hole([radius, length], rotate, translate_coords);
		}
	}
}