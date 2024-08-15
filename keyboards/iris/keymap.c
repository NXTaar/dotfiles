#include QMK_KEYBOARD_H

enum LAYERS { BASE, NAV, NUM, SERVICE };

// clang-format off
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[BASE] = LAYOUT(
            QK_GESC, KC_1,          KC_1,         KC_3,         KC_4,         KC_5,                                     KC_6,            KC_7,         KC_8,         KC_9,         KC_0,            KC_BSPC,
            KC_TAB , KC_Q,          KC_W,         KC_E,         KC_R,         KC_T,                                     KC_Y,            KC_U,         KC_I,         KC_O,         KC_P,            KC_DEL ,
            KC_LCTL, LGUI_T(KC_A),  LALT_T(KC_S), LCTL_T(KC_D), LSFT_T(KC_F), KC_G,                                     KC_H,            LSFT_T(KC_J), LCTL_T(KC_K), LALT_T(KC_L), LGUI_T(KC_SCLN), KC_QUOT,
            KC_LSFT, KC_Z,          KC_X,         KC_C,         KC_V,         KC_B,   _______,                 KC_MPLY, KC_N,            KC_M,         KC_COMM,      KC_DOT ,      KC_SLSH,         KC_BSLS,
                                                                KC_ESC,       KC_TAB, KC_SPC,                  KC_BSPC, LT(NAV, KC_ENT), LT(SERVICE, KC_DEL)
    ),
    // ,
	// [1] = LAYOUT(
    //         KC_TILD, KC_EXLM, KC_AT,   KC_HASH, KC_DLR , KC_PERC,                               KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_PGUP,
    //         KC_GRV , _______, KC_UP,   _______, QK_BOOT, _______,                               _______, KC_P7,   KC_P8,   KC_P9,   KC_P0,   KC_PGDN,
    //         KC_DEL , KC_LEFT, KC_DOWN, KC_RGHT, _______, KC_LBRC,                               KC_RBRC, KC_P4,   KC_P5,   KC_P6,   KC_PLUS, KC_PIPE,
    //         RGB_MOD, EE_CLR , _______, _______, _______, KC_LCBR, KC_LPRN,             KC_RPRN, KC_RCBR, KC_P1,   KC_P2,   KC_P3,   KC_MINS, _______,
    //                                             _______, _______, KC_DEL ,             KC_DEL , _______, KC_P0
    // ),
    [SERVICE] = LAYOUT(
            QK_BOOT, _______, _______, _______, _______, _______,                               _______,          _______, _______, _______,          _______, QK_BOOT,
            _______, _______, _______, _______, _______, _______,                               _______,          _______, _______, _______,          _______, _______,
            _______, _______, _______, _______, _______, _______,                               RGB_MODE_REVERSE, RGB_VAD, RGB_VAI, RGB_MODE_FORWARD, _______, _______,
            _______, _______, _______, _______, _______, _______, _______,             RGB_TOG, _______,          _______, _______, _______,          _______, _______,
                                                _______, _______, _______,             _______, _______,          _______
    ),
    [NAV] = LAYOUT(
            _______, _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
            _______, _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
            _______, _______, _______, _______, _______, _______,                               KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______, _______,
            _______, _______, _______, _______, _______, _______, _______,             _______, _______, _______, _______, _______, _______, _______,
                                                _______, _______, _______,             _______, _______, _______
    ),
    [NUM] = LAYOUT(
            _______, _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
            _______, _______, KC_7,    KC_8,    KC_9,    _______,                               _______, _______, _______, _______, _______, _______,
            _______, _______, KC_4,    KC_5,    KC_6,    _______,                               _______, KC_LSFT, KC_LCTL, KC_LALT, KC_LGUI, _______,
            _______, _______, KC_1,    KC_2,    KC_3,    _______, _______,             _______, _______, _______, _______, _______, _______, _______,
                                                _______, KC_0,    _______,             _______, _______, _______
    )
    // [CHANGE_ME] = LAYOUT(
    //         _______ħ _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
    //         _______, _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
    //         _______, _______, _______, _______, _______, _______,                               _______, _______, _______, _______, _______, _______,
    //         _______, _______, _______, _______, _______, _______, _______,             _______, _______, _______, _______, _______, _______, _______,
    //                                             _______, _______, _______,             _______, _______, _______
    // )
	// [SERVICE] = LAYOUT(
    //         KC_F12 , KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                                 KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10 , KC_F11 ,
    //         RGB_TOG, KC_EXLM, KC_AT,   KC_HASH, KC_DLR , KC_PERC,                               KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, QK_BOOT,
    //         RGB_MOD, KC_MPRV, KC_MNXT, KC_VOLU, KC_PGUP, KC_UNDS,                               KC_EQL , KC_HOME, RGB_HUI, RGB_SAI, RGB_VAI, KC_BSLS,
    //         KC_MUTE, KC_MSTP, KC_MPLY, KC_VOLD, KC_PGDN, KC_MINS, KC_LPRN,             _______, KC_PLUS, KC_END , RGB_HUD, RGB_SAD, RGB_VAD, EE_CLR ,
    //                                             _______, _______, _______,             _______, KC_COPY, _______
    // )
};
// clang-format on

#if defined(ENCODER_ENABLE) && defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    [BASE]    = {ENCODER_CCW_CW(KC_NO, KC_NO), ENCODER_CCW_CW(KC_VOLD, KC_VOLU)},
    [SERVICE] = {ENCODER_CCW_CW(KC_NO, KC_NO), ENCODER_CCW_CW(KC_NO, KC_NO)},
    [NAV]     = {ENCODER_CCW_CW(KC_NO, KC_NO), ENCODER_CCW_CW(KC_PGUP, KC_PGDN)},
    [NUM]     = {ENCODER_CCW_CW(KC_NO, KC_NO), ENCODER_CCW_CW(KC_NO, KC_NO)},
};
#endif
