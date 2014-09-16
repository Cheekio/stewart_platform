cylinder(r=20, h=3);
module female() {
	translate([10,0,2]){
		difference(){
			cylinder(r=6, h=9, $fs=0.3);
			translate([0,0,5]){
				cylinder(r=3, h=10, $fs=0.3);
			}
		}
	}
}
female();
rotate(120, [0,0,1]){female();}
rotate(240, [0,0,1]){female();}