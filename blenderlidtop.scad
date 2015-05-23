$fn = 50;
in = 25.4;
baseDiameter = 2.06 * in;
baseHeight = 1.33 * in;
wallThickness = 0.065 * in;
rimHeight = 0.6 * in;
rimProtrusion = 0.18 * in;
rimThickness = 0.11 * in;
rimGapSize = 0.33 * in;
tabGap = 0.21 * in;
tabWidth = 0.25 * in;
tabHeight = 0.15 * in;
tabProtrusion = 0.11 * in;
e = 0.01;

module base(diameter, height, thickness) {
    difference() {
        cylinder(h = height, d = diameter);
        translate([0, 0, thickness])
           cylinder(h = height, d = diameter - 2*thickness);
    }
}

module rim(id, od, thickness) {
    difference() {
        cylinder(h=thickness, d=od);
        translate([0, 0, -e])
            cylinder(h=thickness + 2*e, d=id);
        cube([1.25*od, rimGapSize, rimGapSize], center = true);
    }
}

module part() {
    union() {
        base(baseDiameter, baseHeight, wallThickness);
        translate([0, 0, rimHeight])
            rim(baseDiameter - 2*wallThickness, baseDiameter + rimProtrusion*2, rimThickness);
        translate([baseDiameter/2 - 0.5, -tabWidth/2, rimHeight+rimThickness+tabGap-(tabHeight/2)])
            cube([tabProtrusion + 0.5, tabWidth, tabHeight]);
        translate([-baseDiameter/2-tabProtrusion, -tabWidth/2, rimHeight+rimThickness+tabGap-(tabHeight/2)])
            cube([tabProtrusion + 0.5, tabWidth, tabHeight]);
    }
}

part();