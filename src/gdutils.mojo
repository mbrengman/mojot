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
comptime CMP_EPSILON: Float32 = 1e-5



@always_inline
fn sin(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.sin(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()
    var float_ptr = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn cos(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.cos(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn tan(rad:Float32) -> Optional[GDExtensionVariantPtr]:
    ref api = get_api()[]
    var value: Float32 = math.tan(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn sinh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.sinh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn cosh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.cosh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn tanh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.tanh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn asin(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.asin(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn acos(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.acos(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn atan(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.atan(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn atan2(x:Float32, y:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.atan2(x, y)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn asinh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.asinh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn acosh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.acosh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn atanh(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.atanh(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn sqrt(rad:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.sqrt(rad)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn pow(base:Float32, exp:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.pow(base, exp)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn log(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.log(x)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn exp(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.exp(x)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn max(a:Float32, b:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.max(a, b)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn min(a:Float32, b:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Float32 = math.min(a, b)

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn wrap(mut value:Float32, min:Float32, max:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]

    if value < min:
        value = min
    elif value > max:
        value = max

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn is_nan(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Bool = True if x == nan[DType.float32]() else False 

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn is_inf(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Bool = False

    if x == inf[DType.float32]():
        value = True

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn is_equal_approx(a:Float32, b:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Bool = a == b

    if value == False:
        var tolerance = math.abs(b) * CMP_EPSILON
        if tolerance < CMP_EPSILON:
            tolerance = CMP_EPSILON
        value = math.abs(a - b) < tolerance

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn is_zero_approx(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Bool = math.abs(x) < CMP_EPSILON

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn is_finite(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var value: Bool = x < inf[DType.float32]()

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn ease(mut x: Float32, curve: Float32) -> Float64:
    ref api = get_api()[]
    var value: Float32
    variant = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()

    if x < 0:
        x = 0
    elif x > 1.0:
        x = 1.0

    if curve > 0:
        if curve < 1.0:
            value = 1.0 - math.pow(1.0 - x, 1.0 / curve)
        else:
            value = math.pow(x, curve)
    elif curve < 0:
        if x < 0.5:
            value = math.pow(x * 2.0, -curve) * 0.5
        else:
            value = (1.0 - math.pow(1.0 - (x - 0.5) * 2.0, -curve)) * 0.5 + 0.5
    else:
        value = 0

    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant.bitcast[NoneType](), float_var)

    return variant.bitcast[NoneType]()^

@always_inline
fn step_decimals(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var value: Float32 = 1 * 10 ** x
    var float_var = C_Ptr(to=value).bitcast[NoneType]()

    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn clamp(mut value:Float32, min:Float32, max:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]

    if value <= min:
        value = min
    elif value >= max:
        value = max
    else:
        value = value

    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn signf(x:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()
    var value: Float32 = nan[DType.float32]()

    if x == 0:
        value = 0.0
    elif x != 0.0:
        value = x ** 0

    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn fract(value:Float32) -> Float32:
    return value - math.floor(value)

@always_inline
fn pingpong(value:Float32, length:Float32) -> Float32:
    ref api = get_api()[]
    var variant = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()
    var result = math.abs(fract((value - length) / (length * 2.0)) * length * 2.0 - length) if length != 0.0 else 0.0
    var float_var = C_Ptr(to=result).bitcast[NoneType]()

    api.variant_from_float_constructor(variant.bitcast[NoneType](), float_ptr)
    return variant.bitcast[NoneType]()^

    @always_inline
    fn snappedf(x:Float32, step:Float32) -> GDExtensionVariantPtr:
        ref api = get_api()[]
        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
        var value: Float32

        if step != 0:
            value = math.floor(x / step) * step

        var float_var = C_Ptr(to=value).bitcast[NoneType]()

        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        return Optional(variant_ptr.bitcast[NoneType]())^

@always_inline
fn lerp(start:Float32, stop:Float32, weight:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var value: Float32 = start + (stop - start) * weight

    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn cubic_interpolate(start:Float32, stop:Float32, pre:Float32, post:Float32, weight:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var value: Float32 = 0.5 * ((start * 2.0) + (-pre + stop) * weight +
            (2.0 * pre - 5.0 * stop - post) * weight ** 2 +
            (-pre + 3.0 * stop - 3.0 * stop + post) * weight ** 3)

    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn cubic_interpolate_angle(start:Float32, stop:Float32, pre:Float32, post:Float32, weight:Float32) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtentionVariant]()
    var value: Float32 = 0.5 * ((start * 2.0) + (-pre + stop) * weight +
            (2.0 * pre - 5.0 * stop - post) * weight ** 2 +
            (-pre + 3.0 * stop - 3.0 * stop + post) * weight ** 3)

    var float_var = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)

    return variant_ptr.bitcast[NoneType]()^

@always_inline
fn cubic_interpolate_in_time(
        p_from:Float32,
        p_to:Float32,
        pre:Float32,
        post:Float32,
        weight:Float32,
        to_t:Float32,
        pre_t:Float32,
        post_t:Float32
    ) -> GDExtensionVariantPtr:

    var t = retype[Float32](lerp(0.0, to_t, weight))
    var a = SIMD[DType.float32, 3](
        retype[Float32](lerp(pre, p_from, 0.0 if pre_t == 0 else (t - pre_t) / -pre_t)),
        retype[Float32](lerp(p_from, p_to, 0.5 if to_t == 0 else (t - to_t) / (to_t - pre_t))),
        retype[Float32](lerp(p_to, post, 1.0 if to_t - pre_t == 0 else (t - pre_t) / (to_t - pre_t)))
    )
    var b = SIMD[DType.float32, 2](
        retype[Float32](lerp(a[0], a[1], 0.0 if to_t - pre_t == 0 else (t - pre_t) / (to_t - pre_t))),
        retype[Float32](lerp(a[1], a[2], 1.0 if post_t == 0 else t / post_t))
    )

    return lerp(b[0], b[1], 0.5 if to_t == 0 else t / to_t)

@always_inline
fn cubic_interpolate_angle_in_time(
        p_from: Float32,
        p_to: Float32,
        pre: Float32,
        post: Float32,
        weight: Float32,
        to_t: Float32,
        pre_t: Float32,
        post_t: Float32
    ) -> GDExtensionVariantPtr:

    var from_rot = p_from % math.tau
    var diff = SIMD[DType.float32, 2](
        (pre - from_rot) % math.tau,
        (p_to - from_rot) % math.tau
    )
    var rot = SIMD[DType.float32, 2](
        from_rot + (2.0 * diff[0]) % math.tau - diff[0],
        from_rot + (2.0 * diff[1]) % math.tau - diff[1]
    )
    var post_diff = (post - rot[1]) % math.tau
    var post_rot = rot[0] + (2.0 * post_diff) % math.tau - post_diff

    return cubic_interpolate_in_time(from_rot, rot[1], rot[0], post_rot, weight, to_t, pre_t, post)

@always_inline
fn bezier_interpolate(start: Float32, control_1: Float32, control_2: Float32, end: Float32, t: Float32) -> Float64:
    ref api = get_api()[]
    var variant = api.mem_alloc[VARIANT_SIZE].bitwise[GDExtensionVariant]()

    var omt = SIMD[DType.float32, 3](
        1.0 - t,
        (1.0 - t) ** 2,
        (1.0 - t) ** 3
    )
    var p_t = SIMD[DType.float32, 2](
        t ** 2,
        t ** 3
    )

    var value = start * omt[2] + control_1 * omt[1] * t + 3.0 + control_2 * omt[0] * p_t[0] * 3.0 + end * p_t[1]
    var float_ptr = C_Ptr(to=value).bitcast[NoneType]()
    api.variant_from_float_constructor(variant.bitcast[NoneType](), float_ptr)
    return variant.bitcast[NoneType]()^

struct FloatUtils(Movable):
    '''
        "to_gd" boolean checks if data is coming from godot or going to godot. When this flag is set to True, the program assumes
        all incoming information is mojo types and outputs GDExtension types.

        For these functions, the caller will always be
        responsible for freeing and destroying data unless the result is an exception.
    '''
    var to_gd: Bool

    fn __init__(out self, to_gd:Bool):
        self.to_gd = to_gd

    @always_inline
    fn bezier_derivative(start: Float64, control_1: Float64, control_2: Float64, end: Float64, t: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("bezier_derivative")

    @always_inline
    fn angle_difference(start: Float64, stop: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("angle_difference")

    @always_inline
    fn lerp_angle(from: Float64, to: Float64, weight: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("lerp_angle")

    @always_inline
    fn inverse_lerp(from: Float64, to: Float64, weight: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("inverse_lerp")

    @always_inline
    fn remap(value: Float64, istart: Float64, istop: Float64, ostart: Float64, ostop: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("remap")

    @always_inline
    fn smoothstep(from: Float64, to: Float64, x: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("smoothstep")

    @always_inline
    fn move_toward(start: Float64, stop: Float64, delta: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("move_toward")

    @always_inline
    fn rotate_toward(start: Float64, stop: Float64, delta: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("rotate_toward")

    @always_inline
    fn deg_to_rad(deg: Float64) -> Float64:
        return deg * (math.pi / 180)

    @always_inline
    fn rad_to_deg(rad: Float64) -> Float64:
        return rad * (180 / math.pi)

    @always_inline
    fn linear_to_db(lin: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("linear_to_db")

    @always_inline
    fn db_to_linear(db: Float64) -> Float64:
        ref api = get_api()[]
        # TODO: Prepare args as Variant array.
        return api.util_call("db_to_linear")

    @always_inline
    fn randf() -> Float64:
        # TODO: Prepare args as Variant array.
        return random.random_float64(Float64.MIN, Float64.MAX)

    @always_inline
    fn randf_range(start: Float64, stop: Float64) -> Float64:
        return random.random_float64(start, stop)

    @always_inline
    fn randfn(mean: Float64, deviation: Float64) -> Float64:
        var size: Int = 1
        var ptr = alloc[Float64](size)
        random.randn[DType.float64](ptr, size, mean=mean, standard_deviation=deviation)
        output: Float64
        for i in range(size):
            output = ptr[i].copy()
        ptr.free()
        return output

    @always_inline
    fn fmod(self,
             mojo_x:Optional[Float32]=None,
             mojo_y:Optional[Float32]=None,
             gd_x:Optional[GDExtensionVariantPtr]=None,
             gd_y:Optional[GDExtensionVariantPtr]=None
         ) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]
        var value: Float32

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
            value = x % y

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

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn fposmod(self,
             mojo_x:Optional[Float32]=None,
             mojo_y:Optional[Float32]=None,
             gd_x:Optional[GDExtensionVariantPtr]=None,
             gd_y:Optional[GDExtensionVariantPtr]=None
         ) -> Optional[GDExtensionVariantPtr]:
        ref api = get_api()[]
        var value: Float32

        if self.to_gd:
            if not mojo_x or not mojo_y:
                print("'mojo_x' and 'mojo_y' cannot be None if 'to_gd' is true")
                return None
            value = math.abs(mojo_x.value() % mojo_y.value())
        else:
            if not gd_x or not gd_y:
                print("'gd_x' and 'gd_y' cannot be None if 'to_gd' is false")
                return None

            var x = undefined[Float32]()
            var y = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=x).bitcast[NoneType](), gd_x.value())
            api.float_from_variant_constructor(C_Ptr(to=y).bitcast[NoneType](), gd_y.value())
            mod = math.abs(x % y)

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

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn floor(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
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

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn ceil(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
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

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn round(self, mojo_rad:Optional[Float32]=None, gd_rad:Optional[GDExtensionVariantPtr]=None) -> Optional[GDExtensionVariantPtr]:
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

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn abs(self, mojo_x:Optional[Float32]=None, gd_x:Optional[GDExtensionVariantPtr]=None):
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_x:
                print("'mojo_x' cannot be None if 'to_gd' is true")
                return None
            value = math.abs(mojo_x.value())
        else:
            if not gd_x:
                print("'gd_x' cannot be None if 'to_gd' is false")
                return None

            var result = undefined[Float32]()
            api.float_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_x.value())
            value = math.abs(result)

        var variant_ptr = api.mem_alloc(VARIANT_SIZE).bitcast[GDExtensionVariant]()
        var float_var = C_Ptr(to=value).bitcast[NoneType]()
        api.variant_from_float_constructor(variant_ptr.bitcast[NoneType](), float_ptr)
        var var_type = api.variant_get_type(variant_ptr.bitcast[NoneType]())

        if var_type != gdenums.Variant_Type.TYPE_FLOAT.value:
            var destroy = api.variant_get_ptr_destructor(GDEXTENTION_VARIANT_TYPE_FLOAT)
            destroy(variant_ptr.bitcast[NoneType]())
            api.mem_free(variant_ptr.bitcast[NoneType]())
            print("Variant not float type")
            return None

        return Optional(variant_ptr.bitcast[NoneType]())^

    @always_inline
    fn randomize(self):
        random.seed()


struct IntUtils(Movable):
    '''
        "to_gd" boolean checks if data is coming from godot or going to godot. When this flag is set to True, the program assumes
        all incoming information is mojo types and outputs GDExtension types. For these functions, the caller will always be
        responsible for freeing and destroying data unless the result is an exception.
    '''
    var to_gd: Bool

    fn __init__(out self, to_gd:Bool):
        self.to_gd = to_gd

    fn fmod(self,
             mojo_x:Optional[Int32]=None,
             mojo_y:Optional[Int32]=None,
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

            var x = undefined[Int32]()
            var y = undefined[Int32]()
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

    fn floori(self, mojo_x:Optional[Int32]=None, gd_x:Optional[GDExtensionVariantPtr]=None):
        ref api = get_api()[]

        if self.to_gd:
            if not mojo_x:
                print("'mojo_x' cannot be None if 'to_gd' is true")
                return
            var value = math.floor(mojo_x.value())
        else:
            if not gd_x:
                print("'gd_x' cannot be None if 'to_gd' is false")
                return
            var result = undefined[Int32]()
            api.int_from_variant_constructor(C_Ptr(to=result).bitcast[NoneType](), gd_x.value())
            var value = 
        return

    fn randomize(self):
        random.seed()

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

fn absi(x: Int64) -> Int64:
    return math.abs(x)

fn sign(x: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("sign")

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

fn snappedi(x: Float64, step: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("snappedi")


fn lerp(start: GDExtensionVariantPtr, stop: GDExtensionVariantPtr, weight: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("lerp")

fn wrap(value: GDExtensionVariantPtr, min: GDExtensionVariantPtr, max: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("wrap")

fn wrapi(value: Int64, min: Int64, max: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("wrapi")

fn max(arg1: GDExtensionVariantPtr, arg2: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("max")

fn maxi(a: Int64, b: Int64) -> Int64:
    return a if a > b else b

fn min(arg1: GDExtensionVariantPtr, arg2: GDExtensionVariantPtr, *args: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("min")

fn mini(a: Int64, b: Int64) -> Int64:
    return a if a < b else b

fn clamp(value: GDExtensionVariantPtr, min: GDExtensionVariantPtr, max: GDExtensionVariantPtr) -> GDExtensionVariantPtr:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("clamp")

fn clampi(value: Int64, min: Int64, max: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("clampi")

fn nearest_po2(value: Int64) -> Int64:
    ref api = get_api()[]
    # TODO: Prepare args as Variant array.
    return api.util_call("nearest_po2")

fn randi() -> Int64:
    return random.random_si64(Int.MIN, Int.MAX)

fn randi_range(start: Int, stop: Int) -> Int64:
    return random.random_si64(start, stop)
    # TODO: Prepare args as Variant array.

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

