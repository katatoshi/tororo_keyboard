use <tororo_keyboard_left.scad>
use <tororo_keyboard_right.scad>

left_keyboard();
translate([300, 0, 0]) {
    right_keyboard();
}