use <microservo_SG90.scad>;
use <basejoin.scad>;
$fn=100;

pont=1.5;

translate([10,45,0]) rotate([-90,0,180]) baseCraw();
translate([5,0,-6]) rotate([0,-100,0]) gear_right();
mirror([1,0,0])translate([25,0,-6]) rotate([0,-100,0]) gear_left();


module baseCraw(){
    difference(){
       union(){
           hull(){
               translate([-5,-5,26]) cube([50,35,3]);
               translate([-10,-2,26]) cube([60,28,3]);
           }
         translate([-5,26,26]) cube([50,4,16]); 
         hull(){
             translate([-12.5,-5,39]) cube([65,35,3]);
             translate([-15,-2,39]) cube([70,28,3]);
             translate([7.5,-20,39]) cube([25,15,3]);
         }
        }
        translate([-1,0,-.4]){
            translate([25,6,26]) rotate([0,0,0]) cylinder(4.5,.9,.9);
            translate([-2.5,6,26]) rotate([0,0,0]) cylinder(4.5,.9,.9);
        }
        translate([35,6,26]) rotate([0,0,0]) cylinder(4.5,3,3);
       
        translate([-1,0,7])SG90_motor();
        translate([5,6,35])cylinder(h=10,r=2);
        translate([35,6,35])cylinder(h=10,r=2);
        translate([10,-15,35])cylinder(h=10,r=2);
        translate([30,-15,35])cylinder(h=10,r=2);  
    }
}

module joints_gear_female(){
    difference(){
        union(){
             hull(){
                translate([0,12,0]) rotate([90,0,0]) cylinder(h=8,r=3);
                translate([25,12,0]) rotate([90,0,0]) cylinder(h=8,r=3); 
           
            }
            hull(){
                translate([25,12,0]) rotate([90,0,0]) cylinder(h=8,r=3); 
                translate([35,12,-5]) rotate([90,0,0]) cylinder(h=8,r=3); 
            }
            translate([0,16,7]) rotate([180,10,0]) hull(){
                translate([35,0,1.5]) rotate([0,-30,0]) cube([10,15,6]);
                translate([40,-2,5.4]) rotate([0,-30,0]) cube([20,20,3]);
                translate([45,1,8.5]) rotate([0,-30,0]) cube([20,15,3]);
            }
        }
        translate([0,10,0]) rotate([90,0,0]) cylinder(h=4,r=6);
        translate([20,10,0]) rotate([90,0,0]) cylinder(h=4,r=10);
        translate([0,13,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
        translate([25,13,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
    }
}

module joints_gear_male(){
    difference(){
        hull(){
           translate([0,10,0]) rotate([90,0,0]) cylinder(h=4,r=3);
           translate([26.6,10,0]) rotate([90,0,0]) cylinder(h=4,r=3); 
        }
     
        translate([0,13,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
        translate([26.6,13,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
    }
}



module gear_right(){
    difference(){
       union(){
           translate([0,11,0]) rotate([90,40,0]) gear(teeth = 25, diameter = 27, thickness = 8);
           
          # translate([12,1,-35]) rotate([0,-30,0]) joints_gear_female();
          #translate([21.5,1,1.2]) rotate([0,62.6,0]) joints_gear_male();
        }
        translate([0,13.5,0])rotate([90,70,0])SG90_motorBarra();
        translate([12,15,-35]) rotate([90,0,0]) cylinder(h=10,r=pont);
        translate([0,12,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
    }
}

module gear_left(){
    difference(){
       union(){
           translate([0,11,0]) rotate([90,40,0]) gear(teeth = 25, diameter = 26, thickness = 8,side=10);
           
           translate([12,1,-35]) rotate([0,-30,0]) joints_gear_female();
           translate([21.5,1,1.2]) rotate([0,62.6,0]) joints_gear_male();
        }
        translate([12,15,-35]) rotate([90,0,0]) cylinder(h=10,r=pont);
        translate([0,12,0]) rotate([90,0,0]) cylinder(h=10,r=pont);
    }
}


module teeth(size){
    hull(){
        cylinder(h=size/2,r=1.4, $fn=10);
        translate([2,0,0]) cylinder(h=size/2,r=.8, $fn=10);
    }
}    

module gear(teeth, diameter, thickness, side=1) {
  pitch_radius = diameter / 2;
  tooth_angle = 360 / teeth;
    
  hull(){
        translate([0,0,0]) rotate([0,0,0]) cylinder(h=4,r=4);
        translate([31.8,-19.1,0]) rotate([0,0,0]) cylinder(h=4,r=3);
  }
  difference(){
      cylinder(h=thickness/2,r=pitch_radius);
      cylinder(h=15,r=2);
  }
  
  for (i = [0: teeth/1.5]) {
      rotate(i * tooth_angle+side) {
      translate([pitch_radius, 0, 0]) {
          teeth(thickness);
      }
    }
  }
}
