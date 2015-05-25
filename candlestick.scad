$fn = 20;
e = 0.01;
height = 20;
candleDiameter = 22;
diameter = candleDiameter + 10;

difference() {
    union() {
        cylinder(d=diameter*1.5, h=height*(1/3));
        cylinder(d=diameter, h=height);
    }
    translate([0, 0, height/2])
        cylinder(d=candleDiameter, h=height*(2/3));
}