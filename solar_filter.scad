$fa = 1;
$fs = 0.4;

inner_diameter = 170;
thickness = 2;
outside_diameter = inner_diameter + thickness * 2;

height = 30;
clear_aperture = 130;

!filter_guard();
filter_housing();

module filter_housing()
{
    difference()
    {
        rounded_cylinder(h = height, r = outside_diameter / 2);
        translate(v = [ 0, 0, thickness ]) cylinder(h = height, r = inner_diameter / 2);
        translate(v = [ 0, 0, -thickness ]) cylinder(h = height, r = clear_aperture / 2);
    }
}

module filter_guard()
{
    translate(v = [ 0, 0, thickness ]) difference()
    {
        cylinder(h = thickness, r = (inner_diameter - 1) / 2);
        translate(v = [ 0, 0, -thickness / 2 ]) cylinder(h = thickness * 2, r = clear_aperture / 2);
    }
}

module rounded_cylinder(h, r, n = 4)
{
    rotate_extrude(convexity = 1)
    {
        offset(r = n) offset(delta = -n) square([ r, h ]);
        square([ n, h ]);
    }
}