/*
Copyright 2023 John Stegeman

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

/*

LED index mapping:

          (31)              (32)              (33)                                    (67)              (66)              (65)
┌────────┬────────┬────────┬────────┬────────┬────────┐                          ┌────────┬────────┬────────┬────────┬────────┬────────┐
│0       │1       │2       │3       │4       │5       │                          │39      │38      │37      │36      │35      │34      │
├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
│11      │10      │9       │8       │7       │6       │                          │40      │41      │42      │43      │44      │45      │
├────────┼────────┼────────┼────────┼────────┼────────┤                          ├────────┼────────┼────────┼────────┼────────┼────────┤
│12      │13      │14      │15      │16      │17      │                          │51      │50      │49      │48      │47      │46      │
├────────┼────────┼────────┼────────┼────────┼────────┼────────┐        ┌────────┼────────┼────────┼────────┼────────┼────────┼────────┤
│23      │22      │21      │20      │19      │18      │27      │        │61      │52      │53      │54      │55      │56      │57      │
└────────┴────────┴────────┴───┬────┴───┬────┴───┬────┴───┬────┘        └───┬────┴───┬────┴───┬────┴───┬────┴────────┴────────┴────────┘
                               │24      │25      │26      │                 │60      │59      │58      │
                               └────────┴────────┴────────┘                 └────────┴────────┴────────┘
          (30)              (29)              (28)                                    (62)              (63)              (64)

*/

#define HSV_KEYCAP_BLUE 172, 255, 120
#define HSV_KEYCAP_ORANGE 2, 255, 120
#define HSV_KEYCAP_WHITE 0, 0, 120

#define LED_ALL 0, 67

#define LED_LEFT_UNDERGLOW_ALL 28, 6
#define LED_LEFT_UNDERGLOW_TOP 31, 3
#define LED_LEFT_UNDERGLOW_BOTTOM 28, 3
#define LED_LEFT_NUMBERS_ROW 1, 5

#define LED_RIGHT_UNDERGLOW_ALL 62, 6
#define LED_RIGHT_UNDERGLOW_TOP 65, 3
#define LED_RIGHT_UNDERGLOW_BOTTOM 62, 3
#define LED_RIGHT_NUMBERS_ROW 35, 5

#define LED_ESC_KEY 0, 1
#define LED_HJKL_ROW 48, 4

const rgblight_segment_t PROGMEM QWERTY_LIGHT_LAYER[] = RGBLIGHT_LAYER_SEGMENTS(
    {LED_ALL, HSV_OFF},
    {LED_ESC_KEY, HSV_KEYCAP_ORANGE},

    {LED_LEFT_UNDERGLOW_TOP, HSV_KEYCAP_BLUE},
    {LED_RIGHT_UNDERGLOW_TOP, HSV_KEYCAP_BLUE},
    {LED_LEFT_UNDERGLOW_BOTTOM, HSV_KEYCAP_WHITE},
    {LED_RIGHT_UNDERGLOW_BOTTOM, HSV_KEYCAP_WHITE},

    {LED_HJKL_ROW, HSV_KEYCAP_ORANGE},

    {LED_LEFT_NUMBERS_ROW, HSV_KEYCAP_BLUE},
    {LED_RIGHT_NUMBERS_ROW, HSV_KEYCAP_BLUE},

    {11, 2, HSV_KEYCAP_WHITE},
    {23, 5, HSV_KEYCAP_WHITE},
    {57, 5, HSV_KEYCAP_WHITE},
    {34, 1, HSV_KEYCAP_WHITE},
    {45, 2, HSV_KEYCAP_WHITE}
);

const rgblight_segment_t PROGMEM RIGHT_LIGHT_LAYER[] = RGBLIGHT_LAYER_SEGMENTS(
    {LED_ALL, HSV_OFF},
    {LED_HJKL_ROW, HSV_KEYCAP_ORANGE},
    {LED_RIGHT_NUMBERS_ROW, HSV_KEYCAP_BLUE},
    {LED_RIGHT_UNDERGLOW_TOP, HSV_KEYCAP_BLUE},
    {LED_RIGHT_UNDERGLOW_BOTTOM, HSV_KEYCAP_WHITE}
);

const rgblight_segment_t* const PROGMEM MY_LIGHT_LAYERS[] = RGBLIGHT_LAYERS_LIST(
    QWERTY_LIGHT_LAYER,
    RIGHT_LIGHT_LAYER
);
