from misc import *

from gdextension_interface import *
from api import *
from defs import *
from gdexample import *


fn init_module(p_userdata: C_VoidPtr, p_level: GDExtensionInitializationLevel):
    print("godot init ", p_level)
    ref api = get_api()[]

    if p_level != GDEXTENSION_INITIALIZATION_SCENE:
        return

    # Get ClassDB methods here because the classes we need are all properly registered now.
    # See extension_api.json for hashes.
    var native_class_name = undefined[StringName]()
    var method_name = undefined[StringName]()

    api.string_name_new_with_latin1_chars(C_Ptr(to=native_class_name).bitcast[NoneType](), c_str("Node2D"), GDExtensionBool(False))
    api.string_name_new_with_latin1_chars(C_Ptr(to=method_name).bitcast[NoneType](), c_str("set_position"), GDExtensionBool(False))
    api.node2d_set_position = api.classdb_get_method_bind(C_Ptr(to=native_class_name).bitcast[NoneType](), C_Ptr(to=method_name).bitcast[NoneType](), 743155724)
    api.string_name_destructor(C_Ptr(to=native_class_name).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=method_name).bitcast[NoneType]())

    # Register class.
    var class_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=class_name).bitcast[NoneType](), c_str("GDExample"), GDExtensionBool(False))
    var parent_class_name = undefined[StringName]()
    api.string_name_new_with_latin1_chars(C_Ptr(to=parent_class_name).bitcast[NoneType](), c_str("Sprite2D"), GDExtensionBool(False))

    var class_info = GDExtensionClassCreationInfo2(
        is_virtual=GDExtensionBool(False),
        is_abstract=GDExtensionBool(False),
        is_exposed=GDExtensionBool(True),
        set_func=null_fn[GDExtensionClassSet](),
        get_func=null_fn[GDExtensionClassGet](),
        get_property_list_func=null_fn[GDExtensionClassGetPropertyList](),
        free_property_list_func=null_fn[GDExtensionClassFreePropertyList](),
        property_can_revert_func=null_fn[GDExtensionClassPropertyCanRevert](),
        property_get_revert_func=null_fn[GDExtensionClassPropertyGetRevert](),
        validate_property_func=null_fn[GDExtensionClassValidateProperty](),
        notification_func=null_fn[GDExtensionClassNotification2](),
        to_string_func=null_fn[GDExtensionClassToString](),
        reference_func=null_fn[GDExtensionClassReference](),
        unreference_func=null_fn[GDExtensionClassUnreference](),
        create_instance_func=gdexample_class_create_instance,
        free_instance_func=gdexample_class_free_instance,
        recreate_instance_func=null_fn[GDExtensionClassRecreateInstance](),
        get_virtual_func=null_fn[GDExtensionClassGetVirtual](),
        get_virtual_call_data_func=gdexample_class_get_virtual_with_data,
        call_virtual_with_data_func=gdexample_class_call_virtual_with_data,
        get_rid_func=null_fn[GDExtensionClassGetRID](),
        class_userdata=C_VoidPtr(),
    )

    api.classdb_register_extension_class2(
        api.class_library,
        C_Ptr(to=class_name).bitcast[NoneType](),
        C_Ptr(to=parent_class_name).bitcast[NoneType](),
        C_Ptr(to=class_info),
    )

    # Bind methods.
    gdexample_class_bind_methods()

    # Destruct things.
    api.string_name_destructor(C_Ptr(to=class_name).bitcast[NoneType]())
    api.string_name_destructor(C_Ptr(to=parent_class_name).bitcast[NoneType]())


fn deinit_module(p_userdata: C_VoidPtr, p_level: GDExtensionInitializationLevel):
    print("godot deinit ", p_level)


@export("mojot_init", ABI="C")
fn mojot_init(p_get_proc_address: GDExtensionInterfaceGetProcAddress, p_library: GDExtensionClassLibraryPtr, r_initialization: C_Ptr[GDExtensionInitialization]) -> GDExtensionBool:
    print("hello mojot")
    get_api()[] = API(p_get_proc_address, p_library)

    r_initialization[].initialize = init_module
    r_initialization[].deinitialize = deinit_module
    r_initialization[].userdata = C_VoidPtr()
    r_initialization[].minimum_initialization_level = GDEXTENSION_INITIALIZATION_SCENE
    return GDExtensionBool(True)
