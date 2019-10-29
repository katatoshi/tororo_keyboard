use <tororo_keyboard_left.scad>
use <tororo_keyboard_right.scad>

// arrangeLeftPlateOnA5_1(showFrame = false);
// arrangeRightPlateOnA5_1(showFrame = false);
arrangePlateOnA3_1(showFrame = false);

module arrangeLeftPlateOnA5_1(showFrame = false) {
    union() {
        if (showFrame) {
            color("red") {
                A5Frame(margin = 5);
            }
        }
        translate([1, 1]) {
            rotate(0) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_top_plate();
                    }
                }
            }
        }
        translate([1, 26 + 3 + 2]) {
            rotate(0) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_5();
                    }
                }
            }
        }
        translate([268 - 2, 0.25]) {
            rotate(90) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_4();
                    }
                }
            }
        }
    }
}

module arrangeRightPlateOnA5_1(showFrame = false) {
    union() {
        if (showFrame) {
            color("red") {
                A5Frame(margin = 5);
            }
        }
        translate([1, 1]) {
            rotate(0) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_top_plate();
                    }
                }
            }
        }
        translate([1, 26 + 3 + 2]) {
            rotate(0) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_5();
                    }
                }
            }
        }
        translate([281 + 4, 0.25]) {
            rotate(90) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_5();
                    }
                }
            }
        }
    }
}

module arrangePlateOnA3_1(showFrame = false) {
    union() {
        if (showFrame) {
            color("red") {
                A3Frame(margin = 5);
            }
        }
        translate([1, 1]) {
            rotate(0) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_1();
                    }
                }
            }
        }
        translate([143 + 3, 1]) {
            rotate(0) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_1();
                    }
                }
            }
        }
        translate([1, 84.5 + 5]) {
            rotate(0) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_2();
                    }
                }
            }
        }
        translate([143 + 3, 84.5 + 5]) {
            rotate(0) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_2();
                    }
                }
            }
        }
        translate([1, 154 + 5]) {
            rotate(0) {
                translateLeftPlateToOrigin(margin = 5) {
                    projection() {
                        left_bottom_plate_3();
                    }
                }
            }
        }
        translate([143 + 3, 154 + 5]) {
            rotate(0) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_3();
                    }
                }
            }
        }
        translate([426 + 3, 1]) {
            rotate(90) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_4();
                    }
                }
            }
        }
        translate([474.5 + 3, 1]) {
            rotate(90) {
                translateRightPlateToOrigin(margin = 5) {
                    projection() {
                        right_bottom_plate_4();
                    }
                }
            }
        }
    }
}

module A5Frame(margin = 0) {
    frame(210, 148, margin);
}

module A4Frame(margin = 0) {
    frame(297, 210, margin);
}

module A3Frame(margin = 0) {
    frame(420, 297, margin);
}

module frame(w_x, w_y, margin) {
    frame_w = 10;
    difference() {
        translate([-frame_w, -frame_w]) {
            square([w_x + 2 * frame_w, w_y + 2 * frame_w], center = false);
        }
        translate([margin, margin]) {
            square([w_x - 2 * margin, w_y - 2 * margin], center = false);
        }
    }
}

module translateLeftPlateToOrigin(margin = 0) {
    translate([13.5 + margin, 89.75 + margin]) {
        children();
    }
}

module translateRightPlateToOrigin(margin = 0) {
    translate([152.5 + margin, 89.75 + margin]) {
        children();
    }
}

module arrangeLeftPlateInLine() {
    union() {
        projection() {
            left_top_plate();
            y1 = 107;
            y2 = y1 + 87;
            y3 = y2 + 67;
            y4 = y3 + 47;
            y5 = y4 + 27;
            translate([0, y1, 0]) {
                left_bottom_plate_1();
            }
            translate([0, y2, 0]) {
                left_bottom_plate_2();
            }
            translate([0, y3, 0]) {
                left_bottom_plate_3();
            }  
            translate([0, y4, 0]) {
                left_bottom_plate_4();
            }
            translate([0, y5, 0]) {
                left_bottom_plate_5();
            }
        }
    }
}
