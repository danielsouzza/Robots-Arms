use <microservo_SG90.scad>;
use <basejoin.scad>;
use <bsecraw.scad>;
use <Rotary-Joints.scad>;
$fn=100;

rotatetionalMotorFemale();
translate([-100,0,19]) rotate([0,180,0]) rotatetionalMotorMale();


rotate([90,0,0]) translate([-40,-30,0]){
translate([10,45,0]) rotate([-90,0,180]) baseCraw();
translate([5,0,-6]) rotate([0,-100,0]) gear_right();
mirror([1,0,0])translate([25,0,-6]) rotate([0,-100,0]) gear_left();
}