head_diameter = 7.32;
head_radius = head_diameter / 2;
head_height = 4.3;
arm_height = 1.6;
arm_length = 20;
offset=0.1;
wire_diameter=2.73;
wire_radius = 0.5*wire_diameter;


wall_width = 2;
give = 0.5;

component_width = head_diameter + 2*give + 2*wall_width;
component_height = arm_height + give + 2*wall_width;
component_length = 40;

rotate(-90, [0,1,0]){
difference(){
	cube([component_length, component_width, component_height]);
	translate([-offset, wall_width, wall_width]){
		cube([
			arm_length+offset+give,
			head_diameter+2*give,
			arm_height+give
		]);
	}
	translate([head_radius, 0.5*component_width, arm_height+2*give]){
		cylinder(r=head_radius+give, h=component_height, $fs=0.5);
	}
	translate([component_length-(17),-offset,-offset]){
		cube([component_length, component_width+2*offset, component_height-arm_height]);
		translate([12,0.5*component_width+offset,0]){
			cylinder(r=wire_radius+give, h=component_height+2*offset, $fs=0.5);
		}
	}
}

}