difference(){
	translate([-103/2, 59/2, -10])
		rotate([90, 0, 0])
		import("dip8_2.STL");
		
	translate([0, -23.5, 0])
		color("green")
		resize([0,0,10])
		letter("555");
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
