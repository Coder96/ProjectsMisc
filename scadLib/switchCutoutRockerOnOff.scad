
switchCutoutRockerOnOff();

module switchCutoutRockerOnOff(
	scroo_powerSwitchWidth = 13,
	scroo_powerSwitchHeigth = 19,
	scroo_powerSwitchClipWidth = 5.7,
	scroo_powerSwitchClipHeigth = 20.5

  ){ 
		cube([scroo_powerSwitchWidth,scroo_powerSwitchHeigth,10],center=true);
		cube([scroo_powerSwitchClipWidth,scroo_powerSwitchClipHeigth,10],center=true);
		translate([0,0,-3]) cube([scroo_powerSwitchClipWidth,scroo_powerSwitchClipHeigth+4,10],center=true);
}