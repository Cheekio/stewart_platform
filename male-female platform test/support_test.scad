
module male_base() {
cylinder(r=20, h=3);
module male() {
translate([10,0,2]){
	cylinder(r=2.8, h=6, $fs=0.3);
}
}
male();
rotate(120, [0,0,1]){male();}
rotate(240, [0,0,1]){male();}
}

translate([0,0,8]){
	rotate(180, [0,1,0]){
		male_base();
	}
}