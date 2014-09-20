module a_dock() {
    width = 53.4;
    length = 68.6;
    thickness = 3;
    peg_length = 3*thickness;
    height = 3;
    w_offset = 19;
    l_offset = 16;

    translate([0, w_offset, 0]){
        cube([length+2*thickness, thickness, thickness]);
        translate([0,-thickness,0]){
            cube([thickness, peg_length, height+thickness]);
        }
        translate([length+thickness, -thickness, 0]){
            cube([thickness, peg_length, height+thickness]);
        }
    }

    translate([l_offset, 0, 0]){
        cube([thickness, width+2*thickness, thickness]);
        translate([-thickness,0,0]){
            cube([peg_length, thickness, height+thickness]);
        }
        translate([-thickness, width+thickness, 0]){
            cube([peg_length, thickness, height+thickness]);
        }
    }
}