s_l = 24.5;
s_w = 12.4;
wall = 4;
depth = 6;
sc_l = s_l + 2*wall;
sc_w = s_w + 2*wall;
off = 0.1;

module servo_compontent(holes) {
	difference(){
		cube([sc_l,sc_w,depth]);
		translate([wall, wall, -off]){
			cube([s_l, s_w, depth + 2*off]);
		}
		if(holes){
			translate([0.5*wall, wall+0.5*s_w, -off]){
				cylinder(r=1, h=depth+2*off);
			}
			translate([1.5*wall+s_l, wall+0.5*s_w, -off]){
				cylinder(r=1, h=depth+2*off);
			}
		}
	}
}

module servo_holder() {
	servo_compontent(true);
	translate([0,0,sc_w-wall]){
		cube([wall,sc_w,wall]);
	}
	translate([sc_l,sc_w,depth]){
			rotate(180,[0,0,1]){
				difference(){
				cube([sc_l,wall, sc_w]);
				translate([0,-off,0]){
					rotate(-30, [0,1,0]){
						cube([sc_l*2,wall+2*off,sc_l]);
					}
				}
			}
		}
	}
}
