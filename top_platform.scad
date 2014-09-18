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

male_height = thickness + 2*offset;
male_radius = 2.8;


servo_distance = 0.5*a_length + slop + s_depth;
p_radius = servo_distance + slop + wall;
h_radius = 0.5*a_width;
male_distance = p_radius - 0.5*(p_radius - h_radius);


module male() {
	translate([male_distance, 0,-offset]){
	cylinder(r=male_radius, h=male_height, $fs=0.3);
	}
}



module servo_holder() {
	difference(){
		cube([sc_l,sc_w,depth]);
		translate([wall, wall, -off]){
			cube([s_l, s_w, depth + 2*off]);
		}
		translate([0.5*wall, wall+0.5*s_w, -off]){
			cylinder(r=1, h=depth+2*off);
		}
		translate([1.5*wall+s_l, wall+0.5*s_w, -off]){
			cylinder(r=1, h=depth+2*off);
		}
	}
}
module two_servos() {
	translate([servo_distance,0,0]){
		mirror([0,1,0]){
			rotate(-90, [0,1,0]){
				servo_holder();
			}
		}
		rotate(-90, [0,1,0]){
			servo_holder();
		}
	}
}



rotate(180, [1,0,0]){
	difference(){
		cylinder(r=p_radius, h=thickness, $fs=0.5);
		translate([0,0,-offset]){
			cylinder(r=h_radius, h=thickness + 2*offset, $fs=0.5);
		}
		male();
		rotate(120, [0,0,1]){male();}
		rotate(240, [0,0,1]){male();}
	}
}
rotate(60, [0,0,1]){
	two_servos();
	rotate(120, [0,0,1]){two_servos();}
	rotate(240, [0,0,1]){two_servos();}
}