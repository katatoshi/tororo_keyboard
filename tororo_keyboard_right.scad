use <key_switch.scad>

w_unit = 19.05; // unit width

y1 = 0;           // row1
y2 = -w_unit;     // row2
y3 = -2 * w_unit; // row3
y4 = -3 * w_unit; // row4
y5 = -4 * w_unit; // row5hole

plate_padding_x_l = 0; // plate padding x left 
plate_padding_x_r = 4; // plate padding x right
plate_padding_y_t = 4; // plate padding y top
plate_padding_y_b = 4; // plate padding y bottom

plate_w_x_no_padding = w_unit / 2 + 8 * w_unit;
plate_w_y_no_padding = w_unit / 2 + 4.5 * w_unit;

plate_w_x = plate_padding_x_l + plate_w_x_no_padding + plate_padding_x_r;
plate_w_y = plate_padding_y_t + plate_w_y_no_padding + plate_padding_y_b;

plate_h = 2;

pcb_h = 1.6;

keyboard_h_low = 10;
keyboard_h_high = 25;
plate_rotation_x = asin((keyboard_h_high - keyboard_h_low) / plate_w_y);

right_keyboard();

module right_keyboard() {
    untranslate_plate_origin_in_yz_plane() {
        rotate([plate_rotation_x, 0, 0]) {
            translate_plate_origin_in_yz_plane() {
                union() {
                    right_top_plate();
                    translate([0, 0, -5]) {
                        right_pcb();
                    }
                    translate([0, 0, -plate_h - 6]) {
                        right_bottom_plate_1();
                    }
                    translate([0, 0, -2 * plate_h - 6]) {
                        right_bottom_plate_2();
                    }
                    translate([0, 0, -3 * plate_h - 6]) {
                        right_bottom_plate_3();
                    }
                    translate([0, 0, -4 * plate_h - 6]) {
                        right_bottom_plate_4();
                    }
                    translate([0, 0, -5 * plate_h - 6]) {
                        right_bottom_plate_5();
                    }
                }
            }
        }
    }
}

module right_top_plate() {
    difference() {    
        right_plate();
        key_holes();
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_bottom_plate_1() {
    difference() {    
        right_plate();
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_bottom_plate_2() {
    offset = w_unit;
    difference() {
        translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2 + offset, -plate_h]) {
            cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
        }
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_bottom_plate_3() {
    offset = 2 * w_unit;
    difference() {
        translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2 + offset, -plate_h]) {
            cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
        }
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_bottom_plate_4() {
    offset = 3 * w_unit;
    difference() {
        translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2 + offset, -plate_h]) {
            cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
        }
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_bottom_plate_5() {
    offset = 4 * w_unit;
    difference() {
        translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2 + offset, -plate_h]) {
            cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
        }
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_pcb() {
    difference() {
        translate([plate_padding_x_l - plate_w_x + w_unit / 2 + plate_padding_x_r, plate_padding_y_b - plate_w_y + plate_padding_y_t + w_unit / 2, -pcb_h]) {
            cube([plate_w_x_no_padding, plate_w_y_no_padding, pcb_h], center = false);
        }
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module right_plate() {
    translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module key_holes() {
    // row 1
    y1 = 0;
    for (i = [0:7]) {
        key_hole(-i * w_unit, y1);
    }

    // row 2
    y2 = -w_unit;
    key_hole(-0.25 * w_unit, y2);
    for (i = [0:6]) {
        key_hole(-(1.5 + i) * w_unit, y2);
    }

    // row 3
    y3 = -2 * w_unit;
    key_hole(-0.625 * w_unit, y3);
    for (i = [0:5]) {
        key_hole(-(2.25 + i) * w_unit, y3);
    }

    // row 4
    y4 = -3 * w_unit;
    key_hole(0, y4);
    key_hole(-1.375 * w_unit, y4);
    for (i = [0:4]) {
        key_hole(-(2.75 + i) * w_unit, y4);
    }
    
    // row 5
    y5 = -4 * w_unit;
    key_hole(-2.5 * w_unit, y5);
    key_hole(-3.75 * w_unit, y5);
    key_hole(-5.125 * w_unit, y5);
    key_hole(-6.5 * w_unit, y5);
}

module unit_cube(x, y) {
    translate([x, y, 0]) {
        cube([w_unit, w_unit, w_unit], center = true);
    }
}

// operator modules

module translate_plate_origin_in_yz_plane() {
    translate([0, plate_w_y / 2, plate_h / 2]) {
        translate([0, -w_unit / 2 - plate_padding_y_t, 0]) {
            children();
        }
    }
}

module untranslate_plate_origin_in_yz_plane() {
    translate([0, w_unit / 2 + plate_padding_y_t, 0]) {
        translate([0, -plate_w_y / 2, -plate_h / 2]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_bottom() {
    translate_from_origin_to_plate_right_top() {
        translate([0, -plate_w_y, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_top() {
    translate([w_unit / 2 + plate_padding_x_r, w_unit / 2 + plate_padding_y_t, 0]) {
        children();
    }
}