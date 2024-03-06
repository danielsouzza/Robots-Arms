//Autora: Giovana Tripoloni Tangerino
//2020
$fn=200;


//SG90_motor();
//SG90_motorBarra();
//SG90_motorBarraD();
SG90_motorApoio();

//translate([6,6,27]) rotate([0,0,180]) SG90_motorBarra();	
//translate([6,6,27]) rotate([0,0,180]) SG90_motorBarraD();	

//---------------------------------------------------------
//SG90_motor();
module SG90_motor(){
		union(){
			translate([0,0,0]) rotate([0,0,0]) cube([22.5,12,16]);
			translate([-5,0,16]) rotate([0,0,0]) cube([32.5,12,2]);
			translate([0,0,18]) rotate([0,0,0]) cube([22.5,12,4.5]);
            translate([6,6,22.5]) rotate([0,0,0]) cylinder(4.5,6,6);
            translate([12,6,22.5]) rotate([0,0,0]) cylinder(4.5,2.75,2.75);
            translate([6.5,3.25,22.5]) rotate([0,0,0]) cube([5.5,5.5,4.5]);			
            translate([6,6,27]) rotate([0,0,0]) cylinder(2.5,2.25,2.25);
//			translate([6,6,27]) rotate([0,0,180]) SG90_motorBarra();	
   }
}
//---------------------------------------------------------
//SG90_motorBarra();
module SG90_motorBarra(){
//	difference(){
	//	translate([-6,-5,0]) rotate([0,0,0]) cube([25,10,3]);
		union(){
      	translate([0,0,0]) rotate([0,0,0]) cylinder(4.5,3.75,3.75);
       	translate([1.75,0,0]) rotate([0,0,0]) cylinder(4.5,2.75,2.75);
      	translate([14.5,0,0]) rotate([0,0,0]) cylinder(4.5,1.75,1.75);
			linear_extrude(height=4.5) polygon([[0, -3.65], [14.7, -1.75], [14.7, 1.75], [0, 3.65]]);		
		}
//   }
}

//---------------------------------------------------------
//SG90_motorBarraD();
module SG90_motorBarraD(){
//	difference(){//teste
//	translate([-18,-5,0]) rotate([0,0,0]) cube([36,10,2]);//teste
		union(){
      	translate([0,0,0]) cylinder(5,3.75,3.75);
      	rotate([0,0,0])   translate([14.4,0,0]) cylinder(5,2.2,2.2);
      	rotate([0,0,180]) translate([14.4,0,0]) cylinder(5,2.2,2.2);
			rotate([0,0,0])   linear_extrude(height=5) polygon([[0, -3.6], [14.7, -2.2], [14.7, 2.2], [0, 3.6]]);		
			rotate([0,0,180]) linear_extrude(height=5) polygon([[0, -3.6], [14.7, -2.2], [14.7, 2.2], [0, 3.6]]);		
//		}//teste
}
}
//---------------------------------------------------------
//SG90_motorApoio();
module SG90_motorApoio(){
	difference(){
		difference(){
     		translate([-5,0,18]) rotate([0,0,0]) cube([5,12,4.5]);
     		translate([-2.5,6,18]) rotate([0,0,0]) cylinder(4.5,.9,.9);
		}
		difference(){		        
     		translate([-5,0,18]) rotate([0,0,0]) cube([5,12,4.5]);
			translate([6,6,18]) rotate([0,0,0]) cylinder(5,10,10);
	 	}	
	}
	difference(){
      	translate([22.5,0,18]) rotate([0,0,0]) cube([5,12,4.5]);
      	translate([25,6,18]) rotate([0,0,0]) cylinder(4.5,.9,.9);
	}
}