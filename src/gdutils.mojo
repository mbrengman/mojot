from api import *
import math
from math import *
import random
import gdenums
import defs
import misc
from testing import assert_true
from utils.numerics import nan, inf
# from random import seed, random_si64, random_float64, randn

comptime VARIANT_SIZE: UInt = 24
comptime UTIL_TYPE = ImplicitlyDestructible & Writable

struct FloatUtils(Movable):
    '''
        "to_gd" boolean checks if data is coming from godot or going to godot. When this flag is set to True, the program assumes
        all incoming information is mojo types and outputs GDExtension types. For these functions, the caller will always be
        responsible for freeing and destroying data unless the result is an exception.
    '''
    var to_gd: Bool

    fn __init__(out self, to_gd:Bool):
        self.to_gd = to_gd


    fn sin(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]
        var value: Float32 = 0.0

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            value = math.sin(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None
            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.sin(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()
        var float_ptr = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn cos(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.cos(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.cos(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn tan(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.tan(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.tan(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn sinh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.sinh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.sinh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn cosh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.cosh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.cosh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn tanh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.tanh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.tanh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn asin(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.asin(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.asin(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn acos(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.acos(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.acos(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn atan(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.atan(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.atan(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn atan2(self,
             mojo_x:Optional[Float32]=None,
             mojo_y:Optional[Float32]=None,
             gd_x:Optional[GDExtensionVariantPtr]=None,
             gd_y:Optional[GDExtensionVariantPtr]=None
         ) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_x or not mojo_y:
                print("'mojo_x' and 'mojo_y' cannot be None if 'to_gd' is true")
                return None
            var value = math.atan2(mojo_x.value(), mojo_y.value())
        else:
            if not gd_x or not gd_y:
                print("'gd_x' and 'gd_y' cannot be None if 'to_gd' is false")
                return None

            var x = undefined[Float32]()
            var y = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=x).bitcast[NoneType](), gd_x.value())
            api.float_from_variant_constructor(C_Ptr(to=y).bitcast[NoneType](), gd_y.value())
            value = retype[GDExtensionVariantPtr](math.atan2(x, y))

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn asinh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.asinh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.asinh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn acosh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.acosh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.acosh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn atanh(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.atanh(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.atanh(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn sqrt(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.sqrt(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.sqrt(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn fmod(self,
             mojo_x:Optional[Float32]=None,
             mojo_y:Optional[Float32]=None,
             gd_x:Optional[GDExtensionVariantPtr]=None,
             gd_y:Optional[GDExtensionVariantPtr]=None
         ) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_x or not mojo_y:
                print("'mojo_x' and 'mojo_y' cannot be None if 'to_gd' is true")
                return None
            var value = mojo_x.value() % mojo_y.value()
        else:
            if not gd_x or not gd_y:
                print("'gd_x' and 'gd_y' cannot be None if 'to_gd' is false")
                return None

            var x = undefined[Float32]()
            var y = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=x).bitcast[NoneType](), gd_x.value())
            api.float_from_variant_constructor(C_Ptr(to=y).bitcast[NoneType](), gd_y.value())
            value = retype[GDExtensionVariantPtr](x % y)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn fposmod(self,
             mojo_x:Optional[Float32]=None,
             mojo_y:Optional[Float32]=None,
             gd_x:Optional[GDExtensionVariantPtr]=None,
             gd_y:Optional[GDExtensionVariantPtr]=None
         ) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_x or not mojo_y:
                print("'mojo_x' and 'mojo_y' cannot be None if 'to_gd' is true")
                return None
            var value = mojo_x.value() % mojo_y.value()
            value = value * -1 if value < 0 else value
        else:
            if not gd_x or not gd_y:
                print("'gd_x' and 'gd_y' cannot be None if 'to_gd' is false")
                return None

            var x = undefined[Float32]()
            var y = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=x).bitcast[NoneType](), gd_x.value())
            api.float_from_variant_constructor(C_Ptr(to=y).bitcast[NoneType](), gd_y.value())
            var mod = x % y
            mod = mod * -1 if mod < 0 else mod
            value = retype[GDExtensionVariantPtr](mod)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn floorf(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.floor(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.floor(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn ceilf(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.ceil(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.ceil(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())

    fn roundf(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_rad:
                print("'angle_rad' cannot be None if 'to_gd' is true")
                return None
            var value = math.round(mojo_rad.value())
        else:
            if not gd_rad:
                print("'gd_rad' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_rad.value())
            value = math.round(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())
fn posmod(self, x: Int64, y: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("posmod")

fn floor(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    return floor(x)

fn floori(x: Float64) -> Int64:
    return Int64(math.floor(x))

fn ceil(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    return ceil(x)

fn ceili(x: Float64) -> Int64:
    return Int64(math.ceil(x))

fn round(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    return round(x)

fn roundi(x: Float64) -> Int64:
    return Int64(math.round(x))

fn abs(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return abs(x)

fn absf(x: Float64) -> Float64:
    return math.abs(x)

fn absi(x: Int64) -> Int64:
    return math.abs(x)

fn sign(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("sign")

fn signf(x: Float64) -> Float64:
    var output = nan[DType.float64]()
    if x > 0:
        output = Scalar[DType.float64](1.0)
    elif x < 0:
        output = Scalar[DType.float64](-1.0)
    elif x == 0:
        output = Scalar[DType.float64](0.0)
    return output

fn signi(x: Int64) -> Int64:
    output: Int64 = 0
    if x > 0:
        output = 1
    elif x < 0:
        output = -1
    return output

fn snapped(x: GDExtensionVariantPtr, step: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("snapped")

fn snappedf(x: Float64, step: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("snappedf")

fn snappedi(x: Float64, step: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("snappedi")

fn pow(base: Float64, exp: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return math.pow(base, exp)

fn log(x: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return math.log(x)

fn exp(x: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return math.exp(x)

fn is_nan(x: Float64) -> Bool:
    return True if x == nan[DType.float64]() else False

fn is_inf(x: Float64) -> Bool:
    return True if x == Float64.MAX else False

fn is_equal_approx(a: Float64, b: Float64) -> Bool:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("is_equal_approx")

fn is_zero_approx(x: Float64) -> Bool:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("is_zero_approx")

fn is_finite(x: Float64) -> Bool:
    return True if x < Float64.MAX else False

fn ease(x: Float64, curve: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("ease")

fn step_decimals(x: Float64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("step_decimals")

fn lerp(start: GDExtensionVariantPtr, stop: GDExtensionVariantPtr, weight: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("lerp")

fn lerpf(start: Float64, stop: Float64, weight: Float64) -> Float64:
    return start + (stop - start) * weight

fn cubic_interpolate(start: Float64, stop: Float64, pre: Float64, post: Float64, weight: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("cubic_interpolate")

fn cubic_interpolate_angle(start: Float64, stop: Float64, pre: Float64, post: Float64, weight: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("cubic_interpolate_angle")

fn cubic_interpolate_in_time(start: Float64, stop: Float64, pre: Float64, post: Float64, weight: Float64, to_t: Float64, pre_t: Float64, post_t: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("cubic_interpolate_in_time")

fn cubic_interpolate_angle_in_time(start: Float64, stop: Float64, pre: Float64, post: Float64, weight: Float64, to_t: Float64, pre_t: Float64, post_t: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("cubic_interpolate_angle_in_time")

fn bezier_interpolate(start: Float64, control_1: Float64, control_2: Float64, end: Float64, t: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("bezier_interpolate")

fn bezier_derivative(start: Float64, control_1: Float64, control_2: Float64, end: Float64, t: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("bezier_derivative")

fn angle_difference(start: Float64, stop: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("angle_difference")

fn lerp_angle(from: Float64, to: Float64, weight: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("lerp_angle")

fn inverse_lerp(from: Float64, to: Float64, weight: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("inverse_lerp")

fn remap(value: Float64, istart: Float64, istop: Float64, ostart: Float64, ostop: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("remap")

fn smoothstep(from: Float64, to: Float64, x: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("smoothstep")

fn move_toward(start: Float64, stop: Float64, delta: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("move_toward")

fn rotate_toward(start: Float64, stop: Float64, delta: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("rotate_toward")

fn deg_to_rad(deg: Float64) -> Float64:
    return deg * (math.pi / 180)

fn rad_to_deg(rad: Float64) -> Float64:
    return rad * (180 / math.pi)

fn linear_to_db(lin: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("linear_to_db")

fn db_to_linear(db: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("db_to_linear")

fn wrap(value: GDExtensionVariantPtr, min: GDExtensionVariantPtr, max: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("wrap")

fn wrapi(value: Int64, min: Int64, max: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("wrapi")

fn wrapf(value: Float64, min: Float64, max: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("wrapf")

fn max(arg1: GDExtensionVariantPtr, arg2: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("max")

fn maxi(a: Int64, b: Int64) -> Int64:
    return a if a > b else b

fn maxf(a: Float64, b: Float64) -> Float64:
    return a if a < b else b

fn min(arg1: GDExtensionVariantPtr, arg2: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("min")

fn mini(a: Int64, b: Int64) -> Int64:
    return a if a < b else b

fn minf(a: Float64, b: Float64) -> Float64:
    return a if a < b else b

fn clamp(value: GDExtensionVariantPtr, min: GDExtensionVariantPtr, max: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("clamp")

fn clampi(value: Int64, min: Int64, max: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("clampi")

fn clampf(value: Float64, min: Float64, max: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("clampf")

fn nearest_po2(value: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("nearest_po2")

fn pingpong(value: Float64, length: Float64) -> Float64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("pingpong")

fn randomize():
    random.seed()

fn randi() -> Int64:
    return random.random_si64(Int.MIN, Int.MAX)

fn randf() -> Float64:
    # TODO: Prepare args as Variant array.
    return random.random_float64(Float64.MIN, Float64.MAX)

fn randi_range(start: Int, stop: Int) -> Int64:
    return random.random_si64(start, stop)
    # TODO: Prepare args as Variant array.

fn randf_range(start: Float64, stop: Float64) -> Float64:
    return random.random_float64(start, stop)

fn randfn(mean: Float64, deviation: Float64) -> Float64:
    var size: Int = 1
    var ptr = alloc[Float64](size)
    random.randn[DType.float64](ptr, size, mean=mean, standard_deviation=deviation)
    output: Float64
    for i in range(size):
        output = ptr[i].copy()
    ptr.free()
    return output

fn seed(base: Int):
    random.seed(base)

fn rand_from_seed(start: Int) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("rand_from_seed")

fn weakref(obj: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("weakref")

fn typeof(variable: GDExtensionVariantPtr) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("typeof")

fn type_convert(variant: GDExtensionVariantPtr, type: Int64) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("type_convert")

fn str(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> GDString:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("str")

fn error_string(error: Int64) -> GDString:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("error_string")

fn type_string(type: Int64) -> GDString:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("type_string")

fn _print(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr):
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("print")

fn print_rich(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("print_rich")

fn printerr(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("printerr")

fn printt(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("printt")

fn prints(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("prints")

fn printraw(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("printraw")

fn print_verbose(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("print_verbose")

fn push_error(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("push_error")

fn push_warning(arg1: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("push_warning")

fn var_to_str(variable: GDExtensionVariantPtr) -> GDString:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("var_to_str")

fn str_to_var(string: GDString) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("str_to_var")

fn var_to_bytes(variable: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("var_to_bytes")

fn bytes_to_var(bytes: AnyType) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("bytes_to_var")

fn var_to_bytes_with_objects(variable: GDExtensionVariantPtr) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("var_to_bytes_with_objects")

fn bytes_to_var_with_objects(bytes: AnyType) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("bytes_to_var_with_objects")

fn hash(variable: GDExtensionVariantPtr) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("hash")

fn instance_from_id(instance_id: Int64) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("instance_from_id")

fn is_instance_id_valid(id: Int64) -> Bool:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("is_instance_id_valid")

fn is_instance_valid(instance: GDExtensionVariantPtr) -> Bool:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("is_instance_valid")

fn rid_allocate_id() -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("rid_allocate_id")

fn rid_from_int64(base: Int64) -> AnyType:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("rid_from_int64")

fn is_same(a: GDExtensionVariantPtr, b: GDExtensionVariantPtr) -> Bool:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("is_same")

fn variant_to_float(variant_ptr: GDExtensionVariantPtr) -> Float64:
     var result = undefined[Float64]()
     ref api = get_api()[]
     api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), variant_ptr)
     return result

fn float_to_variant(bits: UInt8, value: Float64) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(bits).bitcast[GDExtensionVariant]()
    var float_ptr = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
    var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())
    if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
        api.mem_free(variant_ptr.bitcast[None]())
        return C_VoidPtr()

    return variant_ptr.bitcast[NoneType]()
