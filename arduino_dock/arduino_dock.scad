width = 53.4;
length = 68.6;
thickness = 3;
height = 3;
w_offset = 17;
l_offset = 18;

translate([0, w_offset, 0]){
	cube([length+2*thickness, thickness, thickness]);
	cube([thickness, thickness, height+thickness]);
	translate([length+thickness, 0, 0]){
		cube([thickness, thickness, height+thickness]);
	}
}

translate([l_offset, 0, 0]){
	cube([thickness, width+2*thickness, thickness]);
	cube([thickness, thickness, height+thickness]);
	translate([0, width+thickness, 0]){
		cube([thickness, thickness, height+thickness]);
	}
}