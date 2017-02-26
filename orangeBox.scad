
module box(width=90,length=90,height=20,floor=2,wall=2) {

difference() {
 union() { // собственно коробка
   translate([wall,wall,0]) cylinder(r=wall,h=height);
     
   cube([width,length,floor]); 
   cube([width,wall,height]); 
      translate([0,length-wall,0]) cube([width,wall,height]);
   cube([wall,length,height]);
      translate([width-wall,0,0]) cube([wall,length,height]);
  // угловые крепления
  translate([wall,wall,0]) cylinder(r=wall,h=height);
  translate([width-wall,wall,0]) cylinder(r=wall,h=height);
  translate([wall,length-wall,0]) cylinder(r=wall,h=height);
  translate([width-wall,length-wall,0]) cylinder(r=wall,h=height);
     
 }
 union() { 
 for(i=[1:width/10-1]) // вырезаем крепежные отверстия 
     {
     for(j=[1:length/10-1])
          translate([i*10,j*10,0]) cylinder( r=2, h=10, $fn=32);
     translate([i*10,wall,10]) rotate([90,0,0]) cylinder( r=2, h=100, $fn=32);
     translate([i*10,length,10]) rotate([90,0,0]) cylinder( r=2, h=100, $fn=32);
     }
 // отверстия в креплениях
   translate([wall,wall,0]) cylinder(r=wall/2,h=height,$fn=32);
  translate([width-wall,wall,0]) cylinder(r=wall/2,h=height,$fn=32);
  translate([wall,length-wall,0]) cylinder(r=wall/2,h=height,$fn=32);
  translate([width-wall,length-wall,0]) cylinder(r=wall/2,h=height,$fn=32);
  
 }
}
 
}

module orangeBox(width=100,length=70,height=20,floor=2,wall=3) {
    difference() {
    box(width,length,height,floor,wall);
       translate([-1,10,4]) cube([10,50,20]); // USB + Ether
        // power need !
       translate([width-wall-1,20,13]) rotate([0,90,0]) cylinder( r=4, h=10,$fn=32);
       
    }
}


orangeBox();
//rotate([0,90,0]) cylinder( r=4, h=10);