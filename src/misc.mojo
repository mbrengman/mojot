from sys.ffi import CStringSlice, c_char

comptime C_Ptr = UnsafePointer[_, origin=MutAnyOrigin]
comptime C_PtrConst = UnsafePointer[_, origin=ImmutAnyOrigin]
comptime C_VoidPtr = C_Ptr[NoneType]
comptime C_VoidPtrConst = C_PtrConst[NoneType]
# comptime C_Str = CStringSlice[origin=MutAnyOrigin]
# comptime C_StrConst = CStringSlice[origin=ImmutAnyOrigin]
comptime C_Str = C_Ptr[c_char]
comptime C_StrConst = C_PtrConst[c_char]


fn undefined[T: AnyType](out result: T):
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(result))


fn retype[SrcType: AnyType, //, DstType: AnyType](ref src: SrcType) -> ref [origin_of(src)] DstType:
    return UnsafePointer(to=src).bitcast[DstType]()[]


fn null_fn[T: __TypeOfAllTypes]() -> T:
    return __mlir_op.`pop.pointer.bitcast`[_type=T](__mlir_attr.`#interp.pointer<0> : !kgen.pointer<none>`)


fn c_str(str: StringLiteral) -> C_StrConst:
    return str.as_c_string_slice().unsafe_ptr()
