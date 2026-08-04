# comptime enums
# TODO build EnumType traits

comptime EnumType = Comparable & ImplicitlyCopyable & Writable


@fieldwise_init
struct Side(EnumType):
    var value: UInt8

    comptime SIDE_LEFT: Side = Side(0)
    comptime SIDE_TOP: Side = Side(1)
    comptime SIDE_RIGHT: Side = Side(2)
    comptime SIDE_BOTTOM: Side = Side(3)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Corner(EnumType):
    var value: UInt8

    comptime CORNER_TOP_LEFT: Corner = Corner(0)
    comptime CORNER_TOP_RIGHT: Corner = Corner(1)
    comptime CORNER_BOTTOM_RIGHT: Corner = Corner(2)
    comptime CORNER_BOTTOM_LEFT: Corner = Corner(3)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Orientation(EnumType):
    var value: UInt8

    comptime VERTICAL: Orientation = Orientation(1)
    comptime HORIZONTAL: Orientation = Orientation(0)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct ClockDirection(EnumType):
    var value: UInt8

    comptime CLOCKWISE: ClockDirection = ClockDirection(0)
    comptime COUNTERCLOCKWISE: ClockDirection = ClockDirection(1)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct HorizontalAlignment(EnumType):
    var value: UInt8

    comptime HORIZONTAL_ALIGNMENT_LEFT: HorizontalAlignment = HorizontalAlignment(
        0
    )
    comptime HORIZONTAL_ALIGNMENT_CENTER: HorizontalAlignment = HorizontalAlignment(
        1
    )
    comptime HORIZONTAL_ALIGNMENT_RIGHT: HorizontalAlignment = HorizontalAlignment(
        2
    )
    comptime HORIZONTAL_ALIGNMENT_FILL: HorizontalAlignment = HorizontalAlignment(
        3
    )

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct VerticalAlignment(EnumType):
    var value: UInt8

    comptime VERTICAL_ALIGNMENT_TOP: VerticalAlignment = VerticalAlignment(0)
    comptime VERTICAL_ALIGNMENT_CENTER: VerticalAlignment = VerticalAlignment(1)
    comptime VERTICAL_ALIGNMENT_BOTTOM: VerticalAlignment = VerticalAlignment(2)
    comptime VERTICAL_ALIGNMENT_FILL: VerticalAlignment = VerticalAlignment(3)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct InlineAlignment(EnumType):
    var value: UInt8

    comptime INLINE_ALIGNMENT_TOP_TO: InlineAlignment = InlineAlignment(0)
    comptime INLINE_ALIGNMENT_CENTER_TO: InlineAlignment = InlineAlignment(1)
    comptime INLINE_ALIGNMENT_BASELINE_TO: InlineAlignment = InlineAlignment(3)
    comptime INLINE_ALIGNMENT_BOTTOM_TO: InlineAlignment = InlineAlignment(2)
    comptime INLINE_ALIGNMENT_TO_TOP: InlineAlignment = InlineAlignment(0)
    comptime INLINE_ALIGNMENT_TO_CENTER: InlineAlignment = InlineAlignment(4)
    comptime INLINE_ALIGNMENT_TO_BASELINE: InlineAlignment = InlineAlignment(8)
    comptime INLINE_ALIGNMENT_TO_BOTTOM: InlineAlignment = InlineAlignment(12)
    comptime INLINE_ALIGNMENT_TOP: InlineAlignment = InlineAlignment(0)
    comptime INLINE_ALIGNMENT_CENTER: InlineAlignment = InlineAlignment(5)
    comptime INLINE_ALIGNMENT_BOTTOM: InlineAlignment = InlineAlignment(14)
    comptime INLINE_ALIGNMENT_IMAGE_MASK: InlineAlignment = InlineAlignment(3)
    comptime INLINE_ALIGNMENT_TEXT_MASK: InlineAlignment = InlineAlignment(12)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct EulerOrder(EnumType):
    var value: UInt8

    comptime EULER_ORDER_XYZ: EulerOrder = EulerOrder(0)
    comptime EULER_ORDER_XZY: EulerOrder = EulerOrder(1)
    comptime EULER_ORDER_YXZ: EulerOrder = EulerOrder(2)
    comptime EULER_ORDER_YZX: EulerOrder = EulerOrder(3)
    comptime EULER_ORDER_ZXY: EulerOrder = EulerOrder(4)
    comptime EULER_ORDER_ZYX: EulerOrder = EulerOrder(5)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Key(EnumType):
    var value: UInt32

    comptime KEY_NONE: Key = Key(0)
    comptime KEY_SPECIAL: Key = Key(4194304)
    comptime KEY_ESCAPE: Key = Key(4194305)
    comptime KEY_TAB: Key = Key(4194306)
    comptime KEY_BACKTAB: Key = Key(4194307)
    comptime KEY_BACKSPACE: Key = Key(4194308)
    comptime KEY_ENTER: Key = Key(4194309)
    comptime KEY_KP_ENTER: Key = Key(4194310)
    comptime KEY_INSERT: Key = Key(4194311)
    comptime KEY_DELETE: Key = Key(4194312)
    comptime KEY_PAUSE: Key = Key(4194313)
    comptime KEY_PRINT: Key = Key(4194314)
    comptime KEY_SYSREQ: Key = Key(4194315)
    comptime KEY_CLEAR: Key = Key(4194316)
    comptime KEY_HOME: Key = Key(4194317)
    comptime KEY_END: Key = Key(4194318)
    comptime KEY_LEFT: Key = Key(4194319)
    comptime KEY_UP: Key = Key(4194320)
    comptime KEY_RIGHT: Key = Key(4194321)
    comptime KEY_DOWN: Key = Key(4194322)
    comptime KEY_PAGEUP: Key = Key(4194323)
    comptime KEY_PAGEDOWN: Key = Key(4194324)
    comptime KEY_SHIFT: Key = Key(4194325)
    comptime KEY_CTRL: Key = Key(4194326)
    comptime KEY_META: Key = Key(4194327)
    comptime KEY_ALT: Key = Key(4194328)
    comptime KEY_CAPSLOCK: Key = Key(4194329)
    comptime KEY_NUMLOCK: Key = Key(4194330)
    comptime KEY_SCROLLLOCK: Key = Key(4194331)
    comptime KEY_F1: Key = Key(4194332)
    comptime KEY_F2: Key = Key(4194333)
    comptime KEY_F3: Key = Key(4194334)
    comptime KEY_F4: Key = Key(4194335)
    comptime KEY_F5: Key = Key(4194336)
    comptime KEY_F6: Key = Key(4194337)
    comptime KEY_F7: Key = Key(4194338)
    comptime KEY_F8: Key = Key(4194339)
    comptime KEY_F9: Key = Key(4194340)
    comptime KEY_F10: Key = Key(4194341)
    comptime KEY_F11: Key = Key(4194342)
    comptime KEY_F12: Key = Key(4194343)
    comptime KEY_F13: Key = Key(4194344)
    comptime KEY_F14: Key = Key(4194345)
    comptime KEY_F15: Key = Key(4194346)
    comptime KEY_F16: Key = Key(4194347)
    comptime KEY_F17: Key = Key(4194348)
    comptime KEY_F18: Key = Key(4194349)
    comptime KEY_F19: Key = Key(4194350)
    comptime KEY_F20: Key = Key(4194351)
    comptime KEY_F21: Key = Key(4194352)
    comptime KEY_F22: Key = Key(4194353)
    comptime KEY_F23: Key = Key(4194354)
    comptime KEY_F24: Key = Key(4194355)
    comptime KEY_F25: Key = Key(4194356)
    comptime KEY_F26: Key = Key(4194357)
    comptime KEY_F27: Key = Key(4194358)
    comptime KEY_F28: Key = Key(4194359)
    comptime KEY_F29: Key = Key(4194360)
    comptime KEY_F30: Key = Key(4194361)
    comptime KEY_F31: Key = Key(4194362)
    comptime KEY_F32: Key = Key(4194363)
    comptime KEY_F33: Key = Key(4194364)
    comptime KEY_F34: Key = Key(4194365)
    comptime KEY_F35: Key = Key(4194366)
    comptime KEY_KP_MULTIPLY: Key = Key(4194433)
    comptime KEY_KP_DIVIDE: Key = Key(4194434)
    comptime KEY_KP_SUBTRACT: Key = Key(4194435)
    comptime KEY_KP_PERIOD: Key = Key(4194436)
    comptime KEY_KP_ADD: Key = Key(4194437)
    comptime KEY_KP_0: Key = Key(4194438)
    comptime KEY_KP_1: Key = Key(4194439)
    comptime KEY_KP_2: Key = Key(4194440)
    comptime KEY_KP_3: Key = Key(4194441)
    comptime KEY_KP_4: Key = Key(4194442)
    comptime KEY_KP_5: Key = Key(4194443)
    comptime KEY_KP_6: Key = Key(4194444)
    comptime KEY_KP_7: Key = Key(4194445)
    comptime KEY_KP_8: Key = Key(4194446)
    comptime KEY_KP_9: Key = Key(4194447)
    comptime KEY_MENU: Key = Key(4194370)
    comptime KEY_HYPER: Key = Key(4194371)
    comptime KEY_HELP: Key = Key(4194373)
    comptime KEY_BACK: Key = Key(4194376)
    comptime KEY_FORWARD: Key = Key(4194377)
    comptime KEY_STOP: Key = Key(4194378)
    comptime KEY_REFRESH: Key = Key(4194379)
    comptime KEY_VOLUMEDOWN: Key = Key(4194380)
    comptime KEY_VOLUMEMUTE: Key = Key(4194381)
    comptime KEY_VOLUMEUP: Key = Key(4194382)
    comptime KEY_MEDIAPLAY: Key = Key(4194388)
    comptime KEY_MEDIASTOP: Key = Key(4194389)
    comptime KEY_MEDIAPREVIOUS: Key = Key(4194390)
    comptime KEY_MEDIANEXT: Key = Key(4194391)
    comptime KEY_MEDIARECORD: Key = Key(4194392)
    comptime KEY_HOMEPAGE: Key = Key(4194393)
    comptime KEY_FAVORITES: Key = Key(4194394)
    comptime KEY_SEARCH: Key = Key(4194395)
    comptime KEY_STANDBY: Key = Key(4194396)
    comptime KEY_OPENURL: Key = Key(4194397)
    comptime KEY_LAUNCHMAIL: Key = Key(4194398)
    comptime KEY_LAUNCHMEDIA: Key = Key(4194399)
    comptime KEY_LAUNCH0: Key = Key(4194400)
    comptime KEY_LAUNCH1: Key = Key(4194401)
    comptime KEY_LAUNCH2: Key = Key(4194402)
    comptime KEY_LAUNCH3: Key = Key(4194403)
    comptime KEY_LAUNCH4: Key = Key(4194404)
    comptime KEY_LAUNCH5: Key = Key(4194405)
    comptime KEY_LAUNCH6: Key = Key(4194406)
    comptime KEY_LAUNCH7: Key = Key(4194407)
    comptime KEY_LAUNCH8: Key = Key(4194408)
    comptime KEY_LAUNCH9: Key = Key(4194409)
    comptime KEY_LAUNCHA: Key = Key(4194410)
    comptime KEY_LAUNCHB: Key = Key(4194411)
    comptime KEY_LAUNCHC: Key = Key(4194412)
    comptime KEY_LAUNCHD: Key = Key(4194413)
    comptime KEY_LAUNCHE: Key = Key(4194414)
    comptime KEY_LAUNCHF: Key = Key(4194415)
    comptime KEY_GLOBE: Key = Key(4194416)
    comptime KEY_KEYBOARD: Key = Key(4194417)
    comptime KEY_JIS_EISU: Key = Key(4194418)
    comptime KEY_JIS_KANA: Key = Key(4194419)
    comptime KEY_UNKNOWN: Key = Key(8388607)
    comptime KEY_SPACE: Key = Key(32)
    comptime KEY_EXCLAM: Key = Key(33)
    comptime KEY_QUOTEDBL: Key = Key(34)
    comptime KEY_NUMBERSIGN: Key = Key(35)
    comptime KEY_DOLLAR: Key = Key(36)
    comptime KEY_PERCENT: Key = Key(37)
    comptime KEY_AMPERSAND: Key = Key(38)
    comptime KEY_APOSTROPHE: Key = Key(39)
    comptime KEY_PARENLEFT: Key = Key(40)
    comptime KEY_PARENRIGHT: Key = Key(41)
    comptime KEY_ASTERISK: Key = Key(42)
    comptime KEY_PLUS: Key = Key(43)
    comptime KEY_COMMA: Key = Key(44)
    comptime KEY_MINUS: Key = Key(45)
    comptime KEY_PERIOD: Key = Key(46)
    comptime KEY_SLASH: Key = Key(47)
    comptime KEY_0: Key = Key(48)
    comptime KEY_1: Key = Key(49)
    comptime KEY_2: Key = Key(50)
    comptime KEY_3: Key = Key(51)
    comptime KEY_4: Key = Key(52)
    comptime KEY_5: Key = Key(53)
    comptime KEY_6: Key = Key(54)
    comptime KEY_7: Key = Key(55)
    comptime KEY_8: Key = Key(56)
    comptime KEY_9: Key = Key(57)
    comptime KEY_COLON: Key = Key(58)
    comptime KEY_SEMICOLON: Key = Key(59)
    comptime KEY_LESS: Key = Key(60)
    comptime KEY_EQUAL: Key = Key(61)
    comptime KEY_GREATER: Key = Key(62)
    comptime KEY_QUESTION: Key = Key(63)
    comptime KEY_AT: Key = Key(64)
    comptime KEY_A: Key = Key(65)
    comptime KEY_B: Key = Key(66)
    comptime KEY_C: Key = Key(67)
    comptime KEY_D: Key = Key(68)
    comptime KEY_E: Key = Key(69)
    comptime KEY_F: Key = Key(70)
    comptime KEY_G: Key = Key(71)
    comptime KEY_H: Key = Key(72)
    comptime KEY_I: Key = Key(73)
    comptime KEY_J: Key = Key(74)
    comptime KEY_K: Key = Key(75)
    comptime KEY_L: Key = Key(76)
    comptime KEY_M: Key = Key(77)
    comptime KEY_N: Key = Key(78)
    comptime KEY_O: Key = Key(79)
    comptime KEY_P: Key = Key(80)
    comptime KEY_Q: Key = Key(81)
    comptime KEY_R: Key = Key(82)
    comptime KEY_S: Key = Key(83)
    comptime KEY_T: Key = Key(84)
    comptime KEY_U: Key = Key(85)
    comptime KEY_V: Key = Key(86)
    comptime KEY_W: Key = Key(87)
    comptime KEY_X: Key = Key(88)
    comptime KEY_Y: Key = Key(89)
    comptime KEY_Z: Key = Key(90)
    comptime KEY_BRACKETLEFT: Key = Key(91)
    comptime KEY_BACKSLASH: Key = Key(92)
    comptime KEY_BRACKETRIGHT: Key = Key(93)
    comptime KEY_ASCIICIRCUM: Key = Key(94)
    comptime KEY_UNDERSCORE: Key = Key(95)
    comptime KEY_QUOTELEFT: Key = Key(96)
    comptime KEY_BRACELEFT: Key = Key(123)
    comptime KEY_BAR: Key = Key(124)
    comptime KEY_BRACERIGHT: Key = Key(125)
    comptime KEY_ASCIITILDE: Key = Key(126)
    comptime KEY_YEN: Key = Key(165)
    comptime KEY_SECTION: Key = Key(167)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct KeyModifierMask(EnumType):
    var value: UInt32

    comptime KEY_CODE_MASK: KeyModifierMask = KeyModifierMask(8388607)
    comptime KEY_MODIFIER_MASK: KeyModifierMask = KeyModifierMask(2130706432)
    comptime KEY_MASK_CMD_OR_CTRL: KeyModifierMask = KeyModifierMask(16777216)
    comptime KEY_MASK_SHIFT: KeyModifierMask = KeyModifierMask(33554432)
    comptime KEY_MASK_ALT: KeyModifierMask = KeyModifierMask(67108864)
    comptime KEY_MASK_META: KeyModifierMask = KeyModifierMask(134217728)
    comptime KEY_MASK_CTRL: KeyModifierMask = KeyModifierMask(268435456)
    comptime KEY_MASK_KPAD: KeyModifierMask = KeyModifierMask(536870912)
    comptime KEY_MASK_GROUP_SWITCH: KeyModifierMask = KeyModifierMask(
        1073741824
    )

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct KeyLocation(EnumType):
    var value: UInt8

    comptime KEY_LOCATION_UNSPECIFIED: KeyLocation = KeyLocation(0)
    comptime KEY_LOCATION_LEFT: KeyLocation = KeyLocation(1)
    comptime KEY_LOCATION_RIGHT: KeyLocation = KeyLocation(2)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MouseButton(EnumType):
    var value: UInt8

    comptime MOUSE_BUTTON_NONE: MouseButton = MouseButton(0)
    comptime MOUSE_BUTTON_LEFT: MouseButton = MouseButton(1)
    comptime MOUSE_BUTTON_RIGHT: MouseButton = MouseButton(2)
    comptime MOUSE_BUTTON_MIDDLE: MouseButton = MouseButton(3)
    comptime MOUSE_BUTTON_WHEEL_UP: MouseButton = MouseButton(4)
    comptime MOUSE_BUTTON_WHEEL_DOWN: MouseButton = MouseButton(5)
    comptime MOUSE_BUTTON_WHEEL_LEFT: MouseButton = MouseButton(6)
    comptime MOUSE_BUTTON_WHEEL_RIGHT: MouseButton = MouseButton(7)
    comptime MOUSE_BUTTON_XBUTTON1: MouseButton = MouseButton(8)
    comptime MOUSE_BUTTON_XBUTTON2: MouseButton = MouseButton(9)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MouseButtonMask(EnumType):
    var value: UInt16

    comptime MOUSE_BUTTON_MASK_LEFT: MouseButtonMask = MouseButtonMask(1)
    comptime MOUSE_BUTTON_MASK_RIGHT: MouseButtonMask = MouseButtonMask(2)
    comptime MOUSE_BUTTON_MASK_MIDDLE: MouseButtonMask = MouseButtonMask(4)
    comptime MOUSE_BUTTON_MASK_MB_XBUTTON1: MouseButtonMask = MouseButtonMask(
        128
    )
    comptime MOUSE_BUTTON_MASK_MB_XBUTTON2: MouseButtonMask = MouseButtonMask(
        256
    )

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct JoyButton(EnumType):
    var value: Int16

    comptime JOY_BUTTON_INVALID: JoyButton = JoyButton(-1)
    comptime JOY_BUTTON_A: JoyButton = JoyButton(0)
    comptime JOY_BUTTON_B: JoyButton = JoyButton(1)
    comptime JOY_BUTTON_X: JoyButton = JoyButton(2)
    comptime JOY_BUTTON_Y: JoyButton = JoyButton(3)
    comptime JOY_BUTTON_BACK: JoyButton = JoyButton(4)
    comptime JOY_BUTTON_GUIDE: JoyButton = JoyButton(5)
    comptime JOY_BUTTON_START: JoyButton = JoyButton(6)
    comptime JOY_BUTTON_LEFT_STICK: JoyButton = JoyButton(7)
    comptime JOY_BUTTON_RIGHT_STICK: JoyButton = JoyButton(8)
    comptime JOY_BUTTON_LEFT_SHOULDER: JoyButton = JoyButton(9)
    comptime JOY_BUTTON_RIGHT_SHOULDER: JoyButton = JoyButton(10)
    comptime JOY_BUTTON_DPAD_UP: JoyButton = JoyButton(11)
    comptime JOY_BUTTON_DPAD_DOWN: JoyButton = JoyButton(12)
    comptime JOY_BUTTON_DPAD_LEFT: JoyButton = JoyButton(13)
    comptime JOY_BUTTON_DPAD_RIGHT: JoyButton = JoyButton(14)
    comptime JOY_BUTTON_MISC1: JoyButton = JoyButton(15)
    comptime JOY_BUTTON_PADDLE1: JoyButton = JoyButton(16)
    comptime JOY_BUTTON_PADDLE2: JoyButton = JoyButton(17)
    comptime JOY_BUTTON_PADDLE3: JoyButton = JoyButton(18)
    comptime JOY_BUTTON_PADDLE4: JoyButton = JoyButton(19)
    comptime JOY_BUTTON_TOUCHPAD: JoyButton = JoyButton(20)
    comptime JOY_BUTTON_SDL_MAX: JoyButton = JoyButton(21)
    comptime JOY_BUTTON_MAX: JoyButton = JoyButton(128)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct JoyAxis(EnumType):
    var value: UInt8

    comptime JOY_AXIS_INVALID: JoyAxis = JoyAxis(-1)
    comptime JOY_AXIS_LEFT_X: JoyAxis = JoyAxis(0)
    comptime JOY_AXIS_LEFT_Y: JoyAxis = JoyAxis(1)
    comptime JOY_AXIS_RIGHT_X: JoyAxis = JoyAxis(2)
    comptime JOY_AXIS_RIGHT_Y: JoyAxis = JoyAxis(3)
    comptime JOY_AXIS_TRIGGER_LEFT: JoyAxis = JoyAxis(4)
    comptime JOY_AXIS_TRIGGER_RIGHT: JoyAxis = JoyAxis(5)
    comptime JOY_AXIS_SDL_MAX: JoyAxis = JoyAxis(6)
    comptime JOY_AXIS_MAX: JoyAxis = JoyAxis(10)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MIDIMessage(EnumType):
    var value: UInt16

    comptime MIDI_MESSAGE_NONE: MIDIMessage = MIDIMessage(0)
    comptime MIDI_MESSAGE_NOTE_OFF: MIDIMessage = MIDIMessage(8)
    comptime MIDI_MESSAGE_NOTE_ON: MIDIMessage = MIDIMessage(9)
    comptime MIDI_MESSAGE_AFTERTOUCH: MIDIMessage = MIDIMessage(10)
    comptime MIDI_MESSAGE_CONTROL_CHANGE: MIDIMessage = MIDIMessage(11)
    comptime MIDI_MESSAGE_PROGRAM_CHANGE: MIDIMessage = MIDIMessage(12)
    comptime MIDI_MESSAGE_CHANNEL_PRESSURE: MIDIMessage = MIDIMessage(13)
    comptime MIDI_MESSAGE_PITCH_BEND: MIDIMessage = MIDIMessage(14)
    comptime MIDI_MESSAGE_SYSTEM_EXCLUSIVE: MIDIMessage = MIDIMessage(240)
    comptime MIDI_MESSAGE_QUARTER_FRAME: MIDIMessage = MIDIMessage(241)
    comptime MIDI_MESSAGE_SONG_POSITION_POINTER: MIDIMessage = MIDIMessage(242)
    comptime MIDI_MESSAGE_SONG_SELECT: MIDIMessage = MIDIMessage(243)
    comptime MIDI_MESSAGE_TUNE_REQUEST: MIDIMessage = MIDIMessage(246)
    comptime MIDI_MESSAGE_TIMING_CLOCK: MIDIMessage = MIDIMessage(248)
    comptime MIDI_MESSAGE_START: MIDIMessage = MIDIMessage(250)
    comptime MIDI_MESSAGE_CONTINUE: MIDIMessage = MIDIMessage(251)
    comptime MIDI_MESSAGE_STOP: MIDIMessage = MIDIMessage(252)
    comptime MIDI_MESSAGE_ACTIVE_SENSING: MIDIMessage = MIDIMessage(254)
    comptime MIDI_MESSAGE_SYSTEM_RESET: MIDIMessage = MIDIMessage(255)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Error(EnumType):
    var value: UInt8

    comptime OK: Error = Error(0)
    comptime FAILED: Error = Error(1)
    comptime ERR_UNAVAILABLE: Error = Error(2)
    comptime ERR_UNCONFIGURED: Error = Error(3)
    comptime ERR_UNAUTHORIZED: Error = Error(4)
    comptime ERR_PARAMETER_RANGE_ERROR: Error = Error(5)
    comptime ERR_OUT_OF_MEMORY: Error = Error(6)
    comptime ERR_FILE_NOT_FOUND: Error = Error(7)
    comptime ERR_FILE_BAD_DRIVE: Error = Error(8)
    comptime ERR_FILE_BAD_PATH: Error = Error(9)
    comptime ERR_FILE_NO_PERMISSION: Error = Error(10)
    comptime ERR_FILE_ALREADY_IN_USE: Error = Error(11)
    comptime ERR_FILE_CANT_OPEN: Error = Error(12)
    comptime ERR_FILE_CANT_WRITE: Error = Error(13)
    comptime ERR_FILE_CANT_READ: Error = Error(14)
    comptime ERR_FILE_UNRECOGNIZED: Error = Error(15)
    comptime ERR_FILE_CORRUPT: Error = Error(16)
    comptime ERR_FILE_MISSING_DEPENDENCIES: Error = Error(17)
    comptime ERR_FILE_EOF: Error = Error(18)
    comptime ERR_CANT_OPEN: Error = Error(19)
    comptime ERR_CANT_CREATE: Error = Error(20)
    comptime ERR_QUERY_FAILED: Error = Error(21)
    comptime ERR_ALREADY_IN_USE: Error = Error(22)
    comptime ERR_LOCKED: Error = Error(23)
    comptime ERR_TIMEOUT: Error = Error(24)
    comptime ERR_CANT_CONNECT: Error = Error(25)
    comptime ERR_CANT_RESOLVE: Error = Error(26)
    comptime ERR_CONNECTION_ERROR: Error = Error(27)
    comptime ERR_CANT_ACQUIRE_RESOURCE: Error = Error(28)
    comptime ERR_CANT_FORK: Error = Error(29)
    comptime ERR_INVALID_DATA: Error = Error(30)
    comptime ERR_INVALID_PARAMETER: Error = Error(31)
    comptime ERR_ALREADY_EXISTS: Error = Error(32)
    comptime ERR_DOES_NOT_EXIST: Error = Error(33)
    comptime ERR_DATABASE_CANT_READ: Error = Error(34)
    comptime ERR_DATABASE_CANT_WRITE: Error = Error(35)
    comptime ERR_COMPILATION_FAILED: Error = Error(36)
    comptime ERR_METHOD_NOT_FOUND: Error = Error(37)
    comptime ERR_LINK_FAILED: Error = Error(38)
    comptime ERR_SCRIPT_FAILED: Error = Error(39)
    comptime ERR_CYCLIC_LINK: Error = Error(40)
    comptime ERR_INVALID_DECLARATION: Error = Error(41)
    comptime ERR_DUPLICATE_SYMBOL: Error = Error(42)
    comptime ERR_PARSE_ERROR: Error = Error(43)
    comptime ERR_BUSY: Error = Error(44)
    comptime ERR_SKIP: Error = Error(45)
    comptime ERR_HELP: Error = Error(46)
    comptime ERR_BUG: Error = Error(47)
    comptime ERR_PRINTER_ON_FIRE: Error = Error(48)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct PropertyHint(EnumType):
    var value: UInt8

    comptime PROPERTY_HINT_NONE: PropertyHint = PropertyHint(0)
    comptime PROPERTY_HINT_RANGE: PropertyHint = PropertyHint(1)
    comptime PROPERTY_HINT_ENUM: PropertyHint = PropertyHint(2)
    comptime PROPERTY_HINT_ENUM_SUGGESTION: PropertyHint = PropertyHint(3)
    comptime PROPERTY_HINT_EXP_EASING: PropertyHint = PropertyHint(4)
    comptime PROPERTY_HINT_LINK: PropertyHint = PropertyHint(5)
    comptime PROPERTY_HINT_FLAGS: PropertyHint = PropertyHint(6)
    comptime PROPERTY_HINT_LAYERS_2D_RENDER: PropertyHint = PropertyHint(7)
    comptime PROPERTY_HINT_LAYERS_2D_PHYSICS: PropertyHint = PropertyHint(8)
    comptime PROPERTY_HINT_LAYERS_2D_NAVIGATION: PropertyHint = PropertyHint(9)
    comptime PROPERTY_HINT_LAYERS_3D_RENDER: PropertyHint = PropertyHint(10)
    comptime PROPERTY_HINT_LAYERS_3D_PHYSICS: PropertyHint = PropertyHint(11)
    comptime PROPERTY_HINT_LAYERS_3D_NAVIGATION: PropertyHint = PropertyHint(12)
    comptime PROPERTY_HINT_LAYERS_AVOIDANCE: PropertyHint = PropertyHint(37)
    comptime PROPERTY_HINT_FILE: PropertyHint = PropertyHint(13)
    comptime PROPERTY_HINT_DIR: PropertyHint = PropertyHint(14)
    comptime PROPERTY_HINT_GLOBAL_FILE: PropertyHint = PropertyHint(15)
    comptime PROPERTY_HINT_GLOBAL_DIR: PropertyHint = PropertyHint(16)
    comptime PROPERTY_HINT_RESOURCE_TYPE: PropertyHint = PropertyHint(17)
    comptime PROPERTY_HINT_MULTILINE_TEXT: PropertyHint = PropertyHint(18)
    comptime PROPERTY_HINT_EXPRESSION: PropertyHint = PropertyHint(19)
    comptime PROPERTY_HINT_PLACEHOLDER_TEXT: PropertyHint = PropertyHint(20)
    comptime PROPERTY_HINT_COLOR_NO_ALPHA: PropertyHint = PropertyHint(21)
    comptime PROPERTY_HINT_OBJECT_ID: PropertyHint = PropertyHint(22)
    comptime PROPERTY_HINT_TYPE_STRING: PropertyHint = PropertyHint(23)
    comptime PROPERTY_HINT_NODE_PATH_TO_EDITED_NODE: PropertyHint = PropertyHint(
        24
    )
    comptime PROPERTY_HINT_OBJECT_TOO_BIG: PropertyHint = PropertyHint(25)
    comptime PROPERTY_HINT_NODE_PATH_VALID_TYPES: PropertyHint = PropertyHint(
        26
    )
    comptime PROPERTY_HINT_SAVE_FILE: PropertyHint = PropertyHint(27)
    comptime PROPERTY_HINT_GLOBAL_SAVE_FILE: PropertyHint = PropertyHint(28)
    comptime PROPERTY_HINT_INT_IS_OBJECTID: PropertyHint = PropertyHint(29)
    comptime PROPERTY_HINT_INT_IS_POINTER: PropertyHint = PropertyHint(30)
    comptime PROPERTY_HINT_ARRAY_TYPE: PropertyHint = PropertyHint(31)
    comptime PROPERTY_HINT_DICTIONARY_TYPE: PropertyHint = PropertyHint(38)
    comptime PROPERTY_HINT_LOCALE_ID: PropertyHint = PropertyHint(32)
    comptime PROPERTY_HINT_LOCALIZABLE_STRING: PropertyHint = PropertyHint(33)
    comptime PROPERTY_HINT_NODE_TYPE: PropertyHint = PropertyHint(34)
    comptime PROPERTY_HINT_HIDE_QUATERNION_EDIT: PropertyHint = PropertyHint(35)
    comptime PROPERTY_HINT_PASSWORD: PropertyHint = PropertyHint(36)
    comptime PROPERTY_HINT_TOOL_BUTTON: PropertyHint = PropertyHint(39)
    comptime PROPERTY_HINT_ONESHOT: PropertyHint = PropertyHint(40)
    comptime PROPERTY_HINT_GROUP_ENABLE: PropertyHint = PropertyHint(42)
    comptime PROPERTY_HINT_INPUT_NAME: PropertyHint = PropertyHint(43)
    comptime PROPERTY_HINT_FILE_PATH: PropertyHint = PropertyHint(44)
    comptime PROPERTY_HINT_MAX: PropertyHint = PropertyHint(45)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct PropertyUsageFlags(EnumType):
    var value: UInt32

    comptime PROPERTY_USAGE_NONE: PropertyUsageFlags = PropertyUsageFlags(0)
    comptime PROPERTY_USAGE_STORAGE: PropertyUsageFlags = PropertyUsageFlags(2)
    comptime PROPERTY_USAGE_EDITOR: PropertyUsageFlags = PropertyUsageFlags(4)
    comptime PROPERTY_USAGE_INTERNAL: PropertyUsageFlags = PropertyUsageFlags(8)
    comptime PROPERTY_USAGE_CHECKABLE: PropertyUsageFlags = PropertyUsageFlags(
        16
    )
    comptime PROPERTY_USAGE_CHECKED: PropertyUsageFlags = PropertyUsageFlags(32)
    comptime PROPERTY_USAGE_GROUP: PropertyUsageFlags = PropertyUsageFlags(64)
    comptime PROPERTY_USAGE_CATEGORY: PropertyUsageFlags = PropertyUsageFlags(
        128
    )
    comptime PROPERTY_USAGE_SUBGROUP: PropertyUsageFlags = PropertyUsageFlags(
        256
    )
    comptime PROPERTY_USAGE_CLASS_IS_BITFIELD: PropertyUsageFlags = PropertyUsageFlags(
        512
    )
    comptime PROPERTY_USAGE_NO_INSTANCE_STATE: PropertyUsageFlags = PropertyUsageFlags(
        1024
    )
    comptime PROPERTY_USAGE_RESTART_IF_CHANGED: PropertyUsageFlags = PropertyUsageFlags(
        2048
    )
    comptime PROPERTY_USAGE_SCRIPT_VARIABLE: PropertyUsageFlags = PropertyUsageFlags(
        4096
    )
    comptime PROPERTY_USAGE_STORE_IF_NULL: PropertyUsageFlags = PropertyUsageFlags(
        8192
    )
    comptime PROPERTY_USAGE_UPDATE_ALL_IF_MODIFIED: PropertyUsageFlags = PropertyUsageFlags(
        16384
    )
    comptime PROPERTY_USAGE_SCRIPT_DEFAULT_VALUE: PropertyUsageFlags = PropertyUsageFlags(
        32768
    )
    comptime PROPERTY_USAGE_CLASS_IS_ENUM: PropertyUsageFlags = PropertyUsageFlags(
        65536
    )
    comptime PROPERTY_USAGE_NIL_IS_VARIANT: PropertyUsageFlags = PropertyUsageFlags(
        131072
    )
    comptime PROPERTY_USAGE_ARRAY: PropertyUsageFlags = PropertyUsageFlags(
        262144
    )
    comptime PROPERTY_USAGE_ALWAYS_DUPLICATE: PropertyUsageFlags = PropertyUsageFlags(
        524288
    )
    comptime PROPERTY_USAGE_NEVER_DUPLICATE: PropertyUsageFlags = PropertyUsageFlags(
        1048576
    )
    comptime PROPERTY_USAGE_HIGH_END_GFX: PropertyUsageFlags = PropertyUsageFlags(
        2097152
    )
    comptime PROPERTY_USAGE_NODE_PATH_FROM_SCENE_ROOT: PropertyUsageFlags = PropertyUsageFlags(
        4194304
    )
    comptime PROPERTY_USAGE_RESOURCE_NOT_PERSISTENT: PropertyUsageFlags = PropertyUsageFlags(
        8388608
    )
    comptime PROPERTY_USAGE_KEYING_INCREMENTS: PropertyUsageFlags = PropertyUsageFlags(
        16777216
    )
    comptime PROPERTY_USAGE_DEFERRED_SET_RESOURCE: PropertyUsageFlags = PropertyUsageFlags(
        33554432
    )
    comptime PROPERTY_USAGE_EDITOR_INSTANTIATE_OBJECT: PropertyUsageFlags = PropertyUsageFlags(
        67108864
    )
    comptime PROPERTY_USAGE_EDITOR_BASIC_SETTING: PropertyUsageFlags = PropertyUsageFlags(
        134217728
    )
    comptime PROPERTY_USAGE_READ_ONLY: PropertyUsageFlags = PropertyUsageFlags(
        268435456
    )
    comptime PROPERTY_USAGE_SECRET: PropertyUsageFlags = PropertyUsageFlags(
        536870912
    )
    comptime PROPERTY_USAGE_DEFAULT: PropertyUsageFlags = PropertyUsageFlags(6)
    comptime PROPERTY_USAGE_NO_EDITOR: PropertyUsageFlags = PropertyUsageFlags(
        2
    )

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MethodFlags(EnumType):
    var value: UInt8

    comptime METHOD_FLAG_NORMAL: MethodFlags = MethodFlags(1)
    comptime METHOD_FLAG_EDITOR: MethodFlags = MethodFlags(2)
    comptime METHOD_FLAG_CONST: MethodFlags = MethodFlags(4)
    comptime METHOD_FLAG_VIRTUAL: MethodFlags = MethodFlags(8)
    comptime METHOD_FLAG_VARARG: MethodFlags = MethodFlags(16)
    comptime METHOD_FLAG_STATIC: MethodFlags = MethodFlags(32)
    comptime METHOD_FLAG_OBJECT_CORE: MethodFlags = MethodFlags(64)
    comptime METHOD_FLAG_VIRTUAL_REQUIRED: MethodFlags = MethodFlags(128)
    comptime METHOD_FLAGS_DEFAULT: MethodFlags = MethodFlags(1)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Variant_Type(EnumType):
    var value: UInt8

    comptime TYPE_NIL: Variant_Type = Variant_Type(0)
    comptime TYPE_BOOL: Variant_Type = Variant_Type(1)
    comptime TYPE_INT: Variant_Type = Variant_Type(2)
    comptime TYPE_FLOAT: Variant_Type = Variant_Type(3)
    comptime TYPE_STRING: Variant_Type = Variant_Type(4)
    comptime TYPE_VECTOR2: Variant_Type = Variant_Type(5)
    comptime TYPE_VECTOR2I: Variant_Type = Variant_Type(6)
    comptime TYPE_RECT2: Variant_Type = Variant_Type(7)
    comptime TYPE_RECT2I: Variant_Type = Variant_Type(8)
    comptime TYPE_VECTOR3: Variant_Type = Variant_Type(9)
    comptime TYPE_VECTOR3I: Variant_Type = Variant_Type(10)
    comptime TYPE_TRANSFORM2D: Variant_Type = Variant_Type(11)
    comptime TYPE_VECTOR4: Variant_Type = Variant_Type(1)
    comptime TYPE_VECTOR4I: Variant_Type = Variant_Type(13)
    comptime TYPE_PLANE: Variant_Type = Variant_Type(14)
    comptime TYPE_QUATERNION: Variant_Type = Variant_Type(15)
    comptime TYPE_AABB: Variant_Type = Variant_Type(16)
    comptime TYPE_BASIS: Variant_Type = Variant_Type(17)
    comptime TYPE_TRANSFORM3D: Variant_Type = Variant_Type(18)
    comptime TYPE_PROJECTION: Variant_Type = Variant_Type(19)
    comptime TYPE_COLOR: Variant_Type = Variant_Type(20)
    comptime TYPE_STRING_NAME: Variant_Type = Variant_Type(21)
    comptime TYPE_NODE_PATH: Variant_Type = Variant_Type(22)
    comptime TYPE_RID: Variant_Type = Variant_Type(23)
    comptime TYPE_OBJECT: Variant_Type = Variant_Type(24)
    comptime TYPE_CALLABLE: Variant_Type = Variant_Type(25)
    comptime TYPE_SIGNAL: Variant_Type = Variant_Type(26)
    comptime TYPE_DICTIONARY: Variant_Type = Variant_Type(27)
    comptime TYPE_ARRAY: Variant_Type = Variant_Type(28)
    comptime TYPE_PACKED_BYTE_ARRAY: Variant_Type = Variant_Type(29)
    comptime TYPE_PACKED_INT32_ARRAY: Variant_Type = Variant_Type(30)
    comptime TYPE_PACKED_INT64_ARRAY: Variant_Type = Variant_Type(31)
    comptime TYPE_PACKED_FLOAT32_ARRAY: Variant_Type = Variant_Type(32)
    comptime TYPE_PACKED_FLOAT64_ARRAY: Variant_Type = Variant_Type(33)
    comptime TYPE_PACKED_STRING_ARRAY: Variant_Type = Variant_Type(34)
    comptime TYPE_PACKED_VECTOR2_ARRAY: Variant_Type = Variant_Type(35)
    comptime TYPE_PACKED_VECTOR3_ARRAY: Variant_Type = Variant_Type(36)
    comptime TYPE_PACKED_COLOR_ARRAY: Variant_Type = Variant_Type(37)
    comptime TYPE_PACKED_VECTOR4_ARRAY: Variant_Type = Variant_Type(38)
    comptime TYPE_MAX: Variant_Type = Variant_Type(39)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Variant_Operator(EnumType):
    var value: UInt8

    comptime OP_EQUAL: Variant_Operator = Variant_Operator(0)
    comptime OP_NOT_EQUAL: Variant_Operator = Variant_Operator(1)
    comptime OP_LESS: Variant_Operator = Variant_Operator(2)
    comptime OP_LESS_EQUAL: Variant_Operator = Variant_Operator(3)
    comptime OP_GREATER: Variant_Operator = Variant_Operator(4)
    comptime OP_GREATER_EQUAL: Variant_Operator = Variant_Operator(5)
    comptime OP_ADD: Variant_Operator = Variant_Operator(6)
    comptime OP_SUBTRACT: Variant_Operator = Variant_Operator(7)
    comptime OP_MULTIPLY: Variant_Operator = Variant_Operator(8)
    comptime OP_DIVIDE: Variant_Operator = Variant_Operator(9)
    comptime OP_NEGATE: Variant_Operator = Variant_Operator(10)
    comptime OP_POSITIVE: Variant_Operator = Variant_Operator(11)
    comptime OP_MODULE: Variant_Operator = Variant_Operator(12)
    comptime OP_POWER: Variant_Operator = Variant_Operator(13)
    comptime OP_SHIFT_LEFT: Variant_Operator = Variant_Operator(14)
    comptime OP_SHIFT_RIGHT: Variant_Operator = Variant_Operator(15)
    comptime OP_BIT_AND: Variant_Operator = Variant_Operator(16)
    comptime OP_BIT_OR: Variant_Operator = Variant_Operator(17)
    comptime OP_BIT_XOR: Variant_Operator = Variant_Operator(18)
    comptime OP_BIT_NEGATE: Variant_Operator = Variant_Operator(19)
    comptime OP_AND: Variant_Operator = Variant_Operator(20)
    comptime OP_OR: Variant_Operator = Variant_Operator(21)
    comptime OP_XOR: Variant_Operator = Variant_Operator(22)
    comptime OP_NOT: Variant_Operator = Variant_Operator(23)
    comptime OP_IN: Variant_Operator = Variant_Operator(24)
    comptime OP_MAX: Variant_Operator = Variant_Operator(25)

    fn __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    fn __ne__(self, other: Self) -> Bool:
        return not (self == other)

    fn __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    fn __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    fn __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    fn __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    fn write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    fn write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)
