from sys.ffi import c_int, c_char, c_size_t, c_float, c_double
from misc import *

comptime c_char32 = UInt32
comptime c_char16 = UInt16
comptime c_wchar = Int32  # implementation defined

# basic types
comptime VariantType = UInt8
comptime NIL = 0
# atomic types
comptime BOOL = 1
comptime INT = 2
comptime FLOAT = 3
comptime STRING = 4
# math types
comptime VECTOR2 = 5
comptime VECTOR2I = 6
comptime RECT2 = 7
comptime RECT2I = 8
comptime VECTOR3 = 9
comptime VECTOR3I = 10
comptime TRANSFORM2D = 11
comptime VECTOR4 = 12
comptime VECTOR4I = 13
comptime PLANE = 14
comptime QUATERNION = 15
comptime AABB = 16
comptime BASIS = 17
comptime TRANSFORM3D = 18
comptime PROJECTION = 19
# misc types
comptime COLOR = 20
comptime STRING_NAME = 21
comptime NODE_PATH = 22
comptime RID = 23
comptime OBJECT = 24
comptime CALLABLE = 25
comptime SIGNAL = 26
comptime DICTIONARY = 27
comptime ARRAY = 28
# typed arrays
comptime PACKED_BYTE_ARRAY = 29
comptime PACKED_INT32_ARRAY = 30
comptime PACKED_INT64_ARRAY = 31
comptime PACKED_FLOAT32_ARRAY = 32
comptime PACKED_FLOAT64_ARRAY = 33
comptime PACKED_STRING_ARRAY = 34
comptime PACKED_VECTOR2_ARRAY = 35
comptime PACKED_VECTOR3_ARRAY = 36
comptime PACKED_COLOR_ARRAY = 37
comptime PACKED_VECTOR4_ARRAY = 38#

comptime VARIANT_MAX = 39


comptime VariantOperator = UInt8
# comparison
comptime VARIANT_OP_EQUAL = 0
comptime VARIANT_OP_NOT_EQUAL = 1
comptime VARIANT_OP_LESS = 2
comptime VARIANT_OP_LESS_EQUAL = 3
comptime VARIANT_OP_GREATER = 4
comptime VARIANT_OP_GREATER_EQUAL = 5
# mathematic
comptime VARIANT_OP_ADD = 6
comptime VARIANT_OP_SUBTRACT = 7
comptime VARIANT_OP_MULTIPLY = 8
comptime VARIANT_OP_DIVIDE = 9
comptime VARIANT_OP_NEGATE = 10
comptime VARIANT_OP_POSITIVE = 11
comptime VARIANT_OP_MODULE = 12
comptime VARIANT_OP_POWER = 13
# bitwise
comptime VARIANT_OP_SHIFT_LEFT = 14
comptime VARIANT_OP_SHIFT_RIGHT = 15
comptime VARIANT_OP_BIT_AND = 16
comptime VARIANT_OP_BIT_OR = 17
comptime VARIANT_OP_BIT_XOR = 18
comptime VARIANT_OP_BIT_NEGATE = 19
# logic
comptime VARIANT_OP_AND = 20
comptime VARIANT_OP_OR = 21
comptime VARIANT_OP_XOR = 22
comptime VARIANT_OP_NOT = 23
# containment
comptime VARIANT_OP_IN = 24
comptime VARIANT_OP_MAX = 25


# In this API there are multiple functions which expect the caller to pass a pointer
# on return value as parameter.
# In order to make it clear if the caller should initialize the return value or not
# we have two flavor of types:
# - `GDExtensionXXXPtr` for pointer on an initialized value
# - `GDExtensionUninitializedXXXPtr` for pointer on uninitialized value
#
# Notes:
# - Not respecting those requirements can seems harmless, but will lead to unexpected
#   segfault or memory leak (for instance with a specific compiler/OS, or when two
#   native extensions start doing ptrcall on each other).
# - Initialization must be done with the function pointer returned by `variant_get_ptr_constructor`,
#   zero-initializing the variable should not be considered a valid initialization method here !
# - Some types have no destructor (see `extension_api.json`'s `has_destructor` field), for
#   them it is always safe to skip the constructor for the return value if you are in a hurry ;-)

comptime VariantPtr = VOIDPTR
comptime ConstVariantPtr = VOIDPTRCONST
comptime UninitVariantPtr = VOIDPTR
comptime StringNamePtr = VOIDPTR
comptime ConstStringNamePtr = VOIDPTRCONST
comptime UninitStringNamePtr = VOIDPTR
comptime StringPtr = VOIDPTR
comptime ConstStringPtr = VOIDPTRCONST
comptime UninitStringPtr = VOIDPTR
comptime ObjectPtr = VOIDPTR
comptime ConstObjectPtr = VOIDPTRCONST
comptime UninitObjectPtr = VOIDPTR
comptime TypePtr = VOIDPTR
comptime ConstTypePtr = VOIDPTRCONST
comptime UninitTypePtr = VOIDPTR
comptime MethodBindPtr = VOIDPTRCONST
comptime GDInt = Int64
comptime GDBool = UInt8
comptime ObjectInstanceID = UInt64
comptime RefPtr = VOIDPTR
comptime ConstRefPtr = VOIDPTRCONST

# VARIANT DATA I/O

comptime GDExtensionCallErrorType = UInt8
comptime GDEXTENSION_CALL_OK = 0
comptime GDEXTENSION_CALL_ERROR_INVALID_METHOD = 1
comptime GDEXTENSION_CALL_ERROR_INVALID_ARGUMENT = 2  # Expected a different variant type.
comptime GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS = 3  # Expected lower number of arguments.
comptime GDEXTENSION_CALL_ERROR_TOO_FEW_ARGUMENTS = 4  # Expected higher number of arguments.
comptime GDEXTENSION_CALL_ERROR_INSTANCE_IS_NULL = 5
comptime GDEXTENSION_CALL_ERROR_METHOD_NOT_CONST = 6  # Used for const call.


@fieldwise_init
@register_passable("trivial")
struct GDExtensionCallError:
    var error: GDExtensionCallErrorType
    var argument: Int32
    var expected: Int32

comptime VariantFromTypeConstructorFunc = def (UninitVariantPtr, TypePtr) thin
comptime TypeFromVariantConstructorFunc = def (UninitTypePtr, VariantPtr) thin
comptime VariantGetInternalPtrFunc = def (VariantPtr) thin -> VOIDPTR
comptime PtrOperatorEvaluator = def (p_left: ConstTypePtr, p_right: ConstTypePtr, r_result: TypePtr) thin
comptime PtrBuiltInMethod = def (p_base: TypePtr, p_args: PTRCONST[ConstTypePtr], r_return: TypePtr, arg_count: c_int) thin
comptime PtrConstructor = def (p_base: UninitTypePtr, p_args: PTRCONST[ConstTypePtr]) thin
comptime PtrDestructor = def (p_base: TypePtr) thin
comptime PtrSetter = def (p_base: TypePtr, p_value: ConstTypePtr) thin
comptime PtrGetter = def (p_base: ConstTypePtr, r_value: TypePtr) thin
comptime PtrIndexedSetter = def (p_base: TypePtr, p_index: GDInt, p_value: ConstTypePtr) thin
comptime PtrIndexedGetter = def (p_base: ConstTypePtr, p_index: GDInt, r_value: TypePtr) thin
comptime PtrKeyedSetter = def (p_base: TypePtr, p_key: ConstTypePtr, p_value: ConstTypePtr) thin
comptime PtrKeyedGetter = def (p_base: ConstTypePtr, p_key: ConstTypePtr, r_value: TypePtr) thin
comptime PtrKeyedChecker = def (p_base: ConstVariantPtr, p_key: ConstVariantPtr) thin -> UInt32
comptime PtrUtilityFunction = def (r_return: TypePtr, p_args: PTRCONST[ConstTypePtr], arg_count: c_int) thin

comptime ClassConstructor = def () thin -> ObjectPtr

comptime BindingCreateCallback = def (p_token: InstanceBindingPtr, p_instance: VOIDPTR) thin -> VOIDPTR
comptime InstanceBindFreeCallback = def (p_token: InstanceBindingPtr, p_instance: VOIDPTR, p_binding: VOIDPTR) thin
comptime InstanceBindRefCallback = def (p_token: InstanceBindingPtr, p_binding: VOIDPTR, p_reference: GDBool) thin -> GDBool


@fieldwise_init
struct InstanceBindingCallbacks(TrivialRegisterPassable):
    var create: BindingCreateCallback
    var free: InstanceBindFreeCallback
    var reference: InstanceBindRefCallback


# EXTENSION CLASSES

comptime ClassInstancePtr = VOIDPTR
comptime ClassSet = def(instance: MutPtr[NoneType], name: ConstPtr[StringName], value: ConstPtr[Variant]) thin -> GDBool
comptime ClassGet = def (p_instance: ClassInstancePtr, p_name: ConstStringNamePtr, r_ret: VariantPtr) thin -> GDBool
comptime ClassGetRID = def (instance: MutPtr[NoneType]) thin -> UInt64


@fieldwise_init
struct PropertyInfo(TrivialRegisterPassable):
    var variant: VariantType
    var name: StringNamePtr
    var class_name: StringNamePtr
    var hint_string: StringPtr
    var usage: UInt32 # Bitfield of `PropertyUsageFlags` (defined in `extension_api.json`).
    var hint: UInt32 # Bitfield of `PropertyHint` (defined in `extension_api.json`).


@fieldwise_init
struct MethodInfo(TrivialRegisterPassable):
    var flags: UInt32  # Bitfield of `GDExtensionClassMethodFlags`.
    var id: Int32
    var name: StringNamePtr
    var value: PropertyInfo


comptime ClassGetPropertyList = def (p_instance: ClassInstancePtr, r_count: PTR[UInt32]) thin -> PTRCONST[PropertyInfo]
comptime ClassFreePropertyList = def (p_instance: ClassInstancePtr, p_list: PTRCONST[PropertyInfo]) thin
comptime ClassFreePropertyList2 = def (p_instance: ClassInstancePtr, p_list: PTRCONST[PropertyInfo], p_count: UInt32) thin
comptime ClassPropertyCanRevert = def (p_instance: ClassInstancePtr, p_name: ConstStringNamePtr) thin -> GDBool
comptime ClassPropertyGetRevert = def (p_instance: ClassInstancePtr, p_name: ConstStringNamePtr, r_ret: VariantPtr) thin -> GDBool
comptime ClassValidateProperty = def (p_instance: ClassInstancePtr, p_property: PTR[PropertyInfo]) thin -> GDBool
comptime ClassNotification = def (p_instance: ClassInstancePtr, p_what: Int32)  # Deprecated. Use GDExtensionClassNotification2 instead.
comptime ClassNotification2 = def (p_instance: ClassInstancePtr, p_what: Int32, p_reversed: GDBool) thin
comptime ClassToString = def (p_instance: ClassInstancePtr, r_is_valid: PTR[GDBool], p_out: StringPtr) thin
comptime ClassReference = def (p_instance: ClassInstancePtr) thin
comptime ClassUnreference = def (p_instance: ClassInstancePtr) thin
comptime ClassCallVirtual = def (p_instance: ClassInstancePtr, p_args: PTRCONST[ConstTypePtr], r_ret: TypePtr)
comptime ClassCreateInstance = def (p_class_userdata: VOIDPTR) thin -> ObjectPtr
comptime ClassCreateInstance2 = def (p_class_userdata: VOIDPTR, pGDBool_notify_postinitialize: GDBool) -> ObjectPtr
comptime ClassFreeInstance = def (p_class_userdata: VOIDPTR, p_instance: ClassInstancePtr) thin
comptime ClassRecreateInstance = def (p_class_userdata: VOIDPTR, p_object: ObjectPtr) thin -> ClassInstancePtr
comptime ClassGetVirtual = def (p_class_userdata: VOIDPTR, p_name: ConstStringNamePtr) thin -> ClassCallVirtual
comptime ClassGetVirtual2 = def (p_class_userdata: VOIDPTR, p_name: ConstStringNamePtr, p_hash: UInt32) thin -> ClassCallVirtual
comptime ClassGetVirtualCallData = def (p_class_userdata: VOIDPTR, p_name: ConstStringNamePtr) thin -> VOIDPTR
comptime ClassGetVirtualCallData2 = def (p_class_userdata: VOIDPTR, p_name: ConstStringNamePtr, p_hash: UInt32) thin -> VOIDPTR
comptime ClassCallVirtualWithData = def (p_instance: ClassInstancePtr, p_name: ConstStringNamePtr, p_virtual_call_userdata: VOIDPTR, p_args: PTRCONST[ConstTypePtr], r_ret: TypePtr) thin


@deprecated("Deprecated. Use GDExtensionClassCreationInfo4 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionClassCreationInfo:
    var is_virtual: GDExtensionBool
    var is_abstract: GDExtensionBool
    var set_func: GDExtensionClassSet
    var get_func: GDExtensionClassGet
    var get_property_list_func: GDExtensionClassGetPropertyList
    var free_property_list_func: GDExtensionClassFreePropertyList
    var property_can_revert_func: GDExtensionClassPropertyCanRevert
    var property_get_revert_func: GDExtensionClassPropertyGetRevert
    var notification_func: GDExtensionClassNotification
    var to_string_func: GDExtensionClassToString
    var reference_func: GDExtensionClassReference
    var unreference_func: GDExtensionClassUnreference
    var create_instance_func: GDExtensionClassCreateInstance  # (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
    var free_instance_func: GDExtensionClassFreeInstance  # Destructor; mandatory.
    var get_virtual_func: GDExtensionClassGetVirtual  # Queries a virtual function by name and returns a callback to invoke the requested virtual function.
    var get_rid_func: GDExtensionClassGetRID
    var class_userdata: C_VoidPtr  # Per-class user data, later accessible in instance bindings.


@deprecated("Deprecated. Use GDExtensionClassCreationInfo4 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionClassCreationInfo2:
    var is_virtual: GDExtensionBool
    var is_abstract: GDExtensionBool
    var is_exposed: GDExtensionBool
    var set_func: GDExtensionClassSet
    var get_func: GDExtensionClassGet
    var get_property_list_func: GDExtensionClassGetPropertyList
    var free_property_list_func: GDExtensionClassFreePropertyList
    var property_can_revert_func: GDExtensionClassPropertyCanRevert
    var property_get_revert_func: GDExtensionClassPropertyGetRevert
    var validate_property_func: GDExtensionClassValidateProperty
    var notification_func: GDExtensionClassNotification2
    var to_string_func: GDExtensionClassToString
    var reference_func: GDExtensionClassReference
    var unreference_func: GDExtensionClassUnreference
    var create_instance_func: GDExtensionClassCreateInstance  # (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
    var free_instance_func: GDExtensionClassFreeInstance  # Destructor; mandatory.
    var recreate_instance_func: GDExtensionClassRecreateInstance
    # Queries a virtual function by name and returns a callback to invoke the requested virtual function.
    var get_virtual_func: GDExtensionClassGetVirtual
    # Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
    # need or benefit from extra data when calling virtual functions.
    # Returns user data that will be passed to `call_virtual_with_data_func`.
    # Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
    # Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
    # You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
    var get_virtual_call_data_func: GDExtensionClassGetVirtualCallData
    # Used to call virtual functions when `get_virtual_call_data_func` is not null.
    var call_virtual_with_data_func: GDExtensionClassCallVirtualWithData
    var get_rid_func: GDExtensionClassGetRID
    var class_userdata: C_VoidPtr  # Per-class user data, later accessible in instance bindings.


@deprecated("Deprecated. Use GDExtensionClassCreationInfo4 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionClassCreationInfo3:
    var is_virtual: GDExtensionBool
    var is_abstract: GDExtensionBool
    var is_exposed: GDExtensionBool
    var is_runtime: GDExtensionBool
    var set_func: GDExtensionClassSet
    var get_func: GDExtensionClassGet
    var get_property_list_func: GDExtensionClassGetPropertyList
    var free_property_list_func: GDExtensionClassFreePropertyList2
    var property_can_revert_func: GDExtensionClassPropertyCanRevert
    var property_get_revert_func: GDExtensionClassPropertyGetRevert
    var validate_property_func: GDExtensionClassValidateProperty
    var notification_func: GDExtensionClassNotification2
    var to_string_func: GDExtensionClassToString
    var reference_func: GDExtensionClassReference
    var unreference_func: GDExtensionClassUnreference
    var create_instance_func: GDExtensionClassCreateInstance  # (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
    var free_instance_func: GDExtensionClassFreeInstance  # Destructor; mandatory.
    var recreate_instance_func: GDExtensionClassRecreateInstance
    # Queries a virtual function by name and returns a callback to invoke the requested virtual function.
    var get_virtual_func: GDExtensionClassGetVirtual
    # Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
    # need or benefit from extra data when calling virtual functions.
    # Returns user data that will be passed to `call_virtual_with_data_func`.
    # Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
    # Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
    # You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
    var get_virtual_call_data_func: GDExtensionClassGetVirtualCallData
    # Used to call virtual functions when `get_virtual_call_data_func` is not null.
    var call_virtual_with_data_func: GDExtensionClassCallVirtualWithData
    var get_rid_func: GDExtensionClassGetRID
    var class_userdata: C_VoidPtr  # Per-class user data, later accessible in instance bindings.


@fieldwise_init
struct ClassCreationInfo(TrivialRegisterPassable):
    var is_virtual: GDBool
    var is_abstract: GDBool
    var is_exposed: GDBool
    var is_runtime: GDBool
    var icon_path: ConstStringPtr
    var set_func: ClassSet
    var get_func: ClassGet
    var get_prop_list: ClassGetPropertyList
    var free_prop_list: ClassFreePropertyList2
    var prop_can_revert: ClassPropertyCanRevert
    var prop_get_revert: ClassPropertyGetRevert
    var validate_prop: ClassValidateProperty
    var notify: ClassNotification2
    var to_string: ClassToString
    var reference: ClassReference
    var unreference: ClassUnreference
    var create_instance: ClassCreateInstance
    var free_instance: ClassFreeInstance
    var recreate_instance: ClassRecreateInstance
    # Queries a virtual function by name and returns a callback to invoke the requested virtual function.
    var get_virtual: ClassGetVirtual
    # Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
    # need or benefit from extra data when calling virtual functions.
    # Returns user data that will be passed to `call_virtual_with_data_func`.
    # Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
    # Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
    # You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
    var get_virtual_call_data: ClassGetVirtualCallData
    # Used to call virtual functions when `get_virtual_call_data_func` is not null.
    var free_prop_list: ClassFreePropertyList2
    var validate_prop: ClassValidateProperty


comptime ClassCreationInfo5 = ClassCreationInfo

comptime ClassLibraryPtr = VOIDPTR

# Passed a pointer to a PackedStringArray that should be filled with the classes that may be used by the GDExtension.
comptime EditorGetClassesUsedCallback = def (packed_string_array: TypePtr) thin

# Method

comptime ClassMethodFlags = UInt8
comptime FLAG_NORMAL = 1
comptime FLAG_EDITOR = 2
comptime FLAG_CONST = 4
comptime FLAG_VIRTUAL = 8
comptime FLAG_VARARG = 16
comptime FLAG_STATIC = 32
comptime FLAGS_DEFAULT = FLAG_NORMAL

comptime ClassMethodArgumentMetadata = UInt8
comptime METADATA_NONE: UInt8 = 0
comptime METADATA_INT_IS_INT8: UInt8 = 1
comptime METADATA_INT_IS_INT16: UInt8 = 2
comptime METADATA_INT_IS_INT32: UInt8 = 3
comptime METADATA_INT_IS_INT64: UInt8 = 4
comptime METADATA_INT_IS_UINT8: UInt8 = 5
comptime METADATA_INT_IS_UINT16: UInt8 = 6
comptime METADATA_INT_IS_UINT32: UInt8 = 7
comptime METADATA_INT_IS_UINT64: UInt8 = 8
comptime METADATA_REAL_IS_FLOAT: UInt8 = 9
comptime METADATA_REAL_IS_DOUBLE: UInt8 = 10
comptime METADATA_INT_IS_CHAR16: UInt8 = 11
comptime METADATA_INT_IS_CHAR32: UInt8 = 12

comptime ClassMethodCall = def (userdata: VOIDPTR, instance: VOIDPTR, args: PTRCONST[ConstVariantPtr], count: GDInt, r_ret: VariantPtr, r_error: CallError) thin
comptime ClassMethodValidateCall = def (userdata: VOIDPTR, instance: VOIDPTR, args: PTRCONST[ConstVariantPtr], r_ret: VariantPtr) thin
comptime ClassMethodPtrCall = def (userdata: VOIDPTR, instance: VOIDPTR, args: PTRCONST[ConstVariantPtr], r_ret: TypePtr) thin


@fieldwise_init
struct ClassMethodInfo(TrivialRegisterPassable):
    var name: StringNamePtr
    var userdata: VOIDPTR
    var call: ClassMethodCall
    var ptrcall: ClassMethodPtrCall
    var flag: UInt

    # If `has_return_value` is false, `return_value_info` and `return_value_metadata` are ignored.
    #
    # @todo Consider dropping `has_return_value` and making the other two properties match `GDExtensionMethodInfo` and `GDExtensionClassVirtualMethod` for consistency in future version of this struct.
    #
    var has_ret_value: GDBool
    var ret_value_info: PTR[PropertyInfo]
    var ret_value_metadata: ClassMethodArgumentMetadata

    # Arguments: `arguments_info` and `arguments_metadata` are array of size `argument_count`.
    # Name and hint information for the argument can be omitted in release builds. Class name should always be present if it applies.
    #
    # @todo Consider renaming `arg_info` to `arguments` for consistency in future version of this struct.
    #
    var arg_count: UInt
    var arg_metadata: PTR[ClassMethodArgumentMetadata]
    var arg_info: PTR[PropertyInfo]

    # Default arguments: `default_args` is an array of size `default_count`.
    var default_count: UInt
    var default_arg: PTR[VariantPtr]


@fieldwise_init
struct ClassVirtualMethodInfo[value_metadata: ClassMethodFlags](TrivialRegisterPassable):
    var name: StringNamePtr
    var method_flags: UInt
    var ret_value: PropertyInfo
    var arg_count: UInt
    var arg_info: PTR[PropertyInfo]
    var arg_metadata: PTR[ClassMethodArgumentMetadata]


comptime CallableCustomCall = def (userdata: VOIDPTR, args: PTRCONST[ConstVariantPtr], arg_count: GDInt, ret: VariantPtr, r_error: PTR[CallError]) thin
comptime CallableCustomIsValid = def (userdata: VOIDPTR) thin -> GDBool
comptime CallableCustomFree = def (userdata: VOIDPTR) thin
comptime CallableCustomHash = def (userdata: VOIDPTR) thin -> UInt
comptime CallableCustomEqual = def (userdata_a: VOIDPTR, userdata_b: VOIDPTR) thin -> GDBool
comptime CallableCustomLessThan = def (userdata_a: VOIDPTR, userdata_b: VOIDPTR) thin -> GDBool
comptime CallableCustomToString = def (userdata: VOIDPTR, is_valid: PTR[GDBool], r_out: StringPtr) thin
comptime CallableCustomGetArgCount = def (userdata: VOIDPTR, is_valid: PTR[GDBool]) thin -> GDInt


@deprecated("Deprecated. Use GDExtensionCallableCustomInfo2 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionCallableCustomInfo:
    # Only `call_func` and `token` are strictly required, however, `object_id` should be passed if its not a static method.
    #
    # `token` should point to an address that uniquely identifies the GDExtension (for example, the
    # `GDExtensionClassLibraryPtr` passed to the entry symbol function.
    #
    # `hash_func`, `equal_func`, and `less_than_func` are optional. If not provided both `call_func` and
    # `callable_userdata` together are used as the identity of the callable for hashing and comparison purposes.
    #
    # The hash returned by `hash_func` is cached, `hash_func` will not be called more than once per callable.
    #
    # `is_valid_func` is necessary if the validity of the callable can change before destruction.
    #
    # `free_func` is necessary if `callable_userdata` needs to be cleaned up when the callable is freed.
    #
    var callable_userdata: C_VoidPtr
    var token: C_VoidPtr

    var object_id: GDObjectInstanceID

    var call_func: GDExtensionCallableCustomCall
    var is_valid_func: GDExtensionCallableCustomIsValid
    var free_func: GDExtensionCallableCustomFree

    var hash_func: GDExtensionCallableCustomHash
    var equal_func: GDExtensionCallableCustomEqual
    var less_than_func: GDExtensionCallableCustomLessThan

    var to_string_func: GDExtensionCallableCustomToString


@fieldwise_init
struct CallableCustomInfo[](TrivialRegisterPassable):
    # Only `call_func` and `token` are strictly required, however, `object_id` should be passed if its not a static method.
    #
    # `token` should point to an address that uniquely identifies the GDExtension (for example, the
    # `GDExtensionClassLibraryPtr` passed to the entry symbol function.
    #
    # `hash_func`, `equal_func`, and `less_than_func` are optional. If not provided both `call_func` and
    # `callable_userdata` together are used as the identity of the callable for hashing and comparison purposes.
    #
    # The hash returned by `hash_func` is cached, `hash_func` will not be called more than once per callable.
    #
    # `is_valid_func` is necessary if the validity of the callable can change before destruction.
    #
    # `free_func` is necessary if `callable_userdata` needs to be cleaned up when the callable is freed.
    #
    var userdata: VOIDPTR
    var token: VOIDPTR
    var object_id: ObjectInstanceID

    var call_func: CallableCustomCall
    var is_valid_func: CallableCustomIsValid
    var free_func: CallableCustomFree

    var hash_func: CallableCustomHash
    var equal_func: CallableCustomEqual
    var less_than_func: CallableCustomLessThan

    var to_string_func: CallableCustomToString

    var get_argument_count_func: CallableCustomGetArgumentCount


# SCRIPT INSTANCE EXTENSION

comptime ScriptInstanceDataPtr = VOIDPTR  # Pointer to custom ScriptInstance native implementation.
comptime ScriptInstanceSet = def (instance: ScriptInstanceDataPtr, name: ConstStringNamePtr, value: ConstVariantPtr)thin -> GDBool
comptime ScriptInstanceGet = def (instance: ScriptInstanceDataPtr, name: ConstStringNamePtr, ret: VariantPtr) thin -> GDBool
comptime ScriptInstanceGetPropertyList = def (instance: ScriptInstanceDataPtr, count: PTR[UInt32]) thin -> PTRCONST[PropertyInfo]
comptime ScriptInstanceFreePropertyList = def (instance: ScriptInstanceDataPtr, p_list: PTRCONST[PropertyInfo], p_count: UInt32) thin
comptime ScriptInstanceGetClassCategory = def (instance: ScriptInstanceDataPtr, class_category: PTR[PropertyInfo]) thin -> GDBool

comptime ScriptInstanceGetPropertyType = def (instance: ScriptInstanceDataPtr, p_name: ConstStringNamePtr, r_is_valid: PTR[GDBool]) thin -> VariantType
comptime ScriptInstanceValidateProperty = def (instance: ScriptInstanceDataPtr, p_property: PTR[PropertyInfo]) thin -> GDBool

comptime ScriptInstancePropertyCanRevert = def (instance: ScriptInstanceDataPtr, p_name: ConstStringNamePtr) thin -> GDBool
comptime ScriptInstancePropertyGetRevert = def (instance: ScriptInstanceDataPtr, p_name: ConstStringNamePtr, r_ret: VariantPtr) thin -> GDBool
comptime ScriptInstanceGetOwner = def (instance: ScriptInstanceDataPtr) thin -> ObjectPtr
comptime ScriptInstancePropertyStateAdd = def (name: ConstStringNamePtr, p_value: ConstVariantPtr, p_userdata: VOIDPTR) thin
comptime ScriptInstanceGetPropertyState = def (instance: ScriptInstanceDataPtr, p_add_func: ScriptInstancePropertyStateAdd, p_userdata: VOIDPTR) thin

comptime ScriptInstanceGetMethodList = def (instance: ScriptInstanceDataPtr, r_count: PTR[UInt32]) thin -> PTRCONST[MethodInfo]
comptime ScriptInstanceFreeMethodList = def (instance: ScriptInstanceDataPtr, p_list: PTRCONST[MethodInfo], p_count: UInt32) thin
comptime ScriptInstanceHasMethod = def (instance: ScriptInstanceDataPtr, p_name: ConstStringNamePtr) thin -> GDBool

comptime ScriptInstanceGetMethodArgumentCount = def (instance: ScriptInstanceDataPtr, p_name: ConstStringNamePtr, r_is_valid: PTR[GDBool]) thin -> GDInt
comptime ScriptInstanceCall = def (p_self: VOIDPTR, p_method: ConstStringNamePtr, p_args: PTRCONST[ConstVariantPtr], p_argument_count: GDInt, r_return: VariantPtr, r_error: PTR[CallError]) thin
comptime ScriptInstanceNotification = def (instance: ScriptInstanceDataPtr, p_what: Int32, p_reversed: GDBool) thin
comptime ScriptInstanceToString = def (instance: ScriptInstanceDataPtr, r_is_valid: PTR[GDBool], r_out: StringPtr) thin

comptime ScriptInstanceRefCountIncremented = def (p_instance: ScriptInstanceDataPtr) thin
comptime ScriptInstanceRefCountDecremented = def (p_instance: ScriptInstanceDataPtr) thin -> GDBool

comptime ScriptInstanceGetScript = def (instance: ScriptInstanceDataPtr) thin -> ObjectPtr
comptime ScriptInstanceIsPlaceholder = def (p_instance: ScriptInstanceDataPtr) thin -> GDBool
comptime ScriptInstanceGetLanguage = def (p_instance: ScriptInstanceDataPtr) thin -> VOIDPTR

comptime ScriptInstanceGetLanguage = fn (p_instance: ScriptInstanceDataPtr) -> ScriptLanguagePtr

comptime ScriptInstanceFree = def (p_instance: ScriptInstanceDataPtr) thin
comptime ScriptInstancePtr = VOIDPTR  # Pointer to ScriptInstance.


@deprecated("Deprecated. Use GDExtensionScriptInstanceInfo3 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionScriptInstanceInfo:
    var set_func: GDExtensionScriptInstanceSet
    var get_func: GDExtensionScriptInstanceGet
    var get_property_list_func: GDExtensionScriptInstanceGetPropertyList
    var free_property_list_func: GDExtensionScriptInstanceFreePropertyList

    var property_can_revert_func: GDExtensionScriptInstancePropertyCanRevert
    var property_get_revert_func: GDExtensionScriptInstancePropertyGetRevert

    var get_owner_func: GDExtensionScriptInstanceGetOwner
    var get_property_state_func: GDExtensionScriptInstanceGetPropertyState

    var get_method_list_func: GDExtensionScriptInstanceGetMethodList
    var free_method_list_func: GDExtensionScriptInstanceFreeMethodList
    var get_property_type_func: GDExtensionScriptInstanceGetPropertyType

    var has_method_func: GDExtensionScriptInstanceHasMethod

    var call_func: GDExtensionScriptInstanceCall
    var notification_func: GDExtensionScriptInstanceNotification

    var to_string_func: GDExtensionScriptInstanceToString

    var refcount_incremented_func: GDExtensionScriptInstanceRefCountIncremented
    var refcount_decremented_func: GDExtensionScriptInstanceRefCountDecremented

    var get_script_func: GDExtensionScriptInstanceGetScript

    var is_placeholder_func: GDExtensionScriptInstanceIsPlaceholder

    var set_fallback_func: GDExtensionScriptInstanceSet
    var get_fallback_func: GDExtensionScriptInstanceGet

    var get_language_func: GDExtensionScriptInstanceGetLanguage

    var free_func: GDExtensionScriptInstanceFree


@deprecated("Deprecated. Use GDExtensionScriptInstanceInfo3 instead.")
@fieldwise_init
@register_passable("trivial")
struct GDExtensionScriptInstanceInfo2:
    var set_func: GDExtensionScriptInstanceSet
    var get_func: GDExtensionScriptInstanceGet
    var get_property_list_func: GDExtensionScriptInstanceGetPropertyList
    var free_property_list_func: GDExtensionScriptInstanceFreePropertyList
    var get_class_category_func: GDExtensionScriptInstanceGetClassCategory  # Optional. Set to NULL for the default behavior.

    var property_can_revert_func: GDExtensionScriptInstancePropertyCanRevert
    var property_get_revert_func: GDExtensionScriptInstancePropertyGetRevert

    var get_owner_func: GDExtensionScriptInstanceGetOwner
    var get_property_state_func: GDExtensionScriptInstanceGetPropertyState

    var get_method_list_func: GDExtensionScriptInstanceGetMethodList
    var free_method_list_func: GDExtensionScriptInstanceFreeMethodList
    var get_property_type_func: GDExtensionScriptInstanceGetPropertyType
    var validate_property_func: GDExtensionScriptInstanceValidateProperty

    var has_method_func: GDExtensionScriptInstanceHasMethod

    var call_func: GDExtensionScriptInstanceCall
    var notification_func: GDExtensionScriptInstanceNotification2

    var to_string_func: GDExtensionScriptInstanceToString

    var refcount_incremented_func: GDExtensionScriptInstanceRefCountIncremented
    var refcount_decremented_func: GDExtensionScriptInstanceRefCountDecremented

    var get_script_func: GDExtensionScriptInstanceGetScript

    var is_placeholder_func: GDExtensionScriptInstanceIsPlaceholder

    var set_fallback_func: GDExtensionScriptInstanceSet
    var get_fallback_func: GDExtensionScriptInstanceGet

    var get_language_func: GDExtensionScriptInstanceGetLanguage

    var free_func: GDExtensionScriptInstanceFree


@fieldwise_init
struct ScriptInstanceInfo(TrivialRegisterPassable):
    var set_func: ScriptInstanceSet
    var get_func: ScriptInstanceGet

    var get_prop_list: ScriptInstanceGetPropertyList
    var free_prop_list: ScriptInstanceFreePropertyList
    var get_class_category: ScriptInstanceGetClassCategory # Optional. Set to NULL for the default behavior.

    var prop_can_revert: ScriptInstancePropertyCanRevert
    var property_get_revert: ScriptInstancePropertyGetRevert
    var get_owner_func: ScriptInstanceGetOwner
    var get_property_state_func: ScriptInstanceGetPropertyState
    var get_method_list_func: ScriptInstanceGetMethodList
    var free_method_list_func: ScriptInstanceFreeMethodList
    var get_property_type_func: ScriptInstanceGetPropertyType

    var has_method: ScriptInstanceHasMethod
    var get_method_arg_count: ScriptInstanceGetMethodArgumentCount
    
    var call: ScriptInstanceCall
    var notification: ScriptInstanceNotification
    var to_string: ScriptInstanceToString
    
    var refcount_increment: ScriptInstanceRefCountIncremented
    var ref_count_decrement: ScriptInstanceRefCountDecremented
    
    var get_script: ScriptInstanceGetScript
    var is_placeholder: ScriptInstanceIsPlaceholder
    
    var set_fallback: ScriptInstanceSet
    var get_fallback: ScriptInstanceGet
    var get_language: ScriptInstanceGetLanguage
    
    var free_func: ScriptInstanceFree


comptime WorkerThreadPoolGroupTask = def(VOIDPTR, UInt) thin
comptime WorkerThreadPoolTask = def (VOIDPTR) thin

# INITIALIZATION

comptime InitializationLevel = UInt8
comptime INITIALIZATION_CORE = 0
comptime INITIALIZATION_SERVERS = 1
comptime INITIALIZATION_SCENE = 2
comptime INITIALIZATION_EDITOR = 3
comptime MAX_INITIALIZATION_LEVEL = 4

comptime InitCallback = def( userdata: VOIDPTR, level: InitializationLevel) thin
comptime DeinitCallback = def (userdata: VOIDPTR, level: InitializationLevel) thin


@fieldwise_init
struct Initialization(TrivialRegisterPassable):
    # Minimum initialization level required.
    # If Core or Servers, the extension needs editor or game restart to take effect */
    var min_init_level: InitializationLevel
    # Up to the user to supply when initializing */
    var userdata: VOIDPTR
    # This function will be called multiple times for each initialization level. */
    var initialize: InitCallback
    var deinitialize: DeinitCallback


comptime InterfaceFunctionPtr = def ()
comptime InterfaceGetProcAddress = def (func_name: PTRCONST[c_char]) thin -> InterfaceFunctionPtr


# Each GDExtension should define a C function that matches the signature of GDExtensionInitializationFunction,
# and export it so that it can be loaded via dlopen() or equivalent for the given platform.
#
# For example:
#
#   GDExtensionBool my_extension_init(GDExtensionInterfaceGetProcAddress p_get_proc_address, GDExtensionClassLibraryPtr p_library, GDExtensionInitialization *r_initialization);
#
# This function's name must be specified as the 'entry_symbol' in the .gdextension file.
#
# This makes it the entry point of the GDExtension and will be called on initialization.
#
# The GDExtension can then modify the r_initialization structure, setting the minimum initialization level,
# and providing pointers to functions that will be called at various stages of initialization/shutdown.
#
# The rest of the GDExtension's interface to Godot consists of function pointers that can be loaded
# by calling p_get_proc_address("...") with the name of the function.
#
# For example:
#
#   GDExtensionInterfaceGetGodotVersion get_godot_version = (GDExtensionInterfaceGetGodotVersion)p_get_proc_address("get_godot_version");
#
# (Note that snippet may cause "cast between incompatible function types" on some compilers, you can
# silence this by adding an intermediary `void*` cast.)
#
# You can then call it like a normal function:
#
#   GDExtensionGodotVersion godot_version;
#   get_godot_version(&godot_version);
#   printf("Godot v%d.%d.%d\n", godot_version.major, godot_version.minor, godot_version.patch);
#
# All of these interface functions are described below, together with the name that's used to load it,
# and the function pointer typedef that shows its signature.
#
comptime GDExtensionInitializationFunction = fn (p_get_proc_address: GDExtensionInterfaceGetProcAddress, p_library: GDExtensionClassLibraryPtr, r_initialization: C_Ptr[GDExtensionInitialization]) -> GDExtensionBool

# INTERFACE


@fieldwise_init
struct GodotVersion(TrivialRegisterPassable):
    var major: UInt
    var minor: UInt
    var patch: UInt
    var string: PTRCONST[c_char]


@fieldwise_init
struct GodotVersion2(TrivialRegisterPassable):
    var major: UInt
    var minor: UInt
    var patch: UInt
    var hex: UInt # Full version encoded as hexadecimal with one byte (2 hex digits) per number (e.g. for "3.1.12" it would be 0x03010C)
    var status: PTRCONST[c_char] # (e.g. "stable", "beta", "rc1", "rc2")
    var build: PTRCONST[c_char] # (e.g. "custom_build")
    var hash: PTRCONST[c_char] # Full Git commit hash.
    var timestamp: UInt # Git commit date UNIX timestamp in seconds, or 0 if unavailable.
    var string: PTRCONST[c_char]  # (e.g. "Godot v3.1.4.stable.official.mono")


comptime MainLoopStartupCallback = def () thin # Called when starting the main loop.
comptime MainLoopShutdownCallback = def () thin # Called when shutting down the main loop.
comptime MainLoopFrameCallback = def () thin # Called every frame.


@fieldwise_init
struct MainLoopCallbacks(TrivialRegisterPassable):
    var startup: MainLoopStartupCallback # Will be called after Godot is started and is fully initialized.
    var shutdown: MainLoopShutdownCallback # Will be called before Godot is shutdown when it is still fully initialized.
    # Will be called for each process frame. This will run after all `_process()` methods on Node, and before `ScriptServer::frame()`.
    # This is intended to be the equivalent of `ScriptLanguage::frame()` for GDExtension language bindings that don't use the script API.
    var frame: MainLoopFrameCallback


#  @name get_godot_version
#  @since 4.1
#  @deprecated in Godot 4.5. Use `get_godot_version2` instead.
#
#  Gets the Godot version that the GDExtension was loaded into.
#
#  @param r_godot_version A pointer to the structure to write the version information into.
#
comptime InterfaceGetGodotVersion = def (r_godot_version: PTR[GodotVersion]) thin


#  @name get_godot_version2
#  @since 4.5
#
#  Gets the Godot version that the GDExtension was loaded into.
#
#  @param r_godot_version A pointer to the structure to write the version information into.
#
comptime InterfaceGetGodotVersion2 = fn (r_godot_version: C_Ptr[GodotVersion2]) thin


# INTERFACE: Memory


#  @name mem_alloc
#  @since 4.1
#
#  Allocates memory.
#
#  @param p_bytes The amount of memory to allocate in bytes.
#
#  @return A pointer to the allocated memory, or NULL if unsuccessful.
#
comptime InterfaceMemAlloc = def (b_bytes: c_size_t) thin -> VOIDPTR


#  @name mem_realloc
#  @since 4.1
#
#  Reallocates memory.
#
#  @param p_ptr A pointer to the previously allocated memory.
#  @param p_bytes The number of bytes to resize the memory block to.
#
#  @return A pointer to the allocated memory, or NULL if unsuccessful.
#
comptime InterafaceMemRealloc = def (p_ptr: VOIDPTR, p_bytes: c_size_t) thin -> VOIDPTR


#  @name mem_free
#  @since 4.1
#
#  Frees memory.
#
#  @param p_ptr A pointer to the previously allocated memory.
#
comptime InterfaceMemFree = def (p_ptr: VOIDPTR) thin


# INTERFACE: Godot Core


#  @name print_error
#  @since 4.1
#
#  Logs an error to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the error.
#  @param p_function The function name where the error occurred.
#  @param p_file The file where the error occurred.
#  @param p_line The line where the error occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime InterfacePrintError = def (p_description: PTRCONST[c_char], p_function: PTRCONST[c_char], p_file: PTRCONST[c_char], p_line: Int32, p_editor_notify: GDBool) thin


#  @name print_error_with_message
#  @since 4.1
#
#  Logs an error with a message to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the error.
#  @param p_message The message to show along with the error.
#  @param p_function The function name where the error occurred.
#  @param p_file The file where the error occurred.
#  @param p_line The line where the error occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime GDExtensionInterfacePrintErrorWithMessage = fn (p_description: C_PtrConst[c_char], p_message: C_PtrConst[c_char], p_function: C_PtrConst[c_char], p_file: C_PtrConst[c_char], p_line: Int32, p_editor_notify: GDExtensionBool)


#  @name print_warning
#  @since 4.1
#
#  Logs a warning to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the warning.
#  @param p_function The function name where the warning occurred.
#  @param p_file The file where the warning occurred.
#  @param p_line The line where the warning occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime VoidInterfacePrintErrorWithMessage = def (p_description: PTRCONST[c_char], p_message: PTRCONST[c_char], p_function: PTRCONST[c_char], p_file: PTRCONST[c_char], p_line: Int32, p_editor_notify: GDBool) thin


#  @name print_warning_with_message
#  @since 4.1
#
#  Logs a warning with a message to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the warning.
#  @param p_message The message to show along with the warning.
#  @param p_function The function name where the warning occurred.
#  @param p_file The file where the warning occurred.
#  @param p_line The line where the warning occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime InterfacePrintWarning = def (p_description: PTRCONST[c_char], p_function: PTRCONST[c_char], p_file: PTRCONST[c_char], p_line: Int32, p_editor_notify: GDBool) thin


#  @name print_script_error
#  @since 4.1
#
#  Logs a script error to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the error.
#  @param p_function The function name where the error occurred.
#  @param p_file The file where the error occurred.
#  @param p_line The line where the error occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime InterfacePrintWarningWithMessage = def (p_description: PTRCONST[c_char], p_message: PTRCONST[c_char], p_function: PTRCONST[c_char], p_file: PTRCONST[c_char], p_line: Int32, p_editor_notify: GDBool) thin


#  @name print_script_error_with_message
#  @since 4.1
#
#  Logs a script error with a message to Godot's built-in debugger and to the OS terminal.
#
#  @param p_description The code triggering the error.
#  @param p_message The message to show along with the error.
#  @param p_function The function name where the error occurred.
#  @param p_file The file where the error occurred.
#  @param p_line The line where the error occurred.
#  @param p_editor_notify Whether or not to notify the editor.
#
comptime InterfacePrintScriptError = def (p_description: PTRCONST[c_char], p_function: PTRCONST[c_char], p_file: PTRCONST[c_char], p_line: Int32, p_editor_notify: GDBool) thin


#  @name get_native_struct_size
#  @since 4.1
#
#  Gets the size of a native struct (ex. ObjectID) in bytes.
#
#  @param p_name A pointer to a StringName identifying the struct name.
#
#  @return The size in bytes.
#
comptime InterfaceGetNativeStructSize = def (p_name: ConstStringNamePtr) thin -> UInt64


# INTERFACE: Variant


#  @name variant_new_copy
#  @since 4.1
#
#  Copies one Variant into a another.
#
#  @param r_dest A pointer to the destination Variant.
#  @param p_src A pointer to the source Variant.
#
comptime InterfaceVariantNewCopy = def (r_dest: UninitVariantPtr, p_src: ConstVariantPtr) thin


#  @name variant_new_nil
#  @since 4.1
#
#  Creates a new Variant containing nil.
#
#  @param r_dest A pointer to the destination Variant.
#
comptime InterfaceVariantNewNil = def (r_dest: UninitVariantPtr) thin


#  @name variant_destroy
#  @since 4.1
#
#  Destroys a Variant.
#
#  @param p_self A pointer to the Variant to destroy.
#
comptime InterfaceVariantDestroy = def (p_self: VariantPtr) thin


#  @name variant_call
#  @since 4.1
#
#  Calls a method on a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_method A pointer to a StringName identifying the method.
#  @param p_args A pointer to a C array of Variant.
#  @param p_argument_count The number of arguments.
#  @param r_return A pointer a Variant which will be assigned the return value.
#  @param r_error A pointer the structure which will hold error information.
#
#  @see Variant::callp()
#
comptime InterfaceVariantCall = def (p_self: VariantPtr, p_method: ConstStringNamePtr, p_args: PTRCONST[ConstVariantPtr], p_argument_count: GDInt, r_return: UninitVariantPtr, r_error: PTR[CallError]) thin


#  @name variant_call_static
#  @since 4.1
#
#  Calls a static method on a Variant.
#
#  @param p_type The variant type.
#  @param p_method A pointer to a StringName identifying the method.
#  @param p_args A pointer to a C array of Variant.
#  @param p_argument_count The number of arguments.
#  @param r_return A pointer a Variant which will be assigned the return value.
#  @param r_error A pointer the structure which will be updated with error information.
#
#  @see Variant::call_static()
#
comptime InterfaceVariantCallStatic = def (p_type: VariantType, p_method: ConstStringNamePtr, p_args: PTRCONST[ConstVariantPtr], p_argument_count: GDInt, r_return: UninitVariantPtr, r_error: PTR[CallError]) thin


#  @name variant_evaluate
#  @since 4.1
#
#  Evaluate an operator on two Variants.
#
#  @param p_op The operator to evaluate.
#  @param p_a The first Variant.
#  @param p_b The second Variant.
#  @param r_return A pointer a Variant which will be assigned the return value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @see Variant::evaluate()
#
comptime InterfaceVariantEvaluate = def (p_op: VariantOperator, p_a: ConstVariantPtr, p_b: ConstVariantPtr, r_return: UninitVariantPtr, r_valid: PTR[GDBool]) thin


#  @name variant_set
#  @since 4.1
#
#  Sets a key on a Variant to a value.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a Variant representing the key.
#  @param p_value A pointer to a Variant representing the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @see Variant::set()
#
comptime InterfaceVariantSet = def (p_self: VariantPtr, p_key: ConstVariantPtr, p_value: ConstVariantPtr, r_valid: PTR[GDBool]) thin


#  @name variant_set_named
#  @since 4.1
#
#  Sets a named key on a Variant to a value.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a StringName representing the key.
#  @param p_value A pointer to a Variant representing the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @see Variant::set_named()
#
comptime InterfaceVariantSetNamed = def (p_self: VariantPtr, p_key: ConstStringNamePtr, p_value: ConstVariantPtr, r_valid: PTR[GDBool]) thin


#  @name variant_set_keyed
#  @since 4.1
#
#  Sets a keyed property on a Variant to a value.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a Variant representing the key.
#  @param p_value A pointer to a Variant representing the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @see Variant::set_keyed()
#
comptime InterfaceVariantSetKeyed = def (p_self: VariantPtr, p_key: ConstVariantPtr, p_value: ConstVariantPtr, r_valid: PTR[GDBool]) thin


#  @name variant_set_indexed
#  @since 4.1
#
#  Sets an index on a Variant to a value.
#
#  @param p_self A pointer to the Variant.
#  @param p_index The index.
#  @param p_value A pointer to a Variant representing the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#  @param r_oob A pointer to a boolean which will be set to true if the index is out of bounds.
#
comptime InterfaceVariantSetIndexed = def (p_self: VariantPtr, p_index: GDInt, p_value: ConstVariantPtr, r_valid: PTR[GDBool], r_oob: PTR[GDBool]) thin


#  @name variant_get
#  @since 4.1
#
#  Gets the value of a key from a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a Variant representing the key.
#  @param r_ret A pointer to a Variant which will be assigned the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
comptime InterfaceVariantGet = def (p_self: ConstVariantPtr, p_key: ConstVariantPtr, r_ret: UninitVariantPtr, r_valid: PTR[GDBool]) thin


#  @name variant_get_named
#  @since 4.1
#
#  Gets the value of a named key from a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a StringName representing the key.
#  @param r_ret A pointer to a Variant which will be assigned the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
comptime GDExtensionInterfaceVariantGetNamed = fn (p_self: GDExtensionConstVariantPtr, p_key: GDExtensionConstStringNamePtr, r_ret: GDExtensionUninitializedVariantPtr, r_valid: C_Ptr[GDExtensionBool])


#  @name variant_get_keyed
#  @since 4.1
#
#  Gets the value of a keyed property from a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a Variant representing the key.
#  @param r_ret A pointer to a Variant which will be assigned the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
comptime GDExtensionInterfaceVariantGetKeyed = fn (p_self: GDExtensionConstVariantPtr, p_key: GDExtensionConstVariantPtr, r_ret: GDExtensionUninitializedVariantPtr, r_valid: C_Ptr[GDExtensionBool])


#  @name variant_get_indexed
#  @since 4.1
#
#  Gets the value of an index from a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_index The index.
#  @param r_ret A pointer to a Variant which will be assigned the value.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#  @param r_oob A pointer to a boolean which will be set to true if the index is out of bounds.
#
comptime GDExtensionInterfaceVariantGetIndexed = fn (p_self: GDExtensionConstVariantPtr, p_index: GDExtensionInt, r_ret: GDExtensionUninitializedVariantPtr, r_valid: C_Ptr[GDExtensionBool], r_oob: C_Ptr[GDExtensionBool])


#  @name variant_iter_init
#  @since 4.1
#
#  Initializes an iterator over a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param r_iter A pointer to a Variant which will be assigned the iterator.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @return true if the operation is valid; otherwise false.
#
#  @see Variant::iter_init()
#
comptime GDExtensionInterfaceVariantIterInit = fn (p_self: GDExtensionConstVariantPtr, r_iter: GDExtensionUninitializedVariantPtr, r_valid: C_Ptr[GDExtensionBool]) -> GDExtensionBool


#  @name variant_iter_next
#  @since 4.1
#
#  Gets the next value for an iterator over a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param r_iter A pointer to a Variant which will be assigned the iterator.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @return true if the operation is valid; otherwise false.
#
#  @see Variant::iter_next()
#
comptime GDExtensionInterfaceVariantIterNext = fn (p_self: GDExtensionConstVariantPtr, r_iter: GDExtensionVariantPtr, r_valid: C_Ptr[GDExtensionBool]) -> GDExtensionBool


#  @name variant_iter_get
#  @since 4.1
#
#  Gets the next value for an iterator over a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param r_iter A pointer to a Variant which will be assigned the iterator.
#  @param r_ret A pointer to a Variant which will be assigned false if the operation is invalid.
#  @param r_valid A pointer to a boolean which will be set to false if the operation is invalid.
#
#  @see Variant::iter_get()
#
comptime GDExtensionInterfaceVariantIterGet = fn (p_self: GDExtensionConstVariantPtr, r_iter: GDExtensionVariantPtr, r_ret: GDExtensionUninitializedVariantPtr, r_valid: C_Ptr[GDExtensionBool])


#  @name variant_hash
#  @since 4.1
#
#  Gets the hash of a Variant.
#
#  @param p_self A pointer to the Variant.
#
#  @return The hash value.
#
#  @see Variant::hash()
#
comptime GDExtensionInterfaceVariantHash = fn (p_self: GDExtensionConstVariantPtr) -> GDExtensionInt


#  @name variant_recursive_hash
#  @since 4.1
#
#  Gets the recursive hash of a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param p_recursion_count The number of recursive loops so far.
#
#  @return The hash value.
#
#  @see Variant::recursive_hash()
#
comptime GDExtensionInterfaceVariantRecursiveHash = fn (p_self: GDExtensionConstVariantPtr, p_recursion_count: GDExtensionInt) -> GDExtensionInt


#  @name variant_hash_compare
#  @since 4.1
#
#  Compares two Variants by their hash.
#
#  @param p_self A pointer to the Variant.
#  @param p_other A pointer to the other Variant to compare it to.
#
#  @return The hash value.
#
#  @see Variant::hash_compare()
#
comptime GDExtensionInterfaceVariantHashCompare = fn (p_self: GDExtensionConstVariantPtr, p_other: GDExtensionConstVariantPtr) -> GDExtensionBool


#  @name variant_booleanize
#  @since 4.1
#
#  Converts a Variant to a boolean.
#
#  @param p_self A pointer to the Variant.
#
#  @return The boolean value of the Variant.
#
comptime GDExtensionInterfaceVariantBooleanize = fn (p_self: GDExtensionConstVariantPtr) -> GDExtensionBool


#  @name variant_duplicate
#  @since 4.1
#
#  Duplicates a Variant.
#
#  @param p_self A pointer to the Variant.
#  @param r_ret A pointer to a Variant to store the duplicated value.
#  @param p_deep Whether or not to duplicate deeply (when supported by the Variant type).
#
comptime GDExtensionInterfaceVariantDuplicate = fn (p_self: GDExtensionConstVariantPtr, r_ret: GDExtensionVariantPtr, p_deep: GDExtensionBool)


#  @name variant_stringify
#  @since 4.1
#
#  Converts a Variant to a string.
#
#  @param p_self A pointer to the Variant.
#  @param r_ret A pointer to a String to store the resulting value.
#
comptime GDExtensionInterfaceVariantStringify = fn (p_self: GDExtensionConstVariantPtr, r_ret: GDExtensionStringPtr)


#  @name variant_get_type
#  @since 4.1
#
#  Gets the type of a Variant.
#
#  @param p_self A pointer to the Variant.
#
#  @return The variant type.
#
comptime GDExtensionInterfaceVariantGetType = fn (p_self: GDExtensionConstVariantPtr) -> GDExtensionVariantType


#  @name variant_has_method
#  @since 4.1
#
#  Checks if a Variant has the given method.
#
#  @param p_self A pointer to the Variant.
#  @param p_method A pointer to a StringName with the method name.
#
#  @return true if the variant has the given method; otherwise false.
#
comptime GDExtensionInterfaceVariantHasMethod = fn (p_self: GDExtensionConstVariantPtr, p_method: GDExtensionConstStringNamePtr) -> GDExtensionBool


#  @name variant_has_member
#  @since 4.1
#
#  Checks if a type of Variant has the given member.
#
#  @param p_type The Variant type.
#  @param p_member A pointer to a StringName with the member name.
#
#  @return true if the variant has the given method; otherwise false.
#
comptime GDExtensionInterfaceVariantHasMember = fn (p_type: GDExtensionVariantType, p_member: GDExtensionConstStringNamePtr) -> GDExtensionBool


#  @name variant_has_key
#  @since 4.1
#
#  Checks if a Variant has a key.
#
#  @param p_self A pointer to the Variant.
#  @param p_key A pointer to a Variant representing the key.
#  @param r_valid A pointer to a boolean which will be set to false if the key doesn't exist.
#
#  @return true if the key exists; otherwise false.
#
comptime GDExtensionInterfaceVariantHasKey = fn (p_self: GDExtensionConstVariantPtr, p_key: GDExtensionConstVariantPtr, r_valid: C_Ptr[GDExtensionBool]) -> GDExtensionBool


#  @name variant_get_object_instance_id
#  @since 4.4
#
#  Gets the object instance ID from a variant of type GDEXTENSION_VARIANT_TYPE_OBJECT.
#
#  If the variant isn't of type GDEXTENSION_VARIANT_TYPE_OBJECT, then zero will be returned.
#  The instance ID will be returned even if the object is no longer valid - use `object_get_instance_by_id()` to check if the object is still valid.
#
#  @param p_self A pointer to the Variant.
#
#  @return The instance ID for the contained object.
#
comptime GDExtensionInterfaceVariantGetObjectInstanceId = fn (p_self: GDExtensionConstVariantPtr) -> GDObjectInstanceID


#  @name variant_get_type_name
#  @since 4.1
#
#  Gets the name of a Variant type.
#
#  @param p_type The Variant type.
#  @param r_name A pointer to a String to store the Variant type name.
#
comptime GDExtensionInterfaceVariantGetTypeName = fn (p_type: GDExtensionVariantType, r_name: GDExtensionUninitializedStringPtr)


#  @name variant_can_convert
#  @since 4.1
#
#  Checks if Variants can be converted from one type to another.
#
#  @param p_from The Variant type to convert from.
#  @param p_to The Variant type to convert to.
#
#  @return true if the conversion is possible; otherwise false.
#
comptime GDExtensionInterfaceVariantCanConvert = fn (p_from: GDExtensionVariantType, p_to: GDExtensionVariantType) -> GDExtensionBool


#  @name variant_can_convert_strict
#  @since 4.1
#
#  Checks if Variant can be converted from one type to another using stricter rules.
#
#  @param p_from The Variant type to convert from.
#  @param p_to The Variant type to convert to.
#
#  @return true if the conversion is possible; otherwise false.
#
comptime GDExtensionInterfaceVariantCanConvertStrict = fn (p_from: GDExtensionVariantType, p_to: GDExtensionVariantType) -> GDExtensionBool


#  @name get_variant_from_type_constructor
#  @since 4.1
#
#  Gets a pointer to a function that can create a Variant of the given type from a raw value.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can create a Variant of the given type from a raw value.
#
comptime GDExtensionInterfaceGetVariantFromTypeConstructor = fn (p_type: GDExtensionVariantType) -> GDExtensionVariantFromTypeConstructorFunc


#  @name get_variant_to_type_constructor
#  @since 4.1
#
#  Gets a pointer to a function that can get the raw value from a Variant of the given type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can get the raw value from a Variant of the given type.
#
comptime GDExtensionInterfaceGetVariantToTypeConstructor = fn (p_type: GDExtensionVariantType) -> GDExtensionTypeFromVariantConstructorFunc


#  @name variant_get_ptr_internal_getter
#  @since 4.4
#
#  Provides a function pointer for retrieving a pointer to a variant's internal value.
#  Access to a variant's internal value can be used to modify it in-place, or to retrieve its value without the overhead of variant conversion functions.
#  It is recommended to cache the getter for all variant types in a function table to avoid retrieval overhead upon use.
#
#  @note Each function assumes the variant's type has already been determined and matches the function.
#  Invoking the function with a variant of a mismatched type has undefined behavior, and may lead to a segmentation fault.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a type-specific function that returns a pointer to the internal value of a variant. Check the implementation of this function (gdextension_variant_get_ptr_internal_getter) for pointee type info of each variant type.
#
comptime GDExtensionInterfaceGetVariantGetInternalPtrFunc = fn (p_type: GDExtensionVariantType) -> GDExtensionVariantGetInternalPtrFunc


#  @name variant_get_ptr_operator_evaluator
#  @since 4.1
#
#  Gets a pointer to a function that can evaluate the given Variant operator on the given Variant types.
#
#  @param p_operator The variant operator.
#  @param p_type_a The type of the first Variant.
#  @param p_type_b The type of the second Variant.
#
#  @return A pointer to a function that can evaluate the given Variant operator on the given Variant types.
#
comptime GDExtensionInterfaceVariantGetPtrOperatorEvaluator = fn (p_operator: GDExtensionVariantOperator, p_type_a: GDExtensionVariantType, p_type_b: GDExtensionVariantType) -> GDExtensionPtrOperatorEvaluator


#  @name variant_get_ptr_builtin_method
#  @since 4.1
#
#  Gets a pointer to a function that can call a builtin method on a type of Variant.
#
#  @param p_type The Variant type.
#  @param p_method A pointer to a StringName with the method name.
#  @param p_hash A hash representing the method signature.
#
#  @return A pointer to a function that can call a builtin method on a type of Variant.
#
comptime GDExtensionInterfaceVariantGetPtrBuiltinMethod = fn (p_type: GDExtensionVariantType, p_method: GDExtensionConstStringNamePtr, p_hash: GDExtensionInt) -> GDExtensionPtrBuiltInMethod


#  @name variant_get_ptr_constructor
#  @since 4.1
#
#  Gets a pointer to a function that can call one of the constructors for a type of Variant.
#
#  @param p_type The Variant type.
#  @param p_constructor The index of the constructor.
#
#  @return A pointer to a function that can call one of the constructors for a type of Variant.
#
comptime GDExtensionInterfaceVariantGetPtrConstructor = fn (p_type: GDExtensionVariantType, p_constructor: Int32) -> GDExtensionPtrConstructor


#  @name variant_get_ptr_destructor
#  @since 4.1
#
#  Gets a pointer to a function than can call the destructor for a type of Variant.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function than can call the destructor for a type of Variant.
#
comptime GDExtensionInterfaceVariantGetPtrDestructor = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrDestructor

#  @name variant_construct
#  @since 4.1
#
#  Constructs a Variant of the given type, using the first constructor that matches the given arguments.
#
#  @param p_type The Variant type.
#  @param r_base A pointer to a Variant to store the constructed value.
#  @param p_args A pointer to a C array of Variant pointers representing the arguments for the constructor.
#  @param p_argument_count The number of arguments to pass to the constructor.
#  @param r_error A pointer the structure which will be updated with error information.
#
comptime GDExtensionInterfaceVariantConstruct = fn (p_type: GDExtensionVariantType, r_base: GDExtensionUninitializedVariantPtr, p_args: C_PtrConst[GDExtensionConstVariantPtr], p_argument_count: Int32, r_error: C_Ptr[GDExtensionCallError])


#  @name variant_get_ptr_setter
#  @since 4.1
#
#  Gets a pointer to a function that can call a member's setter on the given Variant type.
#
#  @param p_type The Variant type.
#  @param p_member A pointer to a StringName with the member name.
#
#  @return A pointer to a function that can call a member's setter on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrSetter = fn (p_type: GDExtensionVariantType, p_member: GDExtensionConstStringNamePtr) -> GDExtensionPtrSetter


#  @name variant_get_ptr_getter
#  @since 4.1
#
#  Gets a pointer to a function that can call a member's getter on the given Variant type.
#
#  @param p_type The Variant type.
#  @param p_member A pointer to a StringName with the member name.
#
#  @return A pointer to a function that can call a member's getter on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrGetter = fn (p_type: GDExtensionVariantType, p_member: GDExtensionConstStringNamePtr) -> GDExtensionPtrGetter


#  @name variant_get_ptr_indexed_setter
#  @since 4.1
#
#  Gets a pointer to a function that can set an index on the given Variant type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can set an index on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrIndexedSetter = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrIndexedSetter


#  @name variant_get_ptr_indexed_getter
#  @since 4.1
#
#  Gets a pointer to a function that can get an index on the given Variant type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can get an index on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrIndexedGetter = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrIndexedGetter


#  @name variant_get_ptr_keyed_setter
#  @since 4.1
#
#  Gets a pointer to a function that can set a key on the given Variant type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can set a key on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrKeyedSetter = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrKeyedSetter


#  @name variant_get_ptr_keyed_getter
#  @since 4.1
#
#  Gets a pointer to a function that can get a key on the given Variant type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can get a key on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrKeyedGetter = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrKeyedGetter


#  @name variant_get_ptr_keyed_checker
#  @since 4.1
#
#  Gets a pointer to a function that can check a key on the given Variant type.
#
#  @param p_type The Variant type.
#
#  @return A pointer to a function that can check a key on the given Variant type.
#
comptime GDExtensionInterfaceVariantGetPtrKeyedChecker = fn (p_type: GDExtensionVariantType) -> GDExtensionPtrKeyedChecker


#  @name variant_get_constant_value
#  @since 4.1
#
#  Gets the value of a constant from the given Variant type.
#
#  @param p_type The Variant type.
#  @param p_constant A pointer to a StringName with the constant name.
#  @param r_ret A pointer to a Variant to store the value.
#
comptime GDExtensionInterfaceVariantGetConstantValue = fn (p_type: GDExtensionVariantType, p_constant: GDExtensionConstStringNamePtr, r_ret: GDExtensionUninitializedVariantPtr)


#  @name variant_get_ptr_utility_function
#  @since 4.1
#
#  Gets a pointer to a function that can call a Variant utility function.
#
#  @param p_function A pointer to a StringName with the function name.
#  @param p_hash A hash representing the function signature.
#
#  @return A pointer to a function that can call a Variant utility function.
#
comptime GDExtensionInterfaceVariantGetPtrUtilityFunction = fn (p_function: GDExtensionConstStringNamePtr, p_hash: GDExtensionInt) -> GDExtensionPtrUtilityFunction


# INTERFACE: String Utilities


#  @name string_new_with_latin1_chars
#  @since 4.1
#
#  Creates a String from a Latin-1 encoded C string.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a Latin-1 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringNewWithLatin1Chars = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char])


#  @name string_new_with_utf8_chars
#  @since 4.1
#
#  Creates a String from a UTF-8 encoded C string.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-8 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringNewWithUtf8Chars = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char])


#  @name string_new_with_utf16_chars
#  @since 4.1
#
#  Creates a String from a UTF-16 encoded C string.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-16 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringNewWithUtf16Chars = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char16])


#  @name string_new_with_utf32_chars
#  @since 4.1
#
#  Creates a String from a UTF-32 encoded C string.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-32 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringNewWithUtf32Chars = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char32])


#  @name string_new_with_wide_chars
#  @since 4.1
#
#  Creates a String from a wide C string.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a wide C string (null terminated).
#
comptime GDExtensionInterfaceStringNewWithWideChars = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_wchar])


#  @name string_new_with_latin1_chars_and_len
#  @since 4.1
#
#  Creates a String from a Latin-1 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a Latin-1 encoded C string.
#  @param p_size The number of characters (= number of bytes).
#
comptime GDExtensionInterfaceStringNewWithLatin1CharsAndLen = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char], p_size: GDExtensionInt)


#  @name string_new_with_utf8_chars_and_len
#  @since 4.1
#  @deprecated in Godot 4.3. Use `string_new_with_utf8_chars_and_len2` instead.
#
#  Creates a String from a UTF-8 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-8 encoded C string.
#  @param p_size The number of bytes (not code units).
#
comptime GDExtensionInterfaceStringNewWithUtf8CharsAndLen = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char], p_size: GDExtensionInt)


#  @name string_new_with_utf8_chars_and_len2
#  @since 4.3
#
#  Creates a String from a UTF-8 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-8 encoded C string.
#  @param p_size The number of bytes (not code units).
#
#  @return Error code signifying if the operation successful.
#
comptime GDExtensionInterfaceStringNewWithUtf8CharsAndLen2 = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char], p_size: GDExtensionInt) -> GDExtensionInt


#  @name string_new_with_utf16_chars_and_len
#  @since 4.1
#  @deprecated in Godot 4.3. Use `string_new_with_utf16_chars_and_len2` instead.
#
#  Creates a String from a UTF-16 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-16 encoded C string.
#  @param p_char_count The number of characters (not bytes).
#
comptime GDExtensionInterfaceStringNewWithUtf16CharsAndLen = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char16], p_char_count: GDExtensionInt)


#  @name string_new_with_utf16_chars_and_len2
#  @since 4.3
#
#  Creates a String from a UTF-16 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-16 encoded C string.
#  @param p_char_count The number of characters (not bytes).
#  @param p_default_little_endian If true, UTF-16 use little endian.
#
#  @return Error code signifying if the operation successful.
#
comptime GDExtensionInterfaceStringNewWithUtf16CharsAndLen2 = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char16], p_char_count: GDExtensionInt, p_default_little_endian: GDExtensionBool) -> GDExtensionInt


#  @name string_new_with_utf32_chars_and_len
#  @since 4.1
#
#  Creates a String from a UTF-32 encoded C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a UTF-32 encoded C string.
#  @param p_char_count The number of characters (not bytes).
#
comptime GDExtensionInterfaceStringNewWithUtf32CharsAndLen = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_char32], p_char_count: GDExtensionInt)


#  @name string_new_with_wide_chars_and_len
#  @since 4.1
#
#  Creates a String from a wide C string with the given length.
#
#  @param r_dest A pointer to a Variant to hold the newly created String.
#  @param p_contents A pointer to a wide C string.
#  @param p_char_count The number of characters (not bytes).
#
comptime GDExtensionInterfaceStringNewWithWideCharsAndLen = fn (r_dest: GDExtensionUninitializedStringPtr, p_contents: C_PtrConst[c_wchar], p_char_count: GDExtensionInt)


#  @name string_to_latin1_chars
#  @since 4.1
#
#  Converts a String to a Latin-1 encoded C string.
#
#  It doesn't write a null terminator.
#
#  @param p_self A pointer to the String.
#  @param r_text A pointer to the buffer to hold the resulting data. If NULL is passed in, only the length will be computed.
#  @param p_max_write_length The maximum number of characters that can be written to r_text. It has no affect on the return value.
#
#  @return The resulting encoded string length in characters (not bytes), not including a null terminator.
#
comptime GDExtensionInterfaceStringToLatin1Chars = fn (p_self: GDExtensionConstStringPtr, r_text: C_Ptr[c_char], p_max_write_length: GDExtensionInt) -> GDExtensionInt


#  @name string_to_utf8_chars
#  @since 4.1
#
#  Converts a String to a UTF-8 encoded C string.
#
#  It doesn't write a null terminator.
#
#  @param p_self A pointer to the String.
#  @param r_text A pointer to the buffer to hold the resulting data. If NULL is passed in, only the length will be computed.
#  @param p_max_write_length The maximum number of characters that can be written to r_text. It has no affect on the return value.
#
#  @return The resulting encoded string length in characters (not bytes), not including a null terminator.
#
comptime GDExtensionInterfaceStringToUtf8Chars = fn (p_self: GDExtensionConstStringPtr, r_text: C_Ptr[c_char], p_max_write_length: GDExtensionInt) -> GDExtensionInt


#  @name string_to_utf16_chars
#  @since 4.1
#
#  Converts a String to a UTF-16 encoded C string.
#
#  It doesn't write a null terminator.
#
#  @param p_self A pointer to the String.
#  @param r_text A pointer to the buffer to hold the resulting data. If NULL is passed in, only the length will be computed.
#  @param p_max_write_length The maximum number of characters that can be written to r_text. It has no affect on the return value.
#
#  @return The resulting encoded string length in characters (not bytes), not including a null terminator.
#
comptime GDExtensionInterfaceStringToUtf16Chars = fn (p_self: GDExtensionConstStringPtr, r_text: C_Ptr[c_char16], p_max_write_length: GDExtensionInt) -> GDExtensionInt


#  @name string_to_utf32_chars
#  @since 4.1
#
#  Converts a String to a UTF-32 encoded C string.
#
#  It doesn't write a null terminator.
#
#  @param p_self A pointer to the String.
#  @param r_text A pointer to the buffer to hold the resulting data. If NULL is passed in, only the length will be computed.
#  @param p_max_write_length The maximum number of characters that can be written to r_text. It has no affect on the return value.
#
#  @return The resulting encoded string length in characters (not bytes), not including a null terminator.
#
comptime GDExtensionInterfaceStringToUtf32Chars = fn (p_self: GDExtensionConstStringPtr, r_text: C_Ptr[c_char32], p_max_write_length: GDExtensionInt) -> GDExtensionInt


#  @name string_to_wide_chars
#  @since 4.1
#
#  Converts a String to a wide C string.
#
#  It doesn't write a null terminator.
#
#  @param p_self A pointer to the String.
#  @param r_text A pointer to the buffer to hold the resulting data. If NULL is passed in, only the length will be computed.
#  @param p_max_write_length The maximum number of characters that can be written to r_text. It has no affect on the return value.
#
#  @return The resulting encoded string length in characters (not bytes), not including a null terminator.
#
comptime GDExtensionInterfaceStringToWideChars = fn (p_self: GDExtensionConstStringPtr, r_text: C_Ptr[c_wchar], p_max_write_length: GDExtensionInt) -> GDExtensionInt


#  @name string_operator_index
#  @since 4.1
#
#  Gets a pointer to the character at the given index from a String.
#
#  @param p_self A pointer to the String.
#  @param p_index The index.
#
#  @return A pointer to the requested character.
#
comptime GDExtensionInterfaceStringOperatorIndex = fn (p_self: GDExtensionStringPtr, p_index: GDExtensionInt) -> C_Ptr[c_char32]


#  @name string_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to the character at the given index from a String.
#
#  @param p_self A pointer to the String.
#  @param p_index The index.
#
#  @return A const pointer to the requested character.
#
comptime GDExtensionInterfaceStringOperatorIndexConst = fn (p_self: GDExtensionConstStringPtr, p_index: GDExtensionInt) -> C_PtrConst[c_char32]


#  @name string_operator_plus_eq_string
#  @since 4.1
#
#  Appends another String to a String.
#
#  @param p_self A pointer to the String.
#  @param p_b A pointer to the other String to append.
#
comptime GDExtensionInterfaceStringOperatorPlusEqString = fn (p_self: GDExtensionStringPtr, p_b: GDExtensionConstStringPtr)


#  @name string_operator_plus_eq_char
#  @since 4.1
#
#  Appends a character to a String.
#
#  @param p_self A pointer to the String.
#  @param p_b A pointer to the character to append.
#
comptime GDExtensionInterfaceStringOperatorPlusEqChar = fn (p_self: GDExtensionStringPtr, p_b: c_char32)


#  @name string_operator_plus_eq_cstr
#  @since 4.1
#
#  Appends a Latin-1 encoded C string to a String.
#
#  @param p_self A pointer to the String.
#  @param p_b A pointer to a Latin-1 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringOperatorPlusEqCstr = fn (p_self: GDExtensionStringPtr, p_b: C_PtrConst[c_char])


#  @name string_operator_plus_eq_wcstr
#  @since 4.1
#
#  Appends a wide C string to a String.
#
#  @param p_self A pointer to the String.
#  @param p_b A pointer to a wide C string (null terminated).
#
comptime GDExtensionInterfaceStringOperatorPlusEqWcstr = fn (p_self: GDExtensionStringPtr, p_b: C_PtrConst[c_wchar])


#  @name string_operator_plus_eq_c32str
#  @since 4.1
#
#  Appends a UTF-32 encoded C string to a String.
#
#  @param p_self A pointer to the String.
#  @param p_b A pointer to a UTF-32 encoded C string (null terminated).
#
comptime GDExtensionInterfaceStringOperatorPlusEqC32str = fn (p_self: GDExtensionStringPtr, p_b: C_PtrConst[c_char32])


#  @name string_resize
#  @since 4.2
#
#  Resizes the underlying string data to the given number of characters.
#
#  Space needs to be allocated for the null terminating character ('\0') which
#  also must be added manually, in order for all string functions to work correctly.
#
#  Warning: This is an error-prone operation - only use it if there's no other
#  efficient way to accomplish your goal.
#
#  @param p_self A pointer to the String.
#  @param p_resize The new length for the String.
#
#  @return Error code signifying if the operation successful.
#
comptime GDExtensionInterfaceStringResize = fn (p_self: GDExtensionStringPtr, p_resize: GDExtensionInt) -> GDExtensionInt

# INTERFACE: StringName Utilities


#  @name string_name_new_with_latin1_chars
#  @since 4.2
#
#  Creates a StringName from a Latin-1 encoded C string.
#
#  If `p_is_static` is true, then:
#  - The StringName will reuse the `p_contents` buffer instead of copying it.
#    You must guarantee that the buffer remains valid for the duration of the application (e.g. string literal).
#  - You must not call a destructor for this StringName. Incrementing the initial reference once should achieve this.
#
#  `p_is_static` is purely an optimization and can easily introduce undefined behavior if used wrong. In case of doubt, set it to false.
#
#  @param r_dest A pointer to uninitialized storage, into which the newly created StringName is constructed.
#  @param p_contents A pointer to a C string (null terminated and Latin-1 or ASCII encoded).
#  @param p_is_static Whether the StringName reuses the buffer directly (see above).
#
comptime GDExtensionInterfaceStringNameNewWithLatin1Chars = fn (r_dest: GDExtensionUninitializedStringNamePtr, p_contents: C_PtrConst[c_char], p_is_static: GDExtensionBool)


#  @name string_name_new_with_utf8_chars
#  @since 4.2
#
#  Creates a StringName from a UTF-8 encoded C string.
#
#  @param r_dest A pointer to uninitialized storage, into which the newly created StringName is constructed.
#  @param p_contents A pointer to a C string (null terminated and UTF-8 encoded).
#
comptime GDExtensionInterfaceStringNameNewWithUtf8Chars = fn (r_dest: GDExtensionUninitializedStringNamePtr, p_contents: C_PtrConst[c_char])


#  @name string_name_new_with_utf8_chars_and_len
#  @since 4.2
#
#  Creates a StringName from a UTF-8 encoded string with a given number of characters.
#
#  @param r_dest A pointer to uninitialized storage, into which the newly created StringName is constructed.
#  @param p_contents A pointer to a C string (null terminated and UTF-8 encoded).
#  @param p_size The number of bytes (not UTF-8 code points).
#
comptime GDExtensionInterfaceStringNameNewWithUtf8CharsAndLen = fn (r_dest: GDExtensionUninitializedStringNamePtr, p_contents: C_PtrConst[c_char], p_size: GDExtensionInt)

# INTERFACE: XMLParser Utilities


#  @name xml_parser_open_buffer
#  @since 4.1
#
#  Opens a raw XML buffer on an XMLParser instance.
#
#  @param p_instance A pointer to an XMLParser object.
#  @param p_buffer A pointer to the buffer.
#  @param p_size The size of the buffer.
#
#  @return A Godot error code (ex. OK, ERR_INVALID_DATA, etc).
#
#  @see XMLParser::open_buffer()
#
comptime GDExtensionInterfaceXmlParserOpenBuffer = fn (p_instance: GDExtensionObjectPtr, p_buffer: C_PtrConst[UInt8], p_size: c_size_t) -> GDExtensionInt

# INTERFACE: FileAccess Utilities


#  @name file_access_store_buffer
#  @since 4.1
#
#  Stores the given buffer using an instance of FileAccess.
#
#  @param p_instance A pointer to a FileAccess object.
#  @param p_src A pointer to the buffer.
#  @param p_length The size of the buffer.
#
#  @see FileAccess::store_buffer()
#
comptime GDExtensionInterfaceFileAccessStoreBuffer = fn (p_instance: GDExtensionObjectPtr, p_src: C_PtrConst[UInt8], p_length: UInt64)


#  @name file_access_get_buffer
#  @since 4.1
#
#  Reads the next p_length bytes into the given buffer using an instance of FileAccess.
#
#  @param p_instance A pointer to a FileAccess object.
#  @param p_dst A pointer to the buffer to store the data.
#  @param p_length The requested number of bytes to read.
#
#  @return The actual number of bytes read (may be less than requested).
#
comptime GDExtensionInterfaceFileAccessGetBuffer = fn (p_instance: GDExtensionConstObjectPtr, p_dst: C_Ptr[UInt8], p_length: UInt64) -> UInt64

# INTERFACE: Image Utilities


#  @name image_ptrw
#  @since 4.3
#
#  Returns writable pointer to internal Image buffer.
#
#  @param p_instance A pointer to a Image object.
#
#  @return Pointer to internal Image buffer.
#
#  @see Image::ptrw()
#
comptime GDExtensionInterfaceImagePtrw = fn (p_instance: GDExtensionObjectPtr) -> C_Ptr[UInt8]


#  @name image_ptr
#  @since 4.3
#
#  Returns read only pointer to internal Image buffer.
#
#  @param p_instance A pointer to a Image object.
#
#  @return Pointer to internal Image buffer.
#
#  @see Image::ptr()
#
comptime GDExtensionInterfaceImagePtr = fn (p_instance: GDExtensionObjectPtr) -> C_PtrConst[UInt8]

# INTERFACE: WorkerThreadPool Utilities


#  @name worker_thread_pool_add_native_group_task
#  @since 4.1
#
#  Adds a group task to an instance of WorkerThreadPool.
#
#  @param p_instance A pointer to a WorkerThreadPool object.
#  @param p_func A pointer to a function to run in the thread pool.
#  @param p_userdata A pointer to arbitrary data which will be passed to p_func.
#  @param p_elements The number of element needed in the group.
#  @param p_tasks The number of tasks needed in the group.
#  @param p_high_priority Whether or not this is a high priority task.
#  @param p_description A pointer to a String with the task description.
#
#  @return The task group ID.
#
#  @see WorkerThreadPool::add_group_task()
#
comptime GDExtensionInterfaceWorkerThreadPoolAddNativeGroupTask = fn (p_instance: GDExtensionObjectPtr, p_func: GDExtensionWorkerThreadPoolGroupTask, p_userdata: C_VoidPtr, p_elements: c_int, p_tasks: c_int, p_high_priority: GDExtensionBool, p_description: GDExtensionConstStringPtr) -> Int64


#  @name worker_thread_pool_add_native_task
#  @since 4.1
#
#  Adds a task to an instance of WorkerThreadPool.
#
#  @param p_instance A pointer to a WorkerThreadPool object.
#  @param p_func A pointer to a function to run in the thread pool.
#  @param p_userdata A pointer to arbitrary data which will be passed to p_func.
#  @param p_high_priority Whether or not this is a high priority task.
#  @param p_description A pointer to a String with the task description.
#
#  @return The task ID.
#
comptime GDExtensionInterfaceWorkerThreadPoolAddNativeTask = fn (p_instance: GDExtensionObjectPtr, p_func: GDExtensionWorkerThreadPoolTask, p_userdata: C_VoidPtr, p_high_priority: GDExtensionBool, p_description: GDExtensionConstStringPtr) -> Int64

# INTERFACE: Packed Array


#  @name packed_byte_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a byte in a PackedByteArray.
#
#  @param p_self A pointer to a PackedByteArray object.
#  @param p_index The index of the byte to get.
#
#  @return A pointer to the requested byte.
#
comptime GDExtensionInterfacePackedByteArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> C_Ptr[UInt8]


#  @name packed_byte_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a byte in a PackedByteArray.
#
#  @param p_self A const pointer to a PackedByteArray object.
#  @param p_index The index of the byte to get.
#
#  @return A const pointer to the requested byte.
#
comptime GDExtensionInterfacePackedByteArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> C_PtrConst[UInt8]


#  @name packed_float32_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a 32-bit float in a PackedFloat32Array.
#
#  @param p_self A pointer to a PackedFloat32Array object.
#  @param p_index The index of the float to get.
#
#  @return A pointer to the requested 32-bit float.
#
comptime GDExtensionInterfacePackedFloat32ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> C_Ptr[c_float]


#  @name packed_float32_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a 32-bit float in a PackedFloat32Array.
#
#  @param p_self A const pointer to a PackedFloat32Array object.
#  @param p_index The index of the float to get.
#
#  @return A const pointer to the requested 32-bit float.
#
comptime GDExtensionInterfacePackedFloat32ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> C_PtrConst[c_float]


#  @name packed_float64_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a 64-bit float in a PackedFloat64Array.
#
#  @param p_self A pointer to a PackedFloat64Array object.
#  @param p_index The index of the float to get.
#
#  @return A pointer to the requested 64-bit float.
#
comptime GDExtensionInterfacePackedFloat64ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> C_Ptr[c_double]


#  @name packed_float64_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a 64-bit float in a PackedFloat64Array.
#
#  @param p_self A const pointer to a PackedFloat64Array object.
#  @param p_index The index of the float to get.
#
#  @return A const pointer to the requested 64-bit float.
#
comptime GDExtensionInterfacePackedFloat64ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> C_PtrConst[c_double]


#  @name packed_int32_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a 32-bit integer in a PackedInt32Array.
#
#  @param p_self A pointer to a PackedInt32Array object.
#  @param p_index The index of the integer to get.
#
#  @return A pointer to the requested 32-bit integer.
#
comptime GDExtensionInterfacePackedInt32ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> C_Ptr[Int32]


#  @name packed_int32_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a 32-bit integer in a PackedInt32Array.
#
#  @param p_self A const pointer to a PackedInt32Array object.
#  @param p_index The index of the integer to get.
#
#  @return A const pointer to the requested 32-bit integer.
#
comptime GDExtensionInterfacePackedInt32ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> C_PtrConst[Int32]


#  @name packed_int64_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a 64-bit integer in a PackedInt64Array.
#
#  @param p_self A pointer to a PackedInt64Array object.
#  @param p_index The index of the integer to get.
#
#  @return A pointer to the requested 64-bit integer.
#
comptime GDExtensionInterfacePackedInt64ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> C_Ptr[Int64]


#  @name packed_int64_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a 64-bit integer in a PackedInt64Array.
#
#  @param p_self A const pointer to a PackedInt64Array object.
#  @param p_index The index of the integer to get.
#
#  @return A const pointer to the requested 64-bit integer.
#
comptime GDExtensionInterfacePackedInt64ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> C_PtrConst[Int64]


#  @name packed_string_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a string in a PackedStringArray.
#
#  @param p_self A pointer to a PackedStringArray object.
#  @param p_index The index of the String to get.
#
#  @return A pointer to the requested String.
#
comptime GDExtensionInterfacePackedStringArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionStringPtr


#  @name packed_string_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a string in a PackedStringArray.
#
#  @param p_self A const pointer to a PackedStringArray object.
#  @param p_index The index of the String to get.
#
#  @return A const pointer to the requested String.
#
comptime GDExtensionInterfacePackedStringArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionStringPtr


#  @name packed_vector2_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a Vector2 in a PackedVector2Array.
#
#  @param p_self A pointer to a PackedVector2Array object.
#  @param p_index The index of the Vector2 to get.
#
#  @return A pointer to the requested Vector2.
#
comptime GDExtensionInterfacePackedVector2ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_vector2_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a Vector2 in a PackedVector2Array.
#
#  @param p_self A const pointer to a PackedVector2Array object.
#  @param p_index The index of the Vector2 to get.
#
#  @return A const pointer to the requested Vector2.
#
comptime GDExtensionInterfacePackedVector2ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_vector3_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a Vector3 in a PackedVector3Array.
#
#  @param p_self A pointer to a PackedVector3Array object.
#  @param p_index The index of the Vector3 to get.
#
#  @return A pointer to the requested Vector3.
#
comptime GDExtensionInterfacePackedVector3ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_vector3_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a Vector3 in a PackedVector3Array.
#
#  @param p_self A const pointer to a PackedVector3Array object.
#  @param p_index The index of the Vector3 to get.
#
#  @return A const pointer to the requested Vector3.
#
comptime GDExtensionInterfacePackedVector3ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_vector4_array_operator_index
#  @since 4.3
#
#  Gets a pointer to a Vector4 in a PackedVector4Array.
#
#  @param p_self A pointer to a PackedVector4Array object.
#  @param p_index The index of the Vector4 to get.
#
#  @return A pointer to the requested Vector4.
#
comptime GDExtensionInterfacePackedVector4ArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_vector4_array_operator_index_const
#  @since 4.3
#
#  Gets a const pointer to a Vector4 in a PackedVector4Array.
#
#  @param p_self A const pointer to a PackedVector4Array object.
#  @param p_index The index of the Vector4 to get.
#
#  @return A const pointer to the requested Vector4.
#
comptime GDExtensionInterfacePackedVector4ArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_color_array_operator_index
#  @since 4.1
#
#  Gets a pointer to a color in a PackedColorArray.
#
#  @param p_self A pointer to a PackedColorArray object.
#  @param p_index The index of the Color to get.
#
#  @return A pointer to the requested Color.
#
comptime GDExtensionInterfacePackedColorArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name packed_color_array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a color in a PackedColorArray.
#
#  @param p_self A const pointer to a PackedColorArray object.
#  @param p_index The index of the Color to get.
#
#  @return A const pointer to the requested Color.
#
comptime GDExtensionInterfacePackedColorArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionTypePtr


#  @name array_operator_index
#  @since 4.1
#
#  Gets a pointer to a Variant in an Array.
#
#  @param p_self A pointer to an Array object.
#  @param p_index The index of the Variant to get.
#
#  @return A pointer to the requested Variant.
#
comptime GDExtensionInterfaceArrayOperatorIndex = fn (p_self: GDExtensionTypePtr, p_index: GDExtensionInt) -> GDExtensionVariantPtr


#  @name array_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a Variant in an Array.
#
#  @param p_self A const pointer to an Array object.
#  @param p_index The index of the Variant to get.
#
#  @return A const pointer to the requested Variant.
#
comptime GDExtensionInterfaceArrayOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_index: GDExtensionInt) -> GDExtensionVariantPtr


#  @name array_ref
#  @since 4.1
#  @deprecated in Godot 4.5. use `Array::operator=` instead.
#
#  Sets an Array to be a reference to another Array object.
#
#  @param p_self A pointer to the Array object to update.
#  @param p_from A pointer to the Array object to reference.
#
comptime GDExtensionInterfaceArrayRef = fn (p_self: GDExtensionTypePtr, p_from: GDExtensionConstTypePtr)


#  @name array_set_typed
#  @since 4.1
#
#  Makes an Array into a typed Array.
#
#  @param p_self A pointer to the Array.
#  @param p_type The type of Variant the Array will store.
#  @param p_class_name A pointer to a StringName with the name of the object (if p_type is GDEXTENSION_VARIANT_TYPE_OBJECT).
#  @param p_script A pointer to a Script object (if p_type is GDEXTENSION_VARIANT_TYPE_OBJECT and the base class is extended by a script).
#
comptime GDExtensionInterfaceArraySetTyped = fn (p_self: GDExtensionTypePtr, p_type: GDExtensionVariantType, p_class_name: GDExtensionConstStringNamePtr, p_script: GDExtensionConstVariantPtr)

# INTERFACE: Dictionary


#  @name dictionary_operator_index
#  @since 4.1
#
#  Gets a pointer to a Variant in a Dictionary with the given key.
#
#  @param p_self A pointer to a Dictionary object.
#  @param p_key A pointer to a Variant representing the key.
#
#  @return A pointer to a Variant representing the value at the given key.
#
comptime GDExtensionInterfaceDictionaryOperatorIndex = fn (p_self: GDExtensionTypePtr, p_key: GDExtensionConstVariantPtr) -> GDExtensionVariantPtr


#  @name dictionary_operator_index_const
#  @since 4.1
#
#  Gets a const pointer to a Variant in a Dictionary with the given key.
#
#  @param p_self A const pointer to a Dictionary object.
#  @param p_key A pointer to a Variant representing the key.
#
#  @return A const pointer to a Variant representing the value at the given key.
#
comptime GDExtensionInterfaceDictionaryOperatorIndexConst = fn (p_self: GDExtensionConstTypePtr, p_key: GDExtensionConstVariantPtr) -> GDExtensionVariantPtr


#  @name dictionary_set_typed
#  @since 4.4
#
#  Makes a Dictionary into a typed Dictionary.
#
#  @param p_self A pointer to the Dictionary.
#  @param p_key_type The type of Variant the Dictionary key will store.
#  @param p_key_class_name A pointer to a StringName with the name of the object (if p_key_type is GDEXTENSION_VARIANT_TYPE_OBJECT).
#  @param p_key_script A pointer to a Script object (if p_key_type is GDEXTENSION_VARIANT_TYPE_OBJECT and the base class is extended by a script).
#  @param p_value_type The type of Variant the Dictionary value will store.
#  @param p_value_class_name A pointer to a StringName with the name of the object (if p_value_type is GDEXTENSION_VARIANT_TYPE_OBJECT).
#  @param p_value_script A pointer to a Script object (if p_value_type is GDEXTENSION_VARIANT_TYPE_OBJECT and the base class is extended by a script).
#
comptime GDExtensionInterfaceDictionarySetTyped = fn (p_self: GDExtensionTypePtr, p_key_type: GDExtensionVariantType, p_key_class_name: GDExtensionConstStringNamePtr, p_key_script: GDExtensionConstVariantPtr, p_value_type: GDExtensionVariantType, p_value_class_name: GDExtensionConstStringNamePtr, p_value_script: GDExtensionConstVariantPtr)

# INTERFACE: Object


#  @name object_method_bind_call
#  @since 4.1
#
#  Calls a method on an Object.
#
#  @param p_method_bind A pointer to the MethodBind representing the method on the Object's class.
#  @param p_instance A pointer to the Object.
#  @param p_args A pointer to a C array of Variants representing the arguments.
#  @param p_arg_count The number of arguments.
#  @param r_ret A pointer to Variant which will receive the return value.
#  @param r_error A pointer to a GDExtensionCallError struct that will receive error information.
#
comptime GDExtensionInterfaceObjectMethodBindCall = fn (p_method_bind: GDExtensionMethodBindPtr, p_instance: GDExtensionObjectPtr, p_args: C_PtrConst[GDExtensionConstVariantPtr], p_arg_count: GDExtensionInt, r_ret: GDExtensionUninitializedVariantPtr, r_error: C_Ptr[GDExtensionCallError])


#  @name object_method_bind_ptrcall
#  @since 4.1
#
#  Calls a method on an Object (using a "ptrcall").
#
#  @param p_method_bind A pointer to the MethodBind representing the method on the Object's class.
#  @param p_instance A pointer to the Object.
#  @param p_args A pointer to a C array representing the arguments.
#  @param r_ret A pointer to the Object that will receive the return value.
#
comptime GDExtensionInterfaceObjectMethodBindPtrcall = fn (p_method_bind: GDExtensionMethodBindPtr, p_instance: GDExtensionObjectPtr, p_args: C_PtrConst[GDExtensionConstTypePtr], r_ret: GDExtensionTypePtr)


#  @name object_destroy
#  @since 4.1
#
#  Destroys an Object.
#
#  @param p_o A pointer to the Object.
#
comptime GDExtensionInterfaceObjectDestroy = fn (p_o: GDExtensionObjectPtr)


#  @name global_get_singleton
#  @since 4.1
#
#  Gets a global singleton by name.
#
#  @param p_name A pointer to a StringName with the singleton name.
#
#  @return A pointer to the singleton Object.
#
comptime GDExtensionInterfaceGlobalGetSingleton = fn (p_name: GDExtensionConstStringNamePtr) -> GDExtensionObjectPtr


#  @name object_get_instance_binding
#  @since 4.1
#
#  Gets a pointer representing an Object's instance binding.
#
#  @param p_o A pointer to the Object.
#  @param p_token A token the library received by the GDExtension's entry point function.
#  @param p_callbacks A pointer to a GDExtensionInstanceBindingCallbacks struct.
#
#  @return A pointer to the instance binding.
#
comptime GDExtensionInterfaceObjectGetInstanceBinding = fn (p_o: GDExtensionObjectPtr, p_token: C_VoidPtr, p_callbacks: C_PtrConst[GDExtensionInstanceBindingCallbacks]) -> C_VoidPtr


#  @name object_set_instance_binding
#  @since 4.1
#
#  Sets an Object's instance binding.
#
#  @param p_o A pointer to the Object.
#  @param p_token A token the library received by the GDExtension's entry point function.
#  @param p_binding A pointer to the instance binding.
#  @param p_callbacks A pointer to a GDExtensionInstanceBindingCallbacks struct.
#
comptime GDExtensionInterfaceObjectSetInstanceBinding = fn (p_o: GDExtensionObjectPtr, p_token: C_VoidPtr, p_binding: C_VoidPtr, p_callbacks: C_PtrConst[GDExtensionInstanceBindingCallbacks])


#  @name object_free_instance_binding
#  @since 4.2
#
#  Free an Object's instance binding.
#
#  @param p_o A pointer to the Object.
#  @param p_token A token the library received by the GDExtension's entry point function.
#
comptime GDExtensionInterfaceObjectFreeInstanceBinding = fn (p_o: GDExtensionObjectPtr, p_token: C_VoidPtr)


#  @name object_set_instance
#  @since 4.1
#
#  Sets an extension class instance on a Object.
#
#  `p_classname` should be a registered extension class and should extend the `p_o` Object's class.
#
#  @param p_o A pointer to the Object.
#  @param p_classname A pointer to a StringName with the registered extension class's name.
#  @param p_instance A pointer to the extension class instance.
#
comptime GDExtensionInterfaceObjectSetInstance = fn (p_o: GDExtensionObjectPtr, p_classname: GDExtensionConstStringNamePtr, p_instance: GDExtensionClassInstancePtr)


#  @name object_get_class_name
#  @since 4.1
#
#  Gets the class name of an Object.
#
#  If the GDExtension wraps the Godot object in an abstraction specific to its class, this is the
#  function that should be used to determine which wrapper to use.
#
#  @param p_object A pointer to the Object.
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param r_class_name A pointer to a String to receive the class name.
#
#  @return true if successful in getting the class name; otherwise false.
#
comptime GDExtensionInterfaceObjectGetClassName = fn (p_object: GDExtensionConstObjectPtr, p_library: GDExtensionClassLibraryPtr, r_class_name: GDExtensionUninitializedStringNamePtr) -> GDExtensionBool


#  @name object_cast_to
#  @since 4.1
#
#  Casts an Object to a different type.
#
#  @param p_object A pointer to the Object.
#  @param p_class_tag A pointer uniquely identifying a built-in class in the ClassDB.
#
#  @return Returns a pointer to the Object, or NULL if it can't be cast to the requested type.
#
comptime GDExtensionInterfaceObjectCastTo = fn (p_object: GDExtensionConstObjectPtr, p_class_tag: C_VoidPtr) -> GDExtensionObjectPtr


#  @name object_get_instance_from_id
#  @since 4.1
#
#  Gets an Object by its instance ID.
#
#  @param p_instance_id The instance ID.
#
#  @return A pointer to the Object.
#
comptime GDExtensionInterfaceObjectGetInstanceFromId = fn (p_instance_id: GDObjectInstanceID) -> GDExtensionObjectPtr


#  @name object_get_instance_id
#  @since 4.1
#
#  Gets the instance ID from an Object.
#
#  @param p_object A pointer to the Object.
#
#  @return The instance ID.
#
comptime GDExtensionInterfaceObjectGetInstanceId = fn (p_object: GDExtensionConstObjectPtr) -> GDObjectInstanceID


#  @name object_has_script_method
#  @since 4.3
#
#  Checks if this object has a script with the given method.
#
#  @param p_object A pointer to the Object.
#  @param p_method A pointer to a StringName identifying the method.
#
#  @return true if the object has a script and that script has a method with the given name. Returns false if the object has no script.
#
comptime GDExtensionInterfaceObjectHasScriptMethod = fn (p_object: GDExtensionConstObjectPtr, p_method: GDExtensionConstStringNamePtr) -> GDExtensionBool


#  @name object_call_script_method
#  @since 4.3
#
#  Call the given script method on this object.
#
#  @param p_object A pointer to the Object.
#  @param p_method A pointer to a StringName identifying the method.
#  @param p_args A pointer to a C array of Variant.
#  @param p_argument_count The number of arguments.
#  @param r_return A pointer a Variant which will be assigned the return value.
#  @param r_error A pointer the structure which will hold error information.
#
comptime GDExtensionInterfaceObjectCallScriptMethod = fn (p_object: GDExtensionObjectPtr, p_method: GDExtensionConstStringNamePtr, p_args: C_PtrConst[GDExtensionConstVariantPtr], p_argument_count: GDExtensionInt, r_return: GDExtensionUninitializedVariantPtr, r_error: C_Ptr[GDExtensionCallError])

# INTERFACE: Reference


#  @name ref_get_object
#  @since 4.1
#
#  Gets the Object from a reference.
#
#  @param p_ref A pointer to the reference.
#
#  @return A pointer to the Object from the reference or NULL.
#
comptime GDExtensionInterfaceRefGetObject = fn (p_ref: GDExtensionConstRefPtr) -> GDExtensionObjectPtr


#  @name ref_set_object
#  @since 4.1
#
#  Sets the Object referred to by a reference.
#
#  @param p_ref A pointer to the reference.
#  @param p_object A pointer to the Object to refer to.
#
comptime GDExtensionInterfaceRefSetObject = fn (p_ref: GDExtensionRefPtr, p_object: GDExtensionObjectPtr)

# INTERFACE: Script Instance


#  @name script_instance_create
#  @since 4.1
#  @deprecated in Godot 4.2. Use `script_instance_create3` instead.
#
#  Creates a script instance that contains the given info and instance data.
#
#  @param p_info A pointer to a GDExtensionScriptInstanceInfo struct.
#  @param p_instance_data A pointer to a data representing the script instance in the GDExtension. This will be passed to all the function pointers on p_info.
#
#  @return A pointer to a ScriptInstanceExtension object.
#
@deprecated("Use `script_instance_create3` instead.")
comptime GDExtensionInterfaceScriptInstanceCreate = fn (p_info: C_PtrConst[GDExtensionScriptInstanceInfo], p_instance_data: GDExtensionScriptInstanceDataPtr) -> GDExtensionScriptInstancePtr


#  @name script_instance_create2
#  @since 4.2
#  @deprecated in Godot 4.3. Use `script_instance_create3` instead.
#
#  Creates a script instance that contains the given info and instance data.
#
#  @param p_info A pointer to a GDExtensionScriptInstanceInfo2 struct.
#  @param p_instance_data A pointer to a data representing the script instance in the GDExtension. This will be passed to all the function pointers on p_info.
#
#  @return A pointer to a ScriptInstanceExtension object.
#
@deprecated("Use `script_instance_create3` instead.")
comptime GDExtensionInterfaceScriptInstanceCreate2 = fn (p_info: C_PtrConst[GDExtensionScriptInstanceInfo2], p_instance_data: GDExtensionScriptInstanceDataPtr) -> GDExtensionScriptInstancePtr


#  @name script_instance_create3
#  @since 4.3
#
#  Creates a script instance that contains the given info and instance data.
#
#  @param p_info A pointer to a GDExtensionScriptInstanceInfo3 struct.
#  @param p_instance_data A pointer to a data representing the script instance in the GDExtension. This will be passed to all the function pointers on p_info.
#
#  @return A pointer to a ScriptInstanceExtension object.
#
comptime GDExtensionInterfaceScriptInstanceCreate3 = fn (p_info: C_PtrConst[GDExtensionScriptInstanceInfo3], p_instance_data: GDExtensionScriptInstanceDataPtr) -> GDExtensionScriptInstancePtr


#  @name placeholder_script_instance_create
#  @since 4.2
#
#  Creates a placeholder script instance for a given script and instance.
#
#  This interface is optional as a custom placeholder could also be created with script_instance_create().
#
#  @param p_language A pointer to a ScriptLanguage.
#  @param p_script A pointer to a Script.
#  @param p_owner A pointer to an Object.
#
#  @return A pointer to a PlaceHolderScriptInstance object.
#
comptime GDExtensionInterfacePlaceHolderScriptInstanceCreate = fn (p_language: GDExtensionObjectPtr, p_script: GDExtensionObjectPtr, p_owner: GDExtensionObjectPtr) -> GDExtensionScriptInstancePtr


#  @name placeholder_script_instance_update
#  @since 4.2
#
#  Updates a placeholder script instance with the given properties and values.
#
#  The passed in placeholder must be an instance of PlaceHolderScriptInstance
#  such as the one returned by placeholder_script_instance_create().
#
#  @param p_placeholder A pointer to a PlaceHolderScriptInstance.
#  @param p_properties A pointer to an Array of Dictionary representing PropertyInfo.
#  @param p_values A pointer to a Dictionary mapping StringName to Variant values.
#
comptime GDExtensionInterfacePlaceHolderScriptInstanceUpdate = fn (p_placeholder: GDExtensionScriptInstancePtr, p_properties: GDExtensionConstTypePtr, p_values: GDExtensionConstTypePtr)


#  @name object_get_script_instance
#  @since 4.2
#
#  Get the script instance data attached to this object.
#
#  @param p_object A pointer to the Object.
#  @param p_language A pointer to the language expected for this script instance.
#
#  @return A GDExtensionScriptInstanceDataPtr that was attached to this object as part of script_instance_create.
#
comptime GDExtensionInterfaceObjectGetScriptInstance = fn (p_object: GDExtensionConstObjectPtr, p_language: GDExtensionObjectPtr) -> GDExtensionScriptInstanceDataPtr


#  @name object_set_script_instance
#  @since 4.5
#
#  Set the script instance data attached to this object.
#
#  @param p_object A pointer to the Object.
#  @param p_script_instance A pointer to the script instance data to attach to this object.
#
comptime GDExtensionInterfaceObjectSetScriptInstance = fn (p_object: GDExtensionObjectPtr, p_script_instance: GDExtensionScriptInstanceDataPtr)

# INTERFACE: Callable


#  @name callable_custom_create
#  @since 4.2
#  @deprecated in Godot 4.3. Use `callable_custom_create2` instead.
#
#  Creates a custom Callable object from a function pointer.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param r_callable A pointer that will receive the new Callable.
#  @param p_callable_custom_info The info required to construct a Callable.
#
@deprecated("Use `callable_custom_create2` instead.")
comptime GDExtensionInterfaceCallableCustomCreate = fn (r_callable: GDExtensionUninitializedTypePtr, p_callable_custom_info: C_Ptr[GDExtensionCallableCustomInfo])


#  @name callable_custom_create2
#  @since 4.3
#
#  Creates a custom Callable object from a function pointer.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param r_callable A pointer that will receive the new Callable.
#  @param p_callable_custom_info The info required to construct a Callable.
#
comptime GDExtensionInterfaceCallableCustomCreate2 = fn (r_callable: GDExtensionUninitializedTypePtr, p_callable_custom_info: C_Ptr[GDExtensionCallableCustomInfo2])


#  @name callable_custom_get_userdata
#  @since 4.2
#
#  Retrieves the userdata pointer from a custom Callable.
#
#  If the Callable is not a custom Callable or the token does not match the one provided to callable_custom_create() via GDExtensionCallableCustomInfo then NULL will be returned.
#
#  @param p_callable A pointer to a Callable.
#  @param p_token A pointer to an address that uniquely identifies the GDExtension.
#
#  @return The userdata pointer given when creating this custom Callable.
#
comptime GDExtensionInterfaceCallableCustomGetUserData = fn (p_callable: GDExtensionConstTypePtr, p_token: C_VoidPtr) -> C_VoidPtr

# INTERFACE: ClassDB


#  @name classdb_construct_object
#  @since 4.1
#  @deprecated in Godot 4.4. Use `classdb_construct_object2` instead.
#
#  Constructs an Object of the requested class.
#
#  The passed class must be a built-in godot class, or an already-registered extension class. In both cases, object_set_instance() should be called to fully initialize the object.
#
#  @param p_classname A pointer to a StringName with the class name.
#
#  @return A pointer to the newly created Object.
#
comptime GDExtensionInterfaceClassdbConstructObject = fn (p_classname: GDExtensionConstStringNamePtr) -> GDExtensionObjectPtr


#  @name classdb_construct_object2
#  @since 4.4
#
#  Constructs an Object of the requested class.
#
#  The passed class must be a built-in godot class, or an already-registered extension class. In both cases, object_set_instance() should be called to fully initialize the object.
#
#  "NOTIFICATION_POSTINITIALIZE" must be sent after construction.
#
#  @param p_classname A pointer to a StringName with the class name.
#
#  @return A pointer to the newly created Object.
#
comptime GDExtensionInterfaceClassdbConstructObject2 = fn (p_classname: GDExtensionConstStringNamePtr) -> GDExtensionObjectPtr


#  @name classdb_get_method_bind
#  @since 4.1
#
#  Gets a pointer to the MethodBind in ClassDB for the given class, method and hash.
#
#  @param p_classname A pointer to a StringName with the class name.
#  @param p_methodname A pointer to a StringName with the method name.
#  @param p_hash A hash representing the function signature.
#
#  @return A pointer to the MethodBind from ClassDB.
#
comptime GDExtensionInterfaceClassdbGetMethodBind = fn (p_classname: GDExtensionConstStringNamePtr, p_methodname: GDExtensionConstStringNamePtr, p_hash: GDExtensionInt) -> GDExtensionMethodBindPtr


#  @name classdb_get_class_tag
#  @since 4.1
#
#  Gets a pointer uniquely identifying the given built-in class in the ClassDB.
#
#  @param p_classname A pointer to a StringName with the class name.
#
#  @return A pointer uniquely identifying the built-in class in the ClassDB.
#
comptime GDExtensionInterfaceClassdbGetClassTag = fn (p_classname: GDExtensionConstStringNamePtr) -> C_VoidPtr

# INTERFACE: ClassDB Extension


#  @name classdb_register_extension_class
#  @since 4.1
#  @deprecated in Godot 4.2. Use `classdb_register_extension_class4` instead.
#
#  Registers an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_parent_class_name A pointer to a StringName with the parent class name.
#  @param p_extension_funcs A pointer to a GDExtensionClassCreationInfo struct.
#
@deprecated("Use `classdb_register_extension_class4` instead.")
comptime GDExtensionInterfaceClassdbRegisterExtensionClass = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_parent_class_name: GDExtensionConstStringNamePtr, p_extension_funcs: C_PtrConst[GDExtensionClassCreationInfo])


#  @name classdb_register_extension_class2
#  @since 4.2
#  @deprecated in Godot 4.3. Use `classdb_register_extension_class4` instead.
#
#  Registers an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_parent_class_name A pointer to a StringName with the parent class name.
#  @param p_extension_funcs A pointer to a GDExtensionClassCreationInfo2 struct.
#
@deprecated("Use `classdb_register_extension_class4` instead.")
comptime GDExtensionInterfaceClassdbRegisterExtensionClass2 = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_parent_class_name: GDExtensionConstStringNamePtr, p_extension_funcs: C_PtrConst[GDExtensionClassCreationInfo2])


#  @name classdb_register_extension_class3
#  @since 4.3
#  @deprecated in Godot 4.4. Use `classdb_register_extension_class4` instead.
#
#  Registers an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_parent_class_name A pointer to a StringName with the parent class name.
#  @param p_extension_funcs A pointer to a GDExtensionClassCreationInfo3 struct.
#
@deprecated("Use `classdb_register_extension_class4` instead.")
comptime GDExtensionInterfaceClassdbRegisterExtensionClass3 = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_parent_class_name: GDExtensionConstStringNamePtr, p_extension_funcs: C_PtrConst[GDExtensionClassCreationInfo3])


#  @name classdb_register_extension_class4
#  @since 4.4
#  @deprecated in Godot 4.5. Use `classdb_register_extension_class5` instead.
#
#  Registers an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_parent_class_name A pointer to a StringName with the parent class name.
#  @param p_extension_funcs A pointer to a GDExtensionClassCreationInfo4 struct.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClass4 = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_parent_class_name: GDExtensionConstStringNamePtr, p_extension_funcs: C_PtrConst[GDExtensionClassCreationInfo4])


#  @name classdb_register_extension_class5
#  @since 4.5
#
#  Registers an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_parent_class_name A pointer to a StringName with the parent class name.
#  @param p_extension_funcs A pointer to a GDExtensionClassCreationInfo5 struct.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClass5 = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_parent_class_name: GDExtensionConstStringNamePtr, p_extension_funcs: C_PtrConst[GDExtensionClassCreationInfo5])


#  @name classdb_register_extension_class_method
#  @since 4.1
#
#  Registers a method on an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_method_info A pointer to a GDExtensionClassMethodInfo struct.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassMethod = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_method_info: C_PtrConst[GDExtensionClassMethodInfo])


#  @name classdb_register_extension_class_virtual_method
#  @since 4.3
#
#  Registers a virtual method on an extension class in ClassDB, that can be implemented by scripts or other extensions.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_method_info A pointer to a GDExtensionClassMethodInfo struct.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassVirtualMethod = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_method_info: C_PtrConst[GDExtensionClassVirtualMethodInfo])


#  @name classdb_register_extension_class_integer_constant
#  @since 4.1
#
#  Registers an integer constant on an extension class in the ClassDB.
#
#  Note about registering bitfield values (if p_is_bitfield is true): even though p_constant_value is signed, language bindings are
#  advised to treat bitfields as uint64_t, since this is generally clearer and can prevent mistakes like using -1 for setting all bits.
#  Language APIs should thus provide an abstraction that registers bitfields (uint64_t) separately from regular constants (int64_t).
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_enum_name A pointer to a StringName with the enum name.
#  @param p_constant_name A pointer to a StringName with the constant name.
#  @param p_constant_value The constant value.
#  @param p_is_bitfield Whether or not this constant is part of a bitfield.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassIntegerConstant = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_enum_name: GDExtensionConstStringNamePtr, p_constant_name: GDExtensionConstStringNamePtr, p_constant_value: GDExtensionInt, p_is_bitfield: GDExtensionBool)


#  @name classdb_register_extension_class_property
#  @since 4.1
#
#  Registers a property on an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_info A pointer to a GDExtensionPropertyInfo struct.
#  @param p_setter A pointer to a StringName with the name of the setter method.
#  @param p_getter A pointer to a StringName with the name of the getter method.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassProperty = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_info: C_PtrConst[GDExtensionPropertyInfo], p_setter: GDExtensionConstStringNamePtr, p_getter: GDExtensionConstStringNamePtr)


#  @name classdb_register_extension_class_property_indexed
#  @since 4.2
#
#  Registers an indexed property on an extension class in the ClassDB.
#
#  Provided struct can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_info A pointer to a GDExtensionPropertyInfo struct.
#  @param p_setter A pointer to a StringName with the name of the setter method.
#  @param p_getter A pointer to a StringName with the name of the getter method.
#  @param p_index The index to pass as the first argument to the getter and setter methods.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassPropertyIndexed = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_info: C_PtrConst[GDExtensionPropertyInfo], p_setter: GDExtensionConstStringNamePtr, p_getter: GDExtensionConstStringNamePtr, p_index: GDExtensionInt)


#  @name classdb_register_extension_class_property_group
#  @since 4.1
#
#  Registers a property group on an extension class in the ClassDB.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_group_name A pointer to a String with the group name.
#  @param p_prefix A pointer to a String with the prefix used by properties in this group.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassPropertyGroup = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_group_name: GDExtensionConstStringPtr, p_prefix: GDExtensionConstStringPtr)


#  @name classdb_register_extension_class_property_subgroup
#  @since 4.1
#
#  Registers a property subgroup on an extension class in the ClassDB.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_subgroup_name A pointer to a String with the subgroup name.
#  @param p_prefix A pointer to a String with the prefix used by properties in this subgroup.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassPropertySubgroup = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_subgroup_name: GDExtensionConstStringPtr, p_prefix: GDExtensionConstStringPtr)


#  @name classdb_register_extension_class_signal
#  @since 4.1
#
#  Registers a signal on an extension class in the ClassDB.
#
#  Provided structs can be safely freed once the function returns.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#  @param p_signal_name A pointer to a StringName with the signal name.
#  @param p_argument_info A pointer to a GDExtensionPropertyInfo struct.
#  @param p_argument_count The number of arguments the signal receives.
#
comptime GDExtensionInterfaceClassdbRegisterExtensionClassSignal = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr, p_signal_name: GDExtensionConstStringNamePtr, p_argument_info: C_PtrConst[GDExtensionPropertyInfo], p_argument_count: GDExtensionInt)


#  @name classdb_unregister_extension_class
#  @since 4.1
#
#  Unregisters an extension class in the ClassDB.
#
#  Unregistering a parent class before a class that inherits it will result in failure. Inheritors must be unregistered first.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_class_name A pointer to a StringName with the class name.
#
comptime GDExtensionInterfaceClassdbUnregisterExtensionClass = fn (p_library: GDExtensionClassLibraryPtr, p_class_name: GDExtensionConstStringNamePtr)


#  @name get_library_path
#  @since 4.1
#
#  Gets the path to the current GDExtension library.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param r_path A pointer to a String which will receive the path.
#
comptime GDExtensionInterfaceGetLibraryPath = fn (p_library: GDExtensionClassLibraryPtr, r_path: GDExtensionUninitializedStringPtr)


#  @name editor_add_plugin
#  @since 4.1
#
#  Adds an editor plugin.
#
#  It's safe to call during initialization.
#
#  @param p_class_name A pointer to a StringName with the name of a class (descending from EditorPlugin) which is already registered with ClassDB.
#
comptime GDExtensionInterfaceEditorAddPlugin = fn (p_class_name: GDExtensionConstStringNamePtr)


#  @name editor_remove_plugin
#  @since 4.1
#
#  Removes an editor plugin.
#
#  @param p_class_name A pointer to a StringName with the name of a class that was previously added as an editor plugin.
#
comptime GDExtensionInterfaceEditorRemovePlugin = fn (p_class_name: GDExtensionConstStringNamePtr)


#  @name editor_help_load_xml_from_utf8_chars
#  @since 4.3
#
#  Loads new XML-formatted documentation data in the editor.
#
#  The provided pointer can be immediately freed once the function returns.
#
#  @param p_data A pointer to a UTF-8 encoded C string (null terminated).
#
comptime GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8Chars = fn (p_data: C_PtrConst[c_char])


#  @name editor_help_load_xml_from_utf8_chars_and_len
#  @since 4.3
#
#  Loads new XML-formatted documentation data in the editor.
#
#  The provided pointer can be immediately freed once the function returns.
#
#  @param p_data A pointer to a UTF-8 encoded C string.
#  @param p_size The number of bytes (not code units).
#
comptime GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8CharsAndLen = fn (p_data: C_PtrConst[c_char], p_size: GDExtensionInt)


#  @name editor_register_get_classes_used_callback
#  @since 4.5
#
#  Registers a callback that Godot can call to get the list of all classes (from ClassDB) that may be used by the calling GDExtension.
#
#  This is used by the editor to generate a build profile (in "Tools" > "Engine Compilation Configuration Editor..." > "Detect from project"),
#  in order to recompile Godot with only the classes used.
#  In the provided callback, the GDExtension should provide the list of classes that _may_ be used statically, thus the time of invocation shouldn't matter.
#  If a GDExtension doesn't register a callback, Godot will assume that it could be using any classes.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_callback The callback to retrieve the list of classes used.
#
comptime GDExtensionInterfaceEditorRegisterGetClassesUsedCallback = fn (p_library: GDExtensionClassLibraryPtr, p_callback: GDExtensionEditorGetClassesUsedCallback)


#  @name register_main_loop_callbacks
#  @since 4.5
#
#  Registers callbacks to be called at different phases of the main loop.
#
#  @param p_library A pointer the library received by the GDExtension's entry point function.
#  @param p_callbacks A pointer to the structure that contains the callbacks.
#
comptime GDExtensionInterfaceRegisterMainLoopCallbacks = fn (p_library: GDExtensionClassLibraryPtr, p_callbacks: C_PtrConst[GDExtensionMainLoopCallbacks])
