cylinder(r=20, h=3);
module male() {
translate([10,0,2]){
	cylinder(r=2.8, h=10, $fs=0.3);
}
}
male();
rotate(120, [0,0,1]){male();}
rotate(240, [0,0,1]){male();}