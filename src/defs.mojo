comptime BUILD_32 = False
comptime REAL_T_IS_DOUBLE = False

# The sizes can be obtained from the extension_api.json file.
comptime STRING_NAME_SIZE = 4 if BUILD_32 else 8
comptime STRING_SIZE = 4 if BUILD_32 else 8
comptime VECTOR2_SIZE = 16 if REAL_T_IS_DOUBLE else 8


# Types.
struct StringName:
    var data: InlineArray[UInt8, STRING_NAME_SIZE]


struct GDString:
    var data: InlineArray[UInt8, STRING_SIZE]


struct Vector2:
    var data: InlineArray[UInt8, VECTOR2_SIZE]


# Enums.
comptime PropertyHint = UInt8
comptime PROPERTY_HINT_NONE = 0

comptime PropertyUsageFlags = UInt8
comptime PROPERTY_USAGE_NONE = 0
comptime PROPERTY_USAGE_STORAGE = 2
comptime PROPERTY_USAGE_EDITOR = 4
comptime PROPERTY_USAGE_DEFAULT = PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_EDITOR
