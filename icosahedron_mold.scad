$fn = 20;
e = 0.01;
icosahedronScale = 15;
moldSize = 40;
seperation = 5;
screwSize = 4.6;
screwLocationBump = 0.30;
screwXBump = 0.25;
pourDiameter = 10;

module icosahedron() {
    scale([icosahedronScale, icosahedronScale, icosahedronScale])
        import("icosahedron.stl");
}

module r_half() {
    difference() {
        cube(moldSize, center = true);
        icosahedron();
        translate([-moldSize, -moldSize*1.25/2, -moldSize*1.25/2])
            cube([moldSize, moldSize*1.25, moldSize*1.25]);
        translate([0, 0, moldSize/4])
            cylinder(h=moldSize*1.25, d=pourDiameter);
        translate([-moldSize*screwXBump, moldSize*screwLocationBump, moldSize*screwLocationBump])
            rotate(a=90, v=[0, 1, 0])
                cylinder(h=moldSize, d=screwSize);
        translate([-moldSize*screwXBump, moldSize*-screwLocationBump, moldSize*-screwLocationBump])
            rotate(a=90, v=[0, 1, 0])
                cylinder(h=moldSize, d=screwSize);
    }
}

module l_half() {
    difference() {
        cube(moldSize, center = true);
        icosahedron();
        translate([0, -moldSize*1.25/2, -moldSize*1.25/2])
            cube([moldSize, moldSize*1.25, moldSize*1.25]);
        translate([0, 0, moldSize/4])
            cylinder(h=moldSize*1.25, d=pourDiameter);
        translate([-moldSize*screwXBump*3, moldSize*screwLocationBump, moldSize*screwLocationBump])
            rotate(a=90, v=[0, 1, 0])
                cylinder(h=moldSize, d=screwSize);
        translate([-moldSize*screwXBump*3, moldSize*-screwLocationBump, moldSize*-screwLocationBump])
            rotate(a=90, v=[0, 1, 0])
                cylinder(h=moldSize, d=screwSize);
    }
}

translate([0, 0, moldSize/2]) {
    translate([-seperation, 0, 0]) l_half();
    translate([seperation, 0, 0]) r_half();
}