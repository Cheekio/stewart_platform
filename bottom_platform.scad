include <arduino_dock.scad>;

a_width = 53.4;
a_length = 68.6;
s_depth = 15.8;
slop = 5;
offset = 0.1;
thickness = 3;

s_l = 24.5;
s_w = 12.4;
wall = 4;
depth = 6;
sc_l = s_l + 2*wall;
sc_w = s_w + 2*wall;
off = 0.1;

sheath_height = 45;
male_height = thickness*3;
male_radius = 2.6;

servo_distance = 0.5*a_length + slop + s_depth;
p_radius = servo_distance + slop + wall;
h_radius = 0.5*a_width;
male_distance = p_radius - 0.5*(p_radius - h_radius);

module male() {
	cylinder(r=male_radius, h=male_height, $fs=0.3);
}

module sheath() {
	cylinder(r=male_radius+thickness, h=sheath_height, $fs=0.3);
}

module pillar() {
	translate([male_distance, 0,0]){
		sheath();
		translate([0,0,sheath_height]){
			male();
		}
	}
}
pillar();
rotate(120, [0,0,1]){pillar();}
rotate(240, [0,0,1]){pillar();}

servo_distance = 0.5*a_length + slop + s_depth;
p_radius = servo_distance + slop + wall;
h_radius = 0.5*a_width;
male_distance = p_radius - 0.5*(p_radius - h_radius);

difference(){
	cylinder(r=p_radius, h=thickness, $fs=0.5);
	translate([-0.5*a_length, -0.5*a_width, -offset]){
		cube([a_length, a_width, thickness+2*offset]);
	}
}
translate([-0.5*a_length-thickness, -0.5*a_width-thickness, 0]){
	a_dock();
}