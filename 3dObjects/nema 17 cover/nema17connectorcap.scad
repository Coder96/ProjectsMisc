$fn = 30;


$wallThickness  = 2;

$heigth = 20;
$outterWith = 42;
$innerWith = 34;

$boltPatternWidth = 31;


$roundover = 2;

difference(){
	box();

	color("RED")
		translate([0,0,$wallThickness])
		resize([$outterWith-$wallThickness,$outterWith-$wallThickness,0]) box();
	}


module box(){

$roundover = 2;

	hull(){

		translate([ ($innerWith/2)-($roundover/2), ($outterWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([-($innerWith/2)-($roundover/2), ($outterWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([ ($innerWith/2)-($roundover/2),-($outterWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([-($innerWith/2)-($roundover/2),-($outterWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);

		translate([ ($outterWith/2)-($roundover/2), ($innerWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([-($outterWith/2)-($roundover/2), ($innerWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([ ($outterWith/2)-($roundover/2),-($innerWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);
		translate([-($outterWith/2)-($roundover/2),-($innerWith/2)-($roundover/2),0]) cylinder(h=$heigth, d=$roundover, center=true);

	}

}