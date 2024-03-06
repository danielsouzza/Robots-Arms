$fn=100;
cubo_r=2;


module base(){
    difference() {
        translate([0,20,0]) cylinder(h=20,r=13);
        
        translate([-1,25,5]) rotate([0,90,0]) cylinder(22,r=cubo_r);
        translate([-1,25,15]) rotate([0,90,0]) cylinder(22,r=cubo_r);
        translate([-1,15,5]) rotate([0,90,0]) cylinder (22, r=cubo_r);

        translate([-1,15,15]) rotate([0,90,0]) cylinder (22,r=cubo_r);
        translate([-1,20,10]) rotate([0,90,0]) cylinder (22, r=cubo_r);
    }
}