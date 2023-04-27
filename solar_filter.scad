$fa = 1;
$fs = 0.4;

outside_diameter = 171;
thickness = 2;
height = 30;
clear_aperture = 130;

difference()
{
    cylinder(h = height, r = outside_diameter / 2);
    translate(v = [ 0, 0, thickness ]) cylinder(h = height, r = outside_diameter / 2 - thickness);
    translate(v = [ 0, 0, -thickness ]) cylinder(h = height, r = clear_aperture / 2);
}