thickness = 3;
length = 17.5;
width = 13.18;
height = 1.8;

radius = 70;


wire_diameter=2.73;
wire_radius = 0.5*wire_diameter;


wall_width = 2;
give = 0.5;
offset = 0.1;

module attachment_point() {
	translate([10, radius, 0]){
		rotate(-90, [0,1,0]){
			difference(){
				cube([length, width, height]);
				translate([length-2*wire_diameter,0.5*width, -offset]){
					cylinder(r=wire_radius + give, h=5, $fs=0.5);
				}
			}
		}
	}
}

module attachment_pair(){
	translate([10,0,0]){
		attachment_point();
	}
	mirror([1,0,0]){
		translate([10,0,0]){
			attachment_point();
		}
	}
}

module negative_circle() {
	rotate(30, [0,0,1]){
		translate([1.9*radius, 0, -offset]){
			cylinder(r=1.3*radius, h=thickness+2*offset, $fs=0.5);
		}
	}
}

difference(){
	cylinder(r=1.3*radius, h=thickness, $fs=0.5);
	negative_circle();
	rotate(120, [0,0,1]){
		negative_circle();
	}
	rotate(240, [0,0,1]){
		negative_circle();
	}
}
attachment_pair();
rotate(120, [0,0,1]){
	attachment_pair();
}
rotate(240, [0,0,1]){
	attachment_pair();
}