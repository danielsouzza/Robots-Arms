use <microservo_SG90.scad>;
use <basejoin.scad>;
$fn=100;



translate([-100,0,19]) rotate([0,180,0]) rotatetionalMotorMale();


module rotatetionalMotorMale(){
    difference(){
        union(){
        translate([0,0,0]) base();
        translate([-9,20,0]) rotate([0,0,0]) cylinder(h=20,r=10);
        translate([-36,15,0]){
            difference(){
                union(){
                    translate([0,-5,5])  cube([36,20,9]);
                    translate([0,5,5]) cylinder(9,10,10);
                }
                translate([0,5,4]) cylinder(11,5,5);
             }
             difference(){
                 translate([0,5,5]) cylinder(8,5,5);
                 translate([0,5,5]) cylinder(10,r=2);
             }
        }
    }
    translate([-36,20,5])  rotate([0,0,0]) SG90_motorBarra();
    }   
}