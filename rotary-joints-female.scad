use <microservo_SG90.scad>;
use <basejoin.scad>;
$fn=100;

rotatetionalMotorFemale();


module rotatetionalMotorFemale(){
    difference(){
        union(){
            translate([0,0,0]) base();
            translate([-9,20,0]) rotate([0,0,0]) cylinder(h=20,r=10);
            translate([-30,15,0]){
                 union(){
                        translate([0,-5,0])  cube([30,20,20]);
                        translate([0,5,0]) cylinder(20,10,10);
                    }
      
                 translate([0,5,5]) cylinder(8,5,5);
                 translate([0,5,5]) cylinder(10,r=2.5);
            }     
        }
        
        translate([-30,15,0]){
            translate([0,5,0]) cylinder(20,r=2.5);
            difference(){
                union(){
                    translate([-5,-5,5])  cube([25,20,9]);
                    translate([-5,5,5]) cylinder(9,10,10);
                }
                 translate([0,5,5]) cylinder(1,5,5);
                 translate([0,5,0]) cylinder(20,r=2.5);
            } 
        }
        translate([-36,26,40]) rotate([180,0,0]) SG90_motor();
    }
    translate([-36,26,40]) rotate([180,0,0]) SG90_motorApoio();
}