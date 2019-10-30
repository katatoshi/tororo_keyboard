use <key_switch.scad>

only_plate = false;
no_pcb = false;

w_unit = 19.05; // unit width

y1 = 0;           // row1
y2 = -w_unit;     // row2
y3 = -2 * w_unit; // row3
y4 = -3 * w_unit; // row4
y5 = -4 * w_unit; // row5

plate_padding_x_l = 4; // plate padding x left 
plate_padding_x_r = 0; // plate padding x right
plate_padding_y_t = 4; // plate padding y top
plate_padding_y_b = 4; // plate padding y bottom

plate_w_x_no_padding = w_unit / 2 + 6.75 * w_unit;
plate_w_y_no_padding = w_unit / 2 + 4.5 * w_unit;

plate_w_x = plate_padding_x_l + plate_w_x_no_padding + plate_padding_x_r;
plate_w_y = plate_padding_y_t + plate_w_y_no_padding + plate_padding_y_b;

plate_h = 2;

pro_micro_w_x = 34;
pro_micro_w_y = 18;
pro_micro_h = 4;
pro_micro_hole_w_y = 20;
trrs_hole_w_x = 10;
trrs_hole_x = plate_padding_x_l + 2 * w_unit - trrs_hole_w_x / 2;
trrs_w_x = 6;
trrs_w_y = 14;
trrs_h = 5;
reset_hole_y = trrs_w_y + 1;
reset_hole_w_x = 6;
reset_hole_w_y = 3.5;

pcb_h = 1.6;

screw_hole_r = 1;
spacer_r = 2;
spacer_h = 6;

keyboard_h_low = 10;
keyboard_h_high = 25;
plate_rotation_x = asin((keyboard_h_high - keyboard_h_low) / plate_w_y);

left_keyboard();

module left_keyboard() {
    untranslate_plate_origin_in_yz_plane() {
        rotate([plate_rotation_x, 0, 0]) {
            translate_plate_origin_in_yz_plane() {
                union() {
                    left_top_plate();
                    if (!only_plate) {
                        translate([0, 0, -5]) {
                            left_pcb(!no_pcb);
                        }
                    }
                    translate([0, 0, -plate_h - 6]) {
                        left_bottom_plate_1();
                    }
                    translate([0, 0, -2 * plate_h - 6]) {
                        left_bottom_plate_2();
                    }
                    translate([0, 0, -3 * plate_h - 6]) {
                        left_bottom_plate_3();
                    }
                    translate([0, 0, -4 * plate_h - 6]) {
                        left_bottom_plate_4();
                    }
                    translate([0, 0, -5 * plate_h - 6]) {
                        left_bottom_plate_5();
                    }
                    spacers();
                }
            }
        }
    }
}

module left_top_plate() {
    difference() {    
        left_plate();
        key_holes();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module left_bottom_plate_1() {
    difference() {
        translate([0, 0, -plate_h]) {
            translate_from_origin_to_plate_left_bottom() {
                cube([plate_w_x, plate_w_y, plate_h], center = false);
            }
        }
        left_pro_micro_space();
        left_reset_hole();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module left_bottom_plate_2() {
    offset = w_unit + 1;
    difference() {
        translate([0, offset, -plate_h]) {
            translate_from_origin_to_plate_left_bottom() {
                cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
            }
        }
        left_pro_micro_space();
        left_reset_hole();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module left_bottom_plate_3() {
    offset = 2 * w_unit + 1;
    difference() {
        translate([0, offset, -plate_h]) {
            translate_from_origin_to_plate_left_bottom() {
                cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
            }
        }
        left_reset_hole();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module left_bottom_plate_4() {
    offset = 3 * w_unit + 1;
    difference() {
        translate([0, offset, -plate_h]) {
            translate_from_origin_to_plate_left_bottom() {
                cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
            }
        }
        left_reset_hole();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module left_bottom_plate_5() {
    offset = 4 * w_unit + 1;
    difference() {
        translate([0, offset, -plate_h]) {
            translate_from_origin_to_plate_left_bottom() {
                cube([plate_w_x, plate_w_y - offset, plate_h], center = false);
            }
        }
        left_reset_hole();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
        screw_holes();
    }
}

module spacer_holes() {
    union() {
        translate([2.5 * w_unit + spacer_r, y2 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([5.5 * w_unit + spacer_r, y2 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([5.75 * w_unit + spacer_r, y3 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([2.25 * w_unit + spacer_r, y4 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([6.25 * w_unit + spacer_r, y4 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([2.25 * w_unit + spacer_r, y5 - spacer_r, -plate_h]) {
            spacer_hole();
        }
        translate([6.25 * w_unit + spacer_r, y5 - spacer_r, -plate_h]) {
            spacer_hole();
        }
    }
}

module spacer_hole() {
    spacer_hole_r = spacer_r + 1;
    translate([spacer_r, -spacer_r, -spacer_h]) {
        translate_from_origin_to_plate_left_top() {
            translate([0, 0, spacer_h / 2]) {
                difference() {
                    cylinder($fn = 16, h = spacer_h, r = spacer_hole_r, center = true);
                }
            }
        }
    }
}

module spacers() {
    union() {
        translate([0, y1, -plate_h]) {
            spacer();
        }
        translate([trrs_hole_x - 2 * spacer_r, y1, -plate_h]) {
            spacer();
        }
        translate([trrs_hole_x + trrs_hole_w_x, y1, -plate_h]) {
            spacer();
        }
        translate([plate_padding_x_l + 7 * w_unit + plate_padding_x_r - 2 * spacer_r, y1, -plate_h]) {
            spacer();
        }
        translate([2.5 * w_unit + spacer_r, y2 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([5.5 * w_unit + spacer_r, y2 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([0, y3 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([5.75 * w_unit + spacer_r, y3 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([2.25 * w_unit + spacer_r, y4 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([6.25 * w_unit + spacer_r, y4 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([2.25 * w_unit + spacer_r, y5 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([6.25 * w_unit + spacer_r, y5 - spacer_r, -plate_h]) {
            spacer();
        }
        translate([0, -plate_w_y + 2 * spacer_r, -plate_h]) {
            spacer();
        }
        translate([7.25 * w_unit, -plate_w_y + 2 * spacer_r, -plate_h]) {
            spacer();
        }
    }
}

module spacer() {
    translate([spacer_r, -spacer_r, -spacer_h]) {
        translate_from_origin_to_plate_left_top() {
            translate([0, 0, spacer_h / 2]) {
                difference() {
                    cylinder($fn = 16, h = spacer_h, r = spacer_r, center = true);
                    cylinder($fn = 16, h = spacer_h, r = screw_hole_r, center = true);
                }
            }
        }
    }
}

module screw_holes() {
    translate([0, y1, 0]) {
        screw_hole();
    }
    translate([trrs_hole_x - 2 * spacer_r, y1, 0]) {
        screw_hole();
    }
    translate([trrs_hole_x + trrs_hole_w_x, y1, 0]) {
        screw_hole();
    }
    translate([plate_padding_x_l + 7 * w_unit + plate_padding_x_r - 2 * spacer_r, y1, 0]) {
        screw_hole();
    }
    translate([2.5 * w_unit + spacer_r, y2 - spacer_r, 0]) {
        screw_hole();
    }
    translate([5.5 * w_unit + spacer_r, y2 - spacer_r, 0]) {
        screw_hole();
    }
    translate([0, y3 - spacer_r, 0]) {
        screw_hole();
    }
    translate([5.75 * w_unit + spacer_r, y3 - spacer_r, 0]) {
        screw_hole();
    }
    translate([2.25 * w_unit + spacer_r, y4 - spacer_r, 0]) {
        screw_hole();
    }
    translate([6.25 * w_unit + spacer_r, y4 - spacer_r, 0]) {
        screw_hole();
    }
    translate([2.25 * w_unit + spacer_r, y5 - spacer_r, 0]) {
        screw_hole();
    }
    translate([6.25 * w_unit + spacer_r, y5 - spacer_r, 0]) {
        screw_hole();
    }
    translate([0, -plate_w_y + 2 * spacer_r, 0]) {
        screw_hole();
    }
    translate([7.25 * w_unit, -plate_w_y + 2 * spacer_r, 0]) {
        screw_hole();
    }
}

module screw_hole() {
    translate([2 * screw_hole_r, -2 * screw_hole_r, -plate_h]) {
        translate_from_origin_to_plate_left_top() {
            cylinder($fn = 16, h = plate_h, r = screw_hole_r, center = false);
        }
    }
}

module left_pcb(show_pcb = true, show_parts = true) {
    union() {
        if (show_pcb) {
            difference() {
                union() {
                    difference() {
                        translate([plate_padding_x_l, plate_padding_y_t, -pcb_h]) {
                            translate_from_origin_to_plate_left_bottom() {
                                cube([plate_w_x_no_padding, plate_w_y_no_padding, pcb_h], center = false);
                            }
                        }
                        unit_cube(7 * w_unit, y1 + w_unit);
                        unit_cube(7 * w_unit, y1);
                        unit_cube((1.5 + 5) * w_unit, y2);
                        unit_cube((1.75 + 5) * w_unit, y3);
                        translate([0, 0, spacer_h]) {
                            spacer_holes();
                        }
                        translate([0, -plate_padding_y_t - 5 * w_unit - plate_padding_y_b, -pcb_h]) {
                            translate_from_origin_to_plate_left_top() {
                                cube([plate_padding_x_l + 1.5 * w_unit, w_unit + plate_padding_y_b, pcb_h], center = false);
                            }
                        }
                    }
                    translate([0, -plate_padding_y_t - pro_micro_hole_w_y / 2 - pro_micro_w_y / 2, -pcb_h]) {
                        translate_from_origin_to_plate_left_top() {
                            cube([pro_micro_w_x, pro_micro_w_y, pcb_h], center = false);
                        }
                    }
                    translate([trrs_hole_x + trrs_hole_w_x / 2 - trrs_w_x / 2, -trrs_w_y, -pcb_h]) {
                        translate_from_origin_to_plate_left_top() {
                            cube([trrs_w_x, trrs_w_y, pcb_h], center = false);
                        }
                    }
                }
                key_holes();
                left_reset_hole(pcb_h);
            }
        }
        if (show_parts) {
            translate([0, 0, -pcb_h]) {
                left_trrs();
            }
            translate([0, 0, -pcb_h]) {
                left_pro_micro();
            }
        }
    }
}

module left_trrs() {
    translate([trrs_hole_x + trrs_hole_w_x / 2 - trrs_w_x / 2, -trrs_w_y, -trrs_h]) {
        translate_from_origin_to_plate_left_top() {
            cube([trrs_w_x, trrs_w_y, trrs_h], center = false);
        }
    }
}

module left_pro_micro() {
    translate([0, -plate_padding_y_t - pro_micro_hole_w_y / 2 - pro_micro_w_y / 2, -pro_micro_h]) {
        translate_from_origin_to_plate_left_top() {
            cube([pro_micro_w_x, pro_micro_w_y, pro_micro_h], center = false);
        }
    }
}

module left_pro_micro_space() {
    union() {
        translate([trrs_hole_x, -plate_padding_y_t, -plate_h]) {
            translate_from_origin_to_plate_left_top() {
                cube([trrs_hole_w_x, plate_padding_y_t, plate_h], center = false);
            }
        }
        translate([0, -pro_micro_hole_w_y - plate_padding_y_t, -plate_h]) {
            translate_from_origin_to_plate_left_top() {
                cube([trrs_hole_x + trrs_hole_w_x, pro_micro_hole_w_y, plate_h], center = false);
            }
        }
    }
}

module left_reset_hole(h = plate_h) {
    union() {
        translate([trrs_hole_x + trrs_hole_w_x / 2 - trrs_w_x / 2, -reset_hole_w_y - reset_hole_y, -h]) {
            translate_from_origin_to_plate_left_top() {
                cube([reset_hole_w_x, reset_hole_w_y, h], center = false);
            }
        }
    }
}

module left_plate() {
    translate([0, 0, -plate_h]) {
        translate_from_origin_to_plate_left_bottom() {
            cube([plate_w_x, plate_w_y, plate_h], center = false);
        }
    }
}

module key_holes() {
    // row 1
    for (i = [0:6]) {
        key_hole(i * w_unit, y1);
    }

    // row 2
    key_hole(0.25 * w_unit, y2);
    for (i = [0:4]) {
        key_hole((1.5 + i) * w_unit, y2);
    }

    // row 3
    key_hole(0.375 * w_unit, y3);
    for (i = [0:4]) {
        key_hole((1.75 + i) * w_unit, y3);
    }

    // row 4
    key_hole(0.625 * w_unit, y4);
    for (i = [0:4]) {
        key_hole((2.25 + i) * w_unit, y4);
    }
    
    // row 5
    key_hole(1.5 * w_unit, y5);
    key_hole(2.75 * w_unit, y5);
    key_hole(4 * w_unit, y5);
    key_hole(5.625 * w_unit, y5);
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

module translate_from_origin_to_plate_left_bottom() {
    translate_from_origin_to_plate_left_top() {
        translate([0, -plate_w_y, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_left_top() {
    translate([-w_unit / 2 - plate_padding_x_l, w_unit / 2 + plate_padding_y_t, 0]) {
        children();
    }
}