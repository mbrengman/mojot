# Enums.


@fieldwise_init
struct Side:
    var value: UInt8

    comptime SIDE_LEFT  = Self(0)
    comptime SIDE_TOP  = Self(1)
    comptime SIDE_RIGHT  = Self(2)
    comptime SIDE_BOTTOM  = Self(3)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@explicit_destroy
@fieldwise_init
struct Axis(Movable):
    var value: UInt8

    comptime AXIS_X = Self(0)
    comptime AXIS_Y = Self(1)
    comptime AXIS_Z = Self(2)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct CallErrorType(TrivialRegisterPassable):
    var value: UInt8

    comptime OK = Self(0)
    comptime INVALID_METHOD = Self(1)
    comptime INVALID_ARGUMENT = Self(2)  # Expected a different variant type.
    comptime TOO_MANY_ARGUMENTS = Self(3)  # Expected lower number of arguments.
    comptime TOO_FEW_ARGUMENTS = Self(4)  # Expected higher number of arguments.
    comptime INSTANCE_IS_NULL = Self(5)
    comptime METHOD_NOT_CONST = Self(6)  # Used for const call.

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct ClassMethodFlags(TrivialRegisterPassable):
    var value: UInt8

    comptime NORMAL = Self(1)
    comptime EDITOR = Self(2)
    comptime CONST = Self(4)
    comptime VIRTUAL = Self(8)
    comptime VARARG = Self(16)
    comptime STATIC = Self(32)
    comptime DEFAULT = Self(1)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct ClassMethodArgumentMetadata(TrivialRegisterPassable):
    var value: UInt8

    comptime NONE = Self(0)
    comptime INT_IS_INT8 = Self(1)
    comptime INT_IS_INT16 = Self(2)
    comptime INT_IS_INT32 = Self(3)
    comptime INT_IS_INT64 = Self(4)
    comptime INT_IS_UINT8 = Self(5)
    comptime INT_IS_UINT16 = Self(6)
    comptime INT_IS_UINT32 = Self(7)
    comptime INT_IS_UINT64 = Self(8)
    comptime REAL_IS_FLOAT = Self(9)
    comptime REAL_IS_DOUBLE = Self(10)
    comptime INT_IS_CHAR16 = Self(11)
    comptime INT_IS_CHAR32 = Self(12)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)



@fieldwise_init
struct InitializationLevel(TrivialRegisterPassable):
    var value: UInt8

    comptime CORE = Self(0)
    comptime SERVERS = Self(1)
    comptime SCENE = Self(2)
    comptime EDITOR = Self(3)
    comptime MAX_LEVEL = Self(4)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value
    
    def __int__(self) -> UInt8:
        return self.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Corner(TrivialRegisterPassable):
    var value: UInt8

    comptime CORNER_TOP_LEFT = Self(0)
    comptime CORNER_TOP_RIGHT = Self(1)
    comptime CORNER_BOTTOM_RIGHT = Self(2)
    comptime CORNER_BOTTOM_LEFT = Self(3)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)
    

@fieldwise_init
struct Orientation(TrivialRegisterPassable):
    var value: UInt8

    comptime VERTICAL = Self(1)
    comptime HORIZONTAL = Self(0)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct ClockDirection(TrivialRegisterPassable):
    var value: UInt8

    comptime CLOCKWISE = Self(0)
    comptime COUNTERCLOCKWISE = Self(1)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct HorizontalAlignment(TrivialRegisterPassable):
    var value: UInt8

    comptime LEFT = Self(0)
    comptime CENTER = Self(1)
    comptime RIGHT = Self(2)
    comptime FILL = Self(3)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct VerticalAlignment(TrivialRegisterPassable):
    var value: UInt8

    comptime TOP = Self(0)
    comptime CENTER = Self(1)
    comptime BOTTOM = Self(2)
    comptime FILL = Self(3)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct InlineAlignment(TrivialRegisterPassable):
    var value: UInt8

    comptime TOP_TO = Self(0)
    comptime CENTER_TO = Self(1)
    comptime BASELINE_TO = Self(3)
    comptime BOTTOM_TO = Self(2)
    comptime TO_TOP = Self(0)
    comptime TO_CENTER = Self(4)
    comptime TO_BASELINE = Self(8)
    comptime TO_BOTTOM = Self(12)
    comptime TOP = Self(0)
    comptime CENTER = Self(5)
    comptime BOTTOM = Self(14)
    comptime IMAGE_MASK = Self(3)
    comptime TEXT_MASK = Self(12)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct EulerOrder(TrivialRegisterPassable):
    var value: UInt8

    comptime XYZ = Self(0)
    comptime XZY = Self(1)
    comptime YXZ = Self(2)
    comptime YZX = Self(3)
    comptime ZXY = Self(4)
    comptime ZYX = Self(5)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)

@fieldwise_init
struct Key(TrivialRegisterPassable):
    var value: UInt32

    comptime NONE = Self(0)
    comptime SPECIAL = Self(4194304)
    comptime ESCAPE = Self(4194305)
    comptime TAB = Self(4194306)
    comptime BACKTAB = Self(4194307)
    comptime BACKSPACE = Self(4194308)
    comptime ENTER = Self(4194309)
    comptime KP_ENTER = Self(4194310)
    comptime INSERT = Self(4194311)
    comptime DELETE = Self(4194312)
    comptime PAUSE = Self(4194313)
    comptime PRINT = Self(4194314)
    comptime SYSREQ = Self(4194315)
    comptime CLEAR = Self(4194316)
    comptime HOME = Self(4194317)
    comptime END = Self(4194318)
    comptime LEFT = Self(4194319)
    comptime UP = Self(4194320)
    comptime RIGHT = Self(4194321)
    comptime DOWN = Self(4194322)
    comptime PAGEUP = Self(4194323)
    comptime PAGEDOWN = Self(4194324)
    comptime SHIFT = Self(4194325)
    comptime CTRL = Self(4194326)
    comptime META = Self(4194327)
    comptime ALT = Self(4194328)
    comptime CAPSLOCK = Self(4194329)
    comptime NUMLOCK = Self(4194330)
    comptime SCROLLLOCK = Self(4194331)
    comptime F1 = Self(4194332)
    comptime F2 = Self(4194333)
    comptime F3 = Self(4194334)
    comptime F4 = Self(4194335)
    comptime F5 = Self(4194336)
    comptime F6 = Self(4194337)
    comptime F7 = Self(4194338)
    comptime F8 = Self(4194339)
    comptime F9 = Self(4194340)
    comptime F10 = Self(4194341)
    comptime F11 = Self(4194342)
    comptime F12 = Self(4194343)
    comptime F13 = Self(4194344)
    comptime F14 = Self(4194345)
    comptime F15 = Self(4194346)
    comptime F16 = Self(4194347)
    comptime F17 = Self(4194348)
    comptime F18 = Self(4194349)
    comptime F19 = Self(4194350)
    comptime F20 = Self(4194351)
    comptime F21 = Self(4194352)
    comptime F22 = Self(4194353)
    comptime F23 = Self(4194354)
    comptime F24 = Self(4194355)
    comptime F25 = Self(4194356)
    comptime F26 = Self(4194357)
    comptime F27 = Self(4194358)
    comptime F28 = Self(4194359)
    comptime F29 = Self(4194360)
    comptime F30 = Self(4194361)
    comptime F31 = Self(4194362)
    comptime F32 = Self(4194363)
    comptime F33 = Self(4194364)
    comptime F34 = Self(4194365)
    comptime F35 = Self(4194366)
    comptime KP_MULTIPLY = Self(4194433)
    comptime KP_DIVIDE = Self(4194434)
    comptime KP_SUBTRACT = Self(4194435)
    comptime KP_PERIOD = Self(4194436)
    comptime KP_ADD = Self(4194437)
    comptime KP_0 = Self(4194438)
    comptime KP_1 = Self(4194439)
    comptime KP_2 = Self(4194440)
    comptime KP_3 = Self(4194441)
    comptime KP_4 = Self(4194442)
    comptime KP_5 = Self(4194443)
    comptime KP_6 = Self(4194444)
    comptime KP_7 = Self(4194445)
    comptime KP_8 = Self(4194446)
    comptime KP_9 = Self(4194447)
    comptime MENU = Self(4194370)
    comptime HYPER = Self(4194371)
    comptime HELP = Self(4194373)
    comptime BACK = Self(4194376)
    comptime FORWARD = Self(4194377)
    comptime STOP = Self(4194378)
    comptime REFRESH = Self(4194379)
    comptime VOLUMEDOWN = Self(4194380)
    comptime VOLUMEMUTE = Self(4194381)
    comptime VOLUMEUP = Self(4194382)
    comptime MEDIAPLAY = Self(4194388)
    comptime MEDIASTOP = Self(4194389)
    comptime MEDIAPREVIOUS = Self(4194390)
    comptime MEDIANEXT = Self(4194391)
    comptime MEDIARECORD = Self(4194392)
    comptime HOMEPAGE = Self(4194393)
    comptime FAVORITES = Self(4194394)
    comptime SEARCH = Self(4194395)
    comptime STANDBY = Self(4194396)
    comptime OPENURL = Self(4194397)
    comptime LAUNCHMAIL = Self(4194398)
    comptime LAUNCHMEDIA = Self(4194399)
    comptime LAUNCH0 = Self(4194400)
    comptime LAUNCH1 = Self(4194401)
    comptime LAUNCH2 = Self(4194402)
    comptime LAUNCH3 = Self(4194403)
    comptime LAUNCH4 = Self(4194404)
    comptime LAUNCH5 = Self(4194405)
    comptime LAUNCH6 = Self(4194406)
    comptime LAUNCH7 = Self(4194407)
    comptime LAUNCH8 = Self(4194408)
    comptime LAUNCH9 = Self(4194409)
    comptime LAUNCHA = Self(4194410)
    comptime LAUNCHB = Self(4194411)
    comptime LAUNCHC = Self(4194412)
    comptime LAUNCHD = Self(4194413)
    comptime LAUNCHE = Self(4194414)
    comptime LAUNCHF = Self(4194415)
    comptime GLOBE = Self(4194416)
    comptime KEYBOARD = Self(4194417)
    comptime JIS_EISU = Self(4194418)
    comptime JIS_KANA = Self(4194419)
    comptime UNKNOWN = Self(8388607)
    comptime SPACE = Self(32)
    comptime EXCLAM = Self(33)
    comptime QUOTEDBL = Self(34)
    comptime NUMBERSIGN = Self(35)
    comptime DOLLAR = Self(36)
    comptime PERCENT = Self(37)
    comptime AMPERSAND = Self(38)
    comptime APOSTROPHE = Self(39)
    comptime PARENLEFT = Self(40)
    comptime PARENRIGHT = Self(41)
    comptime ASTERISK = Self(42)
    comptime PLUS = Self(43)
    comptime COMMA = Self(44)
    comptime MINUS = Self(45)
    comptime PERIOD = Self(46)
    comptime SLASH = Self(47)
    comptime _0 = Self(48)
    comptime _1 = Self(49)
    comptime _2 = Self(50)
    comptime _3 = Self(51)
    comptime _4 = Self(52)
    comptime _5 = Self(53)
    comptime _6 = Self(54)
    comptime _7 = Self(55)
    comptime _8 = Self(56)
    comptime _9 = Self(57)
    comptime COLON = Self(58)
    comptime SEMICOLON = Self(59)
    comptime LESS = Self(60)
    comptime EQUAL = Self(61)
    comptime GREATER = Self(62)
    comptime QUESTION = Self(63)
    comptime AT = Self(64)
    comptime A = Self(65)
    comptime B = Self(66)
    comptime C = Self(67)
    comptime D = Self(68)
    comptime E = Self(69)
    comptime F = Self(70)
    comptime G = Self(71)
    comptime H = Self(72)
    comptime I = Self(73)
    comptime J = Self(74)
    comptime K = Self(75)
    comptime L = Self(76)
    comptime M = Self(77)
    comptime N = Self(78)
    comptime O = Self(79)
    comptime P = Self(80)
    comptime Q = Self(81)
    comptime R = Self(82)
    comptime S = Self(83)
    comptime T = Self(84)
    comptime U = Self(85)
    comptime V = Self(86)
    comptime W = Self(87)
    comptime X = Self(88)
    comptime Y = Self(89)
    comptime Z = Self(90)
    comptime BRACKETLEFT = Self(91)
    comptime BACKSLASH = Self(92)
    comptime BRACKETRIGHT = Self(93)
    comptime ASCIICIRCUM = Self(94)
    comptime UNDERSCORE = Self(95)
    comptime QUOTELEFT = Self(96)
    comptime BRACELEFT = Self(123)
    comptime BAR = Self(124)
    comptime BRACERIGHT = Self(125)
    comptime ASCIITILDE = Self(126)
    comptime YEN = Self(165)
    comptime SECTION = Self(167)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)

@fieldwise_init
struct KeyModifierMask(TrivialRegisterPassable):
    var value: UInt32

    comptime CODE_MASK = Self(8_388_607)
    comptime MODIFIER_MASK = Self(2_130_706_432)
    comptime MASK_CMD_OR_CTRL = Self(16_777_216)
    comptime MASK_SHIFT = Self(33_554_432)
    comptime MASK_ALT = Self(67_108_864)
    comptime MASK_META = Self(134_217_728)
    comptime MASK_CTRL = Self(268_435_456)
    comptime MASK_KPAD = Self(536_870_912)
    comptime MASK_GROUP_SWITCH = Self(1_073_741_824)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MouseButton(TrivialRegisterPassable):
    var value: UInt8

    comptime NONE = Self(0)
    comptime LEFT = Self(1)
    comptime RIGHT = Self(2)
    comptime MIDDLE = Self(3)
    comptime WHEEL_UP = Self(4)
    comptime WHEEL_DOWN = Self(5)
    comptime WHEEL_LEFT = Self(6)
    comptime WHEEL_RIGHT = Self(7)
    comptime XBUTTON1 = Self(8)
    comptime XBUTTON2 = Self(9)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MouseButtonMask(TrivialRegisterPassable):
    var value: UInt16

    comptime LEFT = Self(1)
    comptime RIGHT = Self(2)
    comptime MIDDLE = Self(4)
    comptime MB_XBUTTON1 = Self(128)
    comptime MB_XBUTTON2 = Self(256)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct JoyButton(TrivialRegisterPassable):
    var value: Int16

    comptime INVALID = Self(-1)
    comptime A = Self(0)
    comptime B = Self(1)
    comptime X = Self(2)
    comptime Y = Self(3)
    comptime BACK = Self(4)
    comptime GUIDE = Self(5)
    comptime START = Self(6)
    comptime LEFT_STICK = Self(7)
    comptime RIGHT_STICK = Self(8)
    comptime LEFT_SHOULDER = Self(9)
    comptime RIGHT_SHOULDER = Self(10)
    comptime DPAD_UP = Self(11)
    comptime DPAD_DOWN = Self(12)
    comptime DPAD_LEFT = Self(13)
    comptime DPAD_RIGHT = Self(14)
    comptime MISC1 = Self(15)
    comptime PADDLE1 = Self(16)
    comptime PADDLE2 = Self(17)
    comptime PADDLE3 = Self(18)
    comptime PADDLE4 = Self(19)
    comptime TOUCHPAD = Self(20)
    comptime SDL_MAX = Self(21)
    comptime MAX = Self(128)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)

@fieldwise_init
struct JoyAxis(TrivialRegisterPassable):
    var value: Int8

    comptime INVALID = Self(-1)
    comptime LEFT_X = Self(0)
    comptime LEFT_Y = Self(1)
    comptime RIGHT_X = Self(2)
    comptime RIGHT_Y = Self(3)
    comptime TRIGGER_LEFT = Self(4)
    comptime TRIGGER_RIGHT = Self(5)
    comptime SDL_MAX = Self(6)
    comptime MAX = Self(10)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MIDIMessage(TrivialRegisterPassable):
    var value: UInt16

    comptime NONE = Self(0)
    comptime NOTE_OFF = Self(8)
    comptime NOTE_ON = Self(9)
    comptime AFTERTOUCH = Self(10)
    comptime CONTROL_CHANGE = Self(11)
    comptime PROGRAM_CHANGE = Self(12)
    comptime CHANNEL_PRESSURE = Self(13)
    comptime PITCH_BEND = Self(14)
    comptime SYSTEM_EXCLUSIVE = Self(240)
    comptime QUARTER_FRAME = Self(241)
    comptime SONG_POSITION_POINTER = Self(242)
    comptime SONG_SELECT = Self(243)
    comptime TUNE_REQUEST = Self(246)
    comptime TIMING_CLOCK = Self(248)
    comptime START = Self(250)
    comptime CONTINUE = Self(251)
    comptime STOP = Self(252)
    comptime ACTIVE_SENSING = Self(254)
    comptime SYSTEM_RESET = Self(255)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct Error(TrivialRegisterPassable):
    var value: UInt8

    comptime OK = Self(0)
    comptime FAILED = Self(1)
    comptime UNAVAILABLE = Self(2)
    comptime UNCONFIGURED = Self(3)
    comptime UNAUTHORIZED = Self(4)
    comptime PARAMETER_RANGE_ERROR = Self(5)
    comptime OUT_OF_MEMORY = Self(6)
    comptime FILE_NOT_FOUND = Self(7)
    comptime FILE_BAD_DRIVE = Self(8)
    comptime FILE_BAD_PATH = Self(9)
    comptime FILE_NO_PERMISSION = Self(10)
    comptime FILE_ALREADY_IN_USE = Self(11)
    comptime FILE_CANT_OPEN = Self(12)
    comptime FILE_CANT_WRITE = Self(13)
    comptime FILE_CANT_READ = Self(14)
    comptime FILE_UNRECOGNIZED = Self(15)
    comptime FILE_CORRUPT = Self(16)
    comptime FILE_MISSING_DEPENDENCIES = Self(17)
    comptime FILE_EOF = Self(18)
    comptime CANT_OPEN = Self(19)
    comptime CANT_CREATE = Self(20)
    comptime QUERY_FAILED = Self(21)
    comptime ALREADY_IN_USE = Self(22)
    comptime LOCKED = Self(23)
    comptime TIMEOUT = Self(24)
    comptime CANT_CONNECT = Self(25)
    comptime CANT_RESOLVE = Self(26)
    comptime CONNECTION_ERROR = Self(27)
    comptime CANT_ACQUIRE_RESOURCE = Self(28)
    comptime CANT_FORK = Self(29)
    comptime INVALID_DATA = Self(30)
    comptime INVALID_PARAMETER = Self(31)
    comptime ALREADY_EXISTS = Self(32)
    comptime DOES_NOT_EXIST = Self(33)
    comptime DATABASE_CANT_READ = Self(34)
    comptime DATABASE_CANT_WRITE = Self(35)
    comptime COMPILATION_FAILED = Self(36)
    comptime METHOD_NOT_FOUND = Self(37)
    comptime LINK_FAILED = Self(38)
    comptime SCRIPT_FAILED = Self(39)
    comptime CYCLIC_LINK = Self(40)
    comptime INVALID_DECLARATION = Self(41)
    comptime DUPLICATE_SYMBOL = Self(42)
    comptime PARSE_ERROR = Self(43)
    comptime BUSY = Self(44)
    comptime SKIP = Self(45)
    comptime HELP = Self(46)
    comptime BUG = Self(47)
    comptime PRINTER_ON_FIRE = Self(48)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct PropertyHint(TrivialRegisterPassable):
    var value: UInt8

    comptime NONE = Self(0)
    comptime RANGE = Self(1)
    comptime ENUM = Self(2)
    comptime ENUM_SUGGESTION = Self(3)
    comptime EXP_EASING = Self(4)
    comptime LINK = Self(5)
    comptime FLAGS = Self(6)
    comptime LAYERS_2D_RENDER = Self(7)
    comptime LAYERS_2D_PHYSICS = Self(8)
    comptime LAYERS_2D_NAVIGATION = Self(9)
    comptime LAYERS_3D_RENDER = Self(10)
    comptime LAYERS_3D_PHYSICS = Self(11)
    comptime LAYERS_3D_NAVIGATION = Self(12)
    comptime LAYERS_AVOIDANCE = Self(37)
    comptime FILE = Self(13)
    comptime DIR = Self(14)
    comptime GLOBAL_FILE = Self(15)
    comptime GLOBAL_DIR = Self(16)
    comptime RESOURCE_TYPE = Self(17)
    comptime MULTILINE_TEXT = Self(18)
    comptime EXPRESSION = Self(19)
    comptime PLACEHOLDER_TEXT = Self(20)
    comptime COLOR_NO_ALPHA = Self(21)
    comptime OBJECT_ID = Self(22)
    comptime TYPE_STRING = Self(23)
    comptime NODE_PATH_TO_EDITED_NODE = Self(24)
    comptime OBJECT_TOO_BIG = Self(25)
    comptime NODE_PATH_VALID_TYPES = Self(26)
    comptime SAVE_FILE = Self(27)
    comptime GLOBAL_SAVE_FILE = Self(28)
    comptime INT_IS_OBJECTID = Self(29)
    comptime INT_IS_POINTER = Self(30)
    comptime ARRAY_TYPE = Self(31)
    comptime DICTIONARY_TYPE = Self(38)
    comptime LOCALE_ID = Self(32)
    comptime LOCALIZABLE_STRING = Self(33)
    comptime NODE_TYPE = Self(34)
    comptime HIDE_QUATERNION_EDIT = Self(35)
    comptime PASSWORD = Self(36)
    comptime TOOL_BUTTON = Self(39)
    comptime ONESHOT = Self(40)
    comptime GROUP_ENABLE = Self(42)
    comptime INPUT_NAME = Self(43)
    comptime FILE_PATH = Self(44)
    comptime MAX = Self(45)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct PropertyUsageFlags(TrivialRegisterPassable):
    var value: UInt32

    comptime NONE = Self(0)
    comptime STORAGE = Self(2)
    comptime EDITOR = Self(4)
    comptime INTERNAL = Self(8)
    comptime CHECKABLE = Self(16)
    comptime CHECKED = Self(32)
    comptime GROUP = Self(64)
    comptime CATEGORY = Self(128)
    comptime SUBGROUP = Self(256)
    comptime CLASS_IS_BITFIELD = Self(512)
    comptime NO_INSTANCE_STATE = Self(1024)
    comptime RESTART_IF_CHANGED = Self(2048)
    comptime SCRIPT_VARIABLE = Self(4096)
    comptime STORE_IF_NULL = Self(8192)
    comptime UPDATE_ALL_IF_MODIFIED = Self(16384)
    comptime SCRIPT_DEFAULT_VALUE = Self(32768)
    comptime CLASS_IS_ENUM = Self(65536)
    comptime NIL_IS_VARIANT = Self(131072)
    comptime ARRAY = Self(262144)
    comptime ALWAYS_DUPLICATE = Self(524288)
    comptime NEVER_DUPLICATE = Self(1048576)
    comptime HIGH_END_GFX = Self(2097152)
    comptime NODE_PATH_FROM_SCENE_ROOT = Self(4194304)
    comptime RESOURCE_NOT_PERSISTENT = Self(8388608)
    comptime KEYING_INCREMENTS = Self(16777216)
    comptime DEFERRED_SET_RESOURCE = Self(33554432)
    comptime EDITOR_INSTANTIATE_OBJECT = Self(67108864)
    comptime EDITOR_BASIC_SETTING = Self(134217728)
    comptime READ_ONLY = Self(268435456)
    comptime SECRET = Self(536870912)
    comptime DEFAULT = Self(Self.STORAGE.value | Self.EDITOR.value)
    comptime NO_EDITOR = Self(2)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct MethodFlags(TrivialRegisterPassable):
    var value: UInt8

    comptime NORMAL = Self(1)
    comptime EDITOR = Self(2)
    comptime CONST = Self(4)
    comptime VIRTUAL = Self(8)
    comptime VARARG = Self(16)
    comptime STATIC = Self(32)
    comptime OBJECT_CORE = Self(64)
    comptime VIRTUAL_REQUIRED = Self(128)
    comptime DEFAULT = Self(1)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct VariantType(TrivialRegisterPassable):
    var value: UInt8

    comptime NIL = Self(0)
    comptime BOOL = Self(1)
    comptime INT = Self(2)
    comptime FLOAT = Self(3)
    comptime STRING = Self(4)
    comptime VECTOR2 = Self(5)
    comptime VECTOR2I = Self(6)
    comptime RECT2 = Self(7)
    comptime RECT2I = Self(8)
    comptime VECTOR3 = Self(9)
    comptime VECTOR3I = Self(10)
    comptime TRANSFORM2D = Self(11)
    comptime VECTOR4 = Self(1)
    comptime VECTOR4I = Self(13)
    comptime PLANE = Self(14)
    comptime QUATERNION = Self(15)
    comptime AABB = Self(16)
    comptime BASIS = Self(17)
    comptime TRANSFORM3D = Self(18)
    comptime PROJECTION = Self(19)
    comptime COLOR = Self(20)
    comptime STRING_NAME = Self(21)
    comptime NODE_PATH = Self(22)
    comptime RID = Self(23)
    comptime OBJECT = Self(24)
    comptime CALLABLE = Self(25)
    comptime SIGNAL = Self(26)
    comptime DICTIONARY = Self(27)
    comptime ARRAY = Self(28)
    comptime PACKED_BYTE_ARRAY = Self(29)
    comptime PACKED_INT32_ARRAY = Self(30)
    comptime PACKED_INT64_ARRAY = Self(31)
    comptime PACKED_FLOAT32_ARRAY = Self(32)
    comptime PACKED_FLOAT64_ARRAY = Self(33)
    comptime PACKED_STRING_ARRAY = Self(34)
    comptime PACKED_VECTOR2_ARRAY = Self(35)
    comptime PACKED_VECTOR3_ARRAY = Self(36)
    comptime PACKED_COLOR_ARRAY = Self(37)
    comptime PACKED_VECTOR4_ARRAY = Self(38)
    comptime MAX = Self(39)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)


@fieldwise_init
struct VariantOperator(TrivialRegisterPassable):
    var value: UInt8

    comptime EQUAL = Self(0)
    comptime NOT_EQUAL = Self(1)
    comptime LESS = Self(2)
    comptime LESS_EQUAL = Self(3)
    comptime GREATER = Self(4)
    comptime GREATER_EQUAL = Self(5)
    comptime ADD = Self(6)
    comptime SUBTRACT = Self(7)
    comptime MULTIPLY = Self(8)
    comptime DIVIDE = Self(9)
    comptime NEGATE = Self(10)
    comptime POSITIVE = Self(11)
    comptime MODULE = Self(12)
    comptime POWER = Self(13)
    comptime SHIFT_LEFT = Self(14)
    comptime SHIFT_RIGHT = Self(15)
    comptime BIT_AND = Self(16)
    comptime BIT_OR = Self(17)
    comptime BIT_XOR = Self(18)
    comptime BIT_NEGATE = Self(19)
    comptime AND = Self(20)
    comptime OR = Self(21)
    comptime XOR = Self(22)
    comptime NOT = Self(23)
    comptime IN = Self(24)
    comptime MAX = Self(25)

    def __or__(self, other: Self) -> Self:
        return Self(self.value | other.value)
    
    def __and__(self, other: Self) -> Self:
        return Self(self.value & other.value)

    def __eq__(self, other: Self) -> Bool:
        return self.value == other.value

    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    def __lt__(self, other: Self) -> Bool:
        return self.value < other.value

    def __gt__(self, other: Self) -> Bool:
        return self.value > other.value

    def __ge__(self, other: Self) -> Bool:
        return self.value >= other.value

    def __le__(self, other: Self) -> Bool:
        return self.value <= other.value

    def write_to(self, mut writer: Some[Writer]):
        writer.write("(", self.value, ")")

    def write_repr_to(self, mut writer: Some[Writer]):
        writer.write("Value is: ", self.value)
