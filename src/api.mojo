from sys import external_call, size_of
from sys.ffi import _get_global_or_null
from memory import bitcast
from misc import *

from gdextension_interface import *
from defs import *


fn get_api() -> UnsafePointer[API, MutExternalOrigin]:
    var ptr = _get_global_or_null("API").bitcast[API]()
    if ptr:
        return ptr
    var api = alloc[API](1)
    external_call["KGEN_CompilerRT_InsertGlobal", NoneType](StringSlice("API"), api.bitcast[NoneType]())
    return api


struct API:
    var class_library: GDExtensionClassLibraryPtr

    # api
    var classdb_register_extension_class2: GDExtensionInterfaceClassdbRegisterExtensionClass2
    var classdb_construct_object: GDExtensionInterfaceClassdbConstructObject
    var object_set_instance: GDExtensionInterfaceObjectSetInstance
    var object_set_instance_binding: GDExtensionInterfaceObjectSetInstanceBinding
    var mem_alloc: GDExtensionInterfaceMemAlloc
    var mem_free: GDExtensionInterfaceMemFree
    var variant_get_type: GDExtensionInterfaceVariantGetType
    var classdb_register_extension_class_method: GDExtensionInterfaceClassdbRegisterExtensionClassMethod
    var classdb_register_extension_class_property: GDExtensionInterfaceClassdbRegisterExtensionClassProperty
    var classdb_get_method_bind: GDExtensionInterfaceClassdbGetMethodBind
    var object_method_bind_ptrcall: GDExtensionInterfaceObjectMethodBindPtrcall

    # constuctors
    var get_variant_from_type_constructor: GDExtensionInterfaceGetVariantFromTypeConstructor
    var get_variant_to_type_constructor: GDExtensionInterfaceGetVariantToTypeConstructor
    var variant_get_ptr_constructor: GDExtensionInterfaceVariantGetPtrConstructor
    var string_name_new_with_latin1_chars: GDExtensionInterfaceStringNameNewWithLatin1Chars
    var variant_from_float_constructor: GDExtensionVariantFromTypeConstructorFunc
    var float_from_variant_constructor: GDExtensionTypeFromVariantConstructorFunc
    var string_new_with_utf8_chars: GDExtensionInterfaceStringNewWithUtf8Chars
    var string_new_with_latin1_chars: GDExtensionInterfaceStringNewWithLatin1Chars
    var vector2_constructor_x_y: GDExtensionPtrConstructor

    # destructors
    var variant_get_ptr_destructor: GDExtensionInterfaceVariantGetPtrDestructor
    var string_name_destructor: GDExtensionPtrDestructor
    var string_destructor: GDExtensionPtrDestructor

    # operators
    var variant_get_ptr_operator_evaluator: GDExtensionInterfaceVariantGetPtrOperatorEvaluator
    var string_name_equal: GDExtensionPtrOperatorEvaluator

    # methods
    var node2d_set_position: GDExtensionMethodBindPtr

    # load_api() function
    fn __init__(out self, p_get_proc_address: GDExtensionInterfaceGetProcAddress, p_library: GDExtensionClassLibraryPtr):
        self = undefined[Self]()

        # makes things less verbose
        @parameter
        fn set_proc[T: __TypeOfAllTypes](mut location: T, function_name: StringLiteral):
            var proc = p_get_proc_address(c_str(function_name))
            location = __mlir_op.`pop.pointer.bitcast`[_type=T](proc)

        self.class_library = p_library

        # API.
        set_proc(self.classdb_register_extension_class2, "classdb_register_extension_class2")
        set_proc(self.classdb_construct_object, "classdb_construct_object")
        set_proc(self.object_set_instance, "object_set_instance")
        set_proc(self.object_set_instance_binding, "object_set_instance_binding")
        set_proc(self.mem_alloc, "mem_alloc")
        set_proc(self.mem_free, "mem_free")
        set_proc(self.variant_get_type, "variant_get_type")
        set_proc(self.classdb_register_extension_class_method, "classdb_register_extension_class_method")
        set_proc(self.classdb_register_extension_class_property, "classdb_register_extension_class_property")
        set_proc(self.classdb_get_method_bind, "classdb_get_method_bind")
        set_proc(self.object_method_bind_ptrcall, "object_method_bind_ptrcall")

        # Constructors.
        set_proc(self.get_variant_from_type_constructor, "get_variant_from_type_constructor")
        set_proc(self.get_variant_to_type_constructor, "get_variant_to_type_constructor")
        set_proc(self.variant_get_ptr_constructor, "variant_get_ptr_constructor")
        set_proc(self.string_name_new_with_latin1_chars, "string_name_new_with_latin1_chars")
        self.variant_from_float_constructor = self.get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_FLOAT)
        self.float_from_variant_constructor = self.get_variant_to_type_constructor(GDEXTENSION_VARIANT_TYPE_FLOAT)
        set_proc(self.string_new_with_utf8_chars, "string_new_with_utf8_chars")
        set_proc(self.string_new_with_latin1_chars, "string_new_with_latin1_chars")
        self.vector2_constructor_x_y = self.variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_VECTOR2, 3)  # See extension_api.json for indices.

        # Destructors.
        set_proc(self.variant_get_ptr_destructor, "variant_get_ptr_destructor")
        self.string_name_destructor = self.variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME)
        self.string_destructor = self.variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING)

        # operators
        set_proc(self.variant_get_ptr_operator_evaluator, "variant_get_ptr_operator_evaluator")
        self.string_name_equal = self.variant_get_ptr_operator_evaluator(GDEXTENSION_VARIANT_OP_EQUAL, GDEXTENSION_VARIANT_TYPE_STRING_NAME, GDEXTENSION_VARIANT_TYPE_STRING_NAME)


fn ptrcall_0_args_ret_float(method_userdata: C_VoidPtr, p_instance: GDExtensionClassInstancePtr, p_args: C_PtrConst[GDExtensionConstTypePtr], r_ret: GDExtensionTypePtr):
    # Call the function.
    var function = retype[fn (C_VoidPtr) -> Float64](method_userdata)
    r_ret.bitcast[Float64]()[] = function(p_instance)


fn ptrcall_1_float_arg_no_ret(method_userdata: C_VoidPtr, p_instance: GDExtensionClassInstancePtr, p_args: C_PtrConst[GDExtensionConstTypePtr], r_ret: GDExtensionTypePtr):
    # Call the function.
    var function = retype[fn (C_VoidPtr, Float64)](method_userdata)
    function(p_instance, p_args[0].bitcast[Float64]()[])


fn call_0_args_ret_float(method_userdata: C_VoidPtr, p_instance: GDExtensionClassInstancePtr, p_args: C_PtrConst[GDExtensionConstVariantPtr], p_argument_count: GDExtensionInt, r_return: GDExtensionVariantPtr, r_error: C_Ptr[GDExtensionCallError]):
    # Check argument count.
    if p_argument_count != 0:
        r_error[].error = GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS
        r_error[].expected = 0
        return

    # Call the function.
    var function = retype[fn (C_VoidPtr) -> Float64](method_userdata)
    var result = function(p_instance)
    # Set resulting Variant.
    get_api()[].variant_from_float_constructor(r_return, C_Ptr(to=result).bitcast[NoneType]())


fn call_1_float_arg_no_ret(method_userdata: C_VoidPtr, p_instance: GDExtensionClassInstancePtr, p_args: C_PtrConst[GDExtensionConstVariantPtr], p_argument_count: GDExtensionInt, r_return: GDExtensionVariantPtr, r_error: C_Ptr[GDExtensionCallError]):
    # Check argument count.
    if p_argument_count < 1:
        r_error[].error = GDEXTENSION_CALL_ERROR_TOO_FEW_ARGUMENTS
        r_error[].expected = 1
        return
    elif p_argument_count > 1:
        r_error[].error = GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS
        r_error[].expected = 1
        return

    # Check the argument type.
    var type = get_api()[].variant_get_type(p_args[0])
    if type != GDEXTENSION_VARIANT_TYPE_FLOAT:
        r_error[].error = GDEXTENSION_CALL_ERROR_INVALID_ARGUMENT
        r_error[].expected = GDEXTENSION_VARIANT_TYPE_FLOAT
        r_error[].argument = 0
        return

    # Extract the argument.
    var arg1 = undefined[Float64]()
    get_api()[].float_from_variant_constructor(C_Ptr(to=arg1).bitcast[NoneType](), p_args[0].unsafe_mut_cast[True]())
    # not sure why theres a mut cast above, but it's also in the godot c example

    # Call the function.
    var function = retype[fn (C_VoidPtr, Float64)](method_userdata)
    function(p_instance, arg1)


# Create a PropertyInfo struct.
fn make_property(type: GDExtensionVariantType, name: C_PtrConst[c_char]) -> GDExtensionPropertyInfo:
    return make_property_full(type, name, PROPERTY_HINT_NONE, c_str(""), c_str(""), PROPERTY_USAGE_DEFAULT)


fn make_property_full(type: GDExtensionVariantType, name: C_PtrConst[c_char], hint: UInt32, hint_string: C_PtrConst[c_char], class_name: C_PtrConst[c_char], usage_flags: UInt32) -> GDExtensionPropertyInfo:
    ref api = get_api()[]
    var prop_name = api.mem_alloc(UInt(size_of[StringName]()))
    api.string_name_new_with_latin1_chars(prop_name, name, GDExtensionBool(False))
    var prop_hint_string = api.mem_alloc(UInt(size_of[GDString]()))
    api.string_new_with_latin1_chars(prop_hint_string, hint_string)
    var prop_class_name = api.mem_alloc(UInt(size_of[StringName]()))
    api.string_name_new_with_latin1_chars(prop_class_name, class_name, GDExtensionBool(False))

    return GDExtensionPropertyInfo(
        name=prop_name,
        type=type,
        hint=hint,
        hint_string=prop_hint_string,
        class_name=prop_class_name,
        usage=usage_flags,
    )


fn destruct_property(info: C_Ptr[GDExtensionPropertyInfo]):
    ref api = get_api()[]
    api.string_name_destructor(info[].name)
    api.string_destructor(info[].hint_string)
    api.string_name_destructor(info[].class_name)
    api.mem_free(info[].name)
    api.mem_free(info[].hint_string)
    api.mem_free(info[].class_name)


# Version for 0 arguments, with return.
fn bind_method_0_r(class_name: C_PtrConst[c_char], method_name: C_PtrConst[c_char], function: C_VoidPtr, return_type: GDExtensionVariantType):
    ref api = get_api()[]
    var method_name_string = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=method_name_string).bitcast[NoneType](), method_name, GDExtensionBool(False))

    var return_info = make_property(return_type, c_str(""))

    var method_info = GDExtensionClassMethodInfo(
        name=C_Ptr(to=method_name_string).bitcast[NoneType](),
        method_userdata=function,
        call_func=call_0_args_ret_float,
        ptrcall_func=ptrcall_0_args_ret_float,
        method_flags=GDEXTENSION_METHOD_FLAGS_DEFAULT,
        has_return_value=GDExtensionBool(True),
        return_value_info=C_Ptr(to=return_info),
        return_value_metadata=GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
        argument_count=0,
        arguments_info=C_Ptr[GDExtensionPropertyInfo](),
        arguments_metadata=C_Ptr[GDExtensionClassMethodArgumentMetadata](),
        default_argument_count=0,
        default_arguments=C_Ptr[GDExtensionVariantPtr](),
    )

    var class_name_string = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_name_string).bitcast[NoneType](), class_name, GDExtensionBool(False))

    api.classdb_register_extension_class_method(
        api.class_library,
        C_Ptr(to=class_name_string).bitcast[NoneType](),
        C_Ptr(to=method_info),
    )

    # Destruct things.
    api.string_name_destructor(C_Ptr(to=method_name_string).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=class_name_string).bitcast[NoneType]())
    destruct_property(C_Ptr(to=return_info))


# Version for 1 argument, no return.
fn bind_method_1(class_name: C_PtrConst[c_char], method_name: C_PtrConst[c_char], function: C_VoidPtr, arg1_name: C_PtrConst[c_char], arg1_type: GDExtensionVariantType):
    ref api = get_api()[]

    var method_name_string = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=method_name_string).bitcast[NoneType](), method_name, GDExtensionBool(False))

    var args_info = InlineArray[_, 1](make_property(arg1_type, arg1_name))
    var args_metadata = InlineArray[_, 1](GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE)

    var method_info = GDExtensionClassMethodInfo(
        name=C_Ptr(to=method_name_string).bitcast[NoneType](),
        method_userdata=function,
        call_func=call_1_float_arg_no_ret,
        ptrcall_func=ptrcall_1_float_arg_no_ret,
        method_flags=GDEXTENSION_METHOD_FLAGS_DEFAULT,
        has_return_value=GDExtensionBool(False),
        return_value_info=C_Ptr[GDExtensionPropertyInfo](),
        return_value_metadata=GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
        argument_count=1,
        arguments_info=args_info.unsafe_ptr(),
        arguments_metadata=args_metadata.unsafe_ptr(),
        default_argument_count=0,
        default_arguments=C_Ptr[GDExtensionVariantPtr](),
    )

    var class_name_string = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_name_string).bitcast[NoneType](), class_name, GDExtensionBool(False))

    api.classdb_register_extension_class_method(
        api.class_library,
        C_Ptr(to=class_name_string).bitcast[NoneType](),
        C_Ptr(to=method_info),
    )

    # Destruct things.
    api.string_name_destructor(C_Ptr(to=method_name_string).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=class_name_string).bitcast[NoneType]())
    destruct_property(args_info.unsafe_ptr())


fn bind_property(class_name: C_PtrConst[c_char], name: C_PtrConst[c_char], type: GDExtensionVariantType, getter: C_PtrConst[c_char], setter: C_PtrConst[c_char]):
    ref api = get_api()[]
    var class_string_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_string_name).bitcast[NoneType](), class_name, GDExtensionBool(False))
    var info = make_property(type, name)
    var getter_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=getter_name).bitcast[NoneType](), getter, GDExtensionBool(False))
    var setter_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=setter_name).bitcast[NoneType](), setter, GDExtensionBool(False))

    api.classdb_register_extension_class_property(
        api.class_library,
        C_Ptr(to=class_string_name).bitcast[NoneType](),
        C_Ptr(to=info),
        C_Ptr(to=setter_name).bitcast[NoneType](),
        C_Ptr(to=getter_name).bitcast[NoneType](),
    )

    # Destruct things.
    api.string_name_destructor(C_Ptr(to=class_string_name).bitcast[NoneType]())
    destruct_property(C_Ptr(to=info))
    api.string_name_destructor(C_Ptr(to=getter_name).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=setter_name).bitcast[NoneType]())


fn is_string_name_equal(p_a: GDExtensionConstStringNamePtr, p_b: C_StrConst) -> Bool:
    ref api = get_api()[]
    # Create a StringName for the C string.
    var string_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=string_name).bitcast[NoneType](), p_b, GDExtensionBool(False))

    # Compare both StringNames.
    var is_equal = False
    api.string_name_equal(p_a, C_Ptr(to=string_name).bitcast[NoneType](), C_Ptr(to=is_equal).bitcast[NoneType]())

    # Destroy the created StringName.
    api.string_name_destructor(C_Ptr(to=string_name).bitcast[NoneType]())

    # Return the result.
    return is_equal
