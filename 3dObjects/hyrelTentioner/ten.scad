 
$fn=30;


import("/home/jklein/Projects/hyrelTentioner/y_tensioner_12.0mm_122215_NAS.STL");

braket();

module braket(){

}
////////////////////////////////////////////////////////////////////////////////////////////////////
module plate2Point(y,z,d){
	hull(){
		color("green") translate([0 ,(y/2) -(d/2),0]) cylinder(h=z, d=d, center=true);
		color("blue")  translate([0 ,-(y/2)+(d/2),0]) cylinder(h=z, d=d, center=true);
	}
}
