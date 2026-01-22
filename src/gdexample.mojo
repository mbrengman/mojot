from sys import size_of
from math import sin, cos
from misc import *

from gdextension_interface import *
from api import *
from defs import *


# Struct to hold the node data.
struct GDExample:
    # Public properties.
    var amplitude: Float64
    var speed: Float64
    var time_passed: Float64
    # Metadata.
    var object: GDExtensionObjectPtr  # Stores the underlying Godot object.


# Constructor for the node.
fn gdexample_class_constructor(self: C_Ptr[GDExample]):
    self[].time_passed = 0
    self[].amplitude = 10
    self[].speed = 1


# Destructor for the node.
fn gdexample_class_destructor(self: C_Ptr[GDExample]):
    pass


# Properties.
fn gdexample_class_set_amplitude(self: C_Ptr[GDExample], amplitude: Float64):
    self[].amplitude = amplitude


fn gdexample_class_get_amplitude(self: C_PtrConst[GDExample]) -> Float64:
    return self[].amplitude


fn gdexample_class_set_speed(self: C_Ptr[GDExample], speed: Float64):
    self[].speed = speed


fn gdexample_class_get_speed(self: C_PtrConst[GDExample]) -> Float64:
    return self[].speed


fn gdexample_class_process(self: C_Ptr[GDExample], delta: Float64):
    ref api = get_api()[]

    self[].time_passed += self[].speed * delta

    # Set up the arguments for the Vector2 constructor.
    var x = self[].amplitude + (self[].amplitude * sin(self[].time_passed * 2.0))
    var y = self[].amplitude + (self[].amplitude * cos(self[].time_passed * 1.5))
    var args = InlineArray[GDExtensionConstTypePtr, 2](C_Ptr(to=x).bitcast[NoneType](), C_Ptr(to=y).bitcast[NoneType]())

    # Call the Vector2 constructor.
    var new_position = undefined[Vector2]()
    api.vector2_constructor_x_y(C_Ptr(to=new_position).bitcast[NoneType](), args.unsafe_ptr())

    # Set up the arguments for the set_position method.
    args2 = InlineArray[GDExtensionConstTypePtr, 1](C_Ptr(to=new_position).bitcast[NoneType]())
    # Call the set_position method.
    api.object_method_bind_ptrcall(api.node2d_set_position, self[].object, args2.unsafe_ptr(), C_VoidPtr())


# Bindings.
fn gdexample_class_bind_methods():
    bind_method_0_r(
        c_str("GDExample"),
        c_str("get_amplitude"),
        retype[C_VoidPtr](gdexample_class_get_amplitude),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
    )

    bind_method_1(
        c_str("GDExample"),
        c_str("set_amplitude"),
        retype[C_VoidPtr](gdexample_class_set_amplitude),
        c_str("amplitude"),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
    )

    bind_property(
        c_str("GDExample"),
        c_str("amplitude"),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
        c_str("get_amplitude"),
        c_str("set_amplitude"),
    )

    bind_method_0_r(
        c_str("GDExample"),
        c_str("get_speed"),
        retype[C_VoidPtr](gdexample_class_get_speed),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
    )

    bind_method_1(
        c_str("GDExample"),
        c_str("set_speed"),
        retype[C_VoidPtr](gdexample_class_set_speed),
        c_str("speed"),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
    )

    bind_property(
        c_str("GDExample"),
        c_str("speed"),
        GDEXTENSION_VARIANT_TYPE_FLOAT,
        c_str("get_speed"),
        c_str("set_speed"),
    )


comptime gdexample_class_binding_callbacks = GDExtensionInstanceBindingCallbacks(
    create_callback=null_fn[GDExtensionInstanceBindingCreateCallback](),
    free_callback=null_fn[GDExtensionInstanceBindingFreeCallback](),
    reference_callback=null_fn[GDExtensionInstanceBindingReferenceCallback](),
)


fn gdexample_class_create_instance(p_class_userdata: C_VoidPtr) -> GDExtensionObjectPtr:
    ref api = get_api()[]

    # Create native Godot object;
    var class_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_name).bitcast[NoneType](), c_str("Sprite2D"), GDExtensionBool(False))
    var object = api.classdb_construct_object(C_Ptr(to=class_name).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=class_name).bitcast[NoneType]())

    # Create extension object.
    var self = api.mem_alloc(UInt(size_of[GDExample]())).bitcast[GDExample]()
    gdexample_class_constructor(self)
    self[].object = object

    # Set the extension instance in the native Godot object.
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_name).bitcast[NoneType](), c_str("GDExample"), GDExtensionBool(False))
    api.object_set_instance(object, C_Ptr(to=class_name).bitcast[NoneType](), self.bitcast[NoneType]())

    var gdexample_class_binding_callbacks = GDExtensionInstanceBindingCallbacks(
        create_callback=null_fn[GDExtensionInstanceBindingCreateCallback](),
        free_callback=null_fn[GDExtensionInstanceBindingFreeCallback](),
        reference_callback=null_fn[GDExtensionInstanceBindingReferenceCallback](),
    )
    api.object_set_instance_binding(object, api.class_library, self.bitcast[NoneType](), C_Ptr(to=gdexample_class_binding_callbacks))

    api.string_name_destructor(C_Ptr(to=class_name).bitcast[NoneType]())
    return object


fn gdexample_class_free_instance(p_class_userdata: C_VoidPtr, p_instance: GDExtensionClassInstancePtr):
    if not p_instance:
        return

    gdexample_class_destructor(p_instance.bitcast[GDExample]())
    get_api()[].mem_free(p_instance)


fn gdexample_class_get_virtual_with_data(p_class_userdata: C_VoidPtr, p_name: GDExtensionConstStringNamePtr) -> C_VoidPtr:
    # If it is the "_process" method, return a pointer to the gdexample_class_process function.
    if is_string_name_equal(p_name, c_str("_process")):
        return retype[C_VoidPtr](gdexample_class_process)
    # Otherwise, return NULL.
    return C_VoidPtr()


fn gdexample_class_call_virtual_with_data(p_instance: GDExtensionClassInstancePtr, p_name: GDExtensionConstStringNamePtr, p_virtual_call_userdata: C_VoidPtr, p_args: C_PtrConst[GDExtensionConstTypePtr], r_ret: GDExtensionTypePtr):
    # If it is the "_process" method, call it with a helper.
    if p_virtual_call_userdata == retype[C_VoidPtr](gdexample_class_process):
        ptrcall_1_float_arg_no_ret(p_virtual_call_userdata, p_instance, p_args, r_ret)
