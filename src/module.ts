import {
  Target
} from "./compiler";

import {
  U64
} from "./util/i64";

export type ModuleRef = usize;
export type FunctionTypeRef = usize;
export type FunctionRef = usize;
export type ExpressionRef = usize;
export type GlobalRef = usize;
export type ImportRef = usize;
export type ExportRef = usize;
export type Index = u32;

export enum NativeType {
  None = _BinaryenTypeNone(),
  I32 = _BinaryenTypeInt32(),
  I64 = _BinaryenTypeInt64(),
  F32 = _BinaryenTypeFloat32(),
  F64 =  _BinaryenTypeFloat64(),
  Unreachable = _BinaryenTypeUnreachable(),
  Auto = _BinaryenTypeAuto()
}

export enum ExpressionId {
  Invalid = _BinaryenInvalidId(),
  Block = _BinaryenBlockId(),
  If = _BinaryenIfId(),
  Loop = _BinaryenLoopId(),
  Break = _BinaryenBreakId(),
  Switch = _BinaryenSwitchId(),
  Call = _BinaryenCallId(),
  CallImport = _BinaryenCallImportId(),
  CallIndirect = _BinaryenCallIndirectId(),
  GetLocal = _BinaryenGetLocalId(),
  SetLocal = _BinaryenSetLocalId(),
  GetGlobal = _BinaryenGetGlobalId(),
  SetGlobal = _BinaryenSetGlobalId(),
  Load = _BinaryenLoadId(),
  Store = _BinaryenStoreId(),
  Const = _BinaryenConstId(),
  Unary = _BinaryenUnaryId(),
  Binary = _BinaryenBinaryId(),
  Select = _BinaryenSelectId(),
  Drop = _BinaryenDropId(),
  Return = _BinaryenReturnId(),
  Host = _BinaryenHostId(),
  Nop = _BinaryenNopId(),
  Unreachable = _BinaryenUnreachableId(),
  AtomicCmpxchg = _BinaryenAtomicCmpxchgId(),
  AtomicRMW = _BinaryenAtomicRMWId(),
  AtomicWait = _BinaryenAtomicWaitId(),
  AtomicWake = _BinaryenAtomicWakeId()
}

export enum UnaryOp {
  ClzI32 = _BinaryenClzInt32(),
  CtzI32 = _BinaryenCtzInt32(),
  PopcntI32 = _BinaryenPopcntInt32(),
  NegF32 = _BinaryenNegFloat32(),
  AbsF32 = _BinaryenAbsFloat32(),
  CeilF32 = _BinaryenCeilFloat32(),
  FloorF32 = _BinaryenFloorFloat32(),
  TruncF32 = _BinaryenTruncFloat32(),
  NearestF32 = _BinaryenNearestFloat32(),
  SqrtF32 = _BinaryenSqrtFloat32(),
  EqzI32 = _BinaryenEqZInt32(),
  ClzI64 = _BinaryenClzInt64(),
  CtzI64 = _BinaryenCtzInt64(),
  PopcntI64 = _BinaryenPopcntInt64(),
  NegF64 = _BinaryenNegFloat64(),
  AbsF64 = _BinaryenAbsFloat64(),
  CeilF64 = _BinaryenCeilFloat64(),
  FloorF64 = _BinaryenFloorFloat64(),
  TruncF64 = _BinaryenTruncFloat64(),
  NearestF64 = _BinaryenNearestFloat64(),
  SqrtF64 = _BinaryenSqrtFloat64(),
  EqzI64 = _BinaryenEqZInt64(),
  ExtendI32 = _BinaryenExtendSInt32(),
  ExtendU32 = _BinaryenExtendUInt32(),
  WrapI64 = _BinaryenWrapInt64(),
  TruncF32ToI32 = _BinaryenTruncSFloat32ToInt32(),
  TruncF32ToI64 = _BinaryenTruncSFloat32ToInt64(),
  TruncF32ToU32 = _BinaryenTruncUFloat32ToInt32(),
  TruncF32ToU64 = _BinaryenTruncUFloat32ToInt64(),
  TruncF64ToI32 = _BinaryenTruncSFloat64ToInt32(),
  TruncF64ToI64 = _BinaryenTruncSFloat64ToInt64(),
  TruncF64ToU32 = _BinaryenTruncUFloat64ToInt32(),
  TruncF64ToU64 = _BinaryenTruncUFloat64ToInt64(),
  ReinterpretF32 = _BinaryenReinterpretFloat32(),
  ReinterpretF64 = _BinaryenReinterpretFloat64(),
  ConvertI32ToF32 = _BinaryenConvertSInt32ToFloat32(),
  ConvertI32ToF64 = _BinaryenConvertSInt32ToFloat64(),
  ConvertU32ToF32 = _BinaryenConvertUInt32ToFloat32(),
  ConvertU32ToF64 = _BinaryenConvertUInt32ToFloat64(),
  ConvertI64ToF32 = _BinaryenConvertSInt64ToFloat32(),
  ConvertI64ToF64 = _BinaryenConvertSInt64ToFloat64(),
  ConvertU64ToF32 = _BinaryenConvertUInt64ToFloat32(),
  ConvertU64ToF64 = _BinaryenConvertUInt64ToFloat64(),
  PromoteF32 = _BinaryenPromoteFloat32(),
  DemoteF64 = _BinaryenDemoteFloat64(),
  ReinterpretI32 = _BinaryenReinterpretInt32(),
  ReinterpretI64 = _BinaryenReinterpretInt64()

  // see: https://github.com/WebAssembly/threads/blob/master/proposals/threads/Overview.md#new-sign-extending-operators
  // ExtendI8ToI32 =_BinaryenExtendS8Int32()
  // ExtendI16ToI32 = _BinaryenExtendS16Int32()
  // ExtendI8ToI64 = _BinaryenExtendS8Int64() // operand is I64
  // ExtendI16ToI64 = _BinaryenExtendS16Int64()
  // ExtendI32ToI64 = _BinaryenExtendS32Int64()

  // see: https://github.com/WebAssembly/nontrapping-float-to-int-conversions/blob/master/proposals/nontrapping-float-to-int-conversion/Overview.md#design
  // TruncF32ToI32Sat
  // TruncF32ToU32Sat
  // TruncF64ToI32Sat
  // TruncF64ToU32Sat
  // TruncF32ToI64Sat
  // TruncF32ToU64Sat
  // TruncF64ToI64Sat
  // TruncF64ToU64Sat
}

export enum BinaryOp {
  AddI32 = _BinaryenAddInt32(),
  SubI32 = _BinaryenSubInt32(),
  MulI32 = _BinaryenMulInt32(),
  DivI32 = _BinaryenDivSInt32(),
  DivU32 = _BinaryenDivUInt32(),
  RemI32 = _BinaryenRemSInt32(),
  RemU32 = _BinaryenRemUInt32(),
  AndI32 = _BinaryenAndInt32(),
  OrI32 = _BinaryenOrInt32(),
  XorI32 = _BinaryenXorInt32(),
  ShlI32 = _BinaryenShlInt32(),
  ShrU32 = _BinaryenShrUInt32(),
  ShrI32 = _BinaryenShrSInt32(),
  RotlI32 = _BinaryenRotLInt32(),
  RotrI32 = _BinaryenRotRInt32(),
  EqI32 = _BinaryenEqInt32(),
  NeI32 = _BinaryenNeInt32(),
  LtI32 = _BinaryenLtSInt32(),
  LtU32 = _BinaryenLtUInt32(),
  LeI32 = _BinaryenLeSInt32(),
  LeU32 = _BinaryenLeUInt32(),
  GtI32 = _BinaryenGtSInt32(),
  GtU32 = _BinaryenGtUInt32(),
  GeI32 = _BinaryenGeSInt32(),
  GeU32 = _BinaryenGeUInt32(),
  AddI64 = _BinaryenAddInt64(),
  SubI64 = _BinaryenSubInt64(),
  MulI64 = _BinaryenMulInt64(),
  DivI64 = _BinaryenDivSInt64(),
  DivU64 = _BinaryenDivUInt64(),
  RemI64 = _BinaryenRemSInt64(),
  RemU64 = _BinaryenRemUInt64(),
  AndI64 = _BinaryenAndInt64(),
  OrI64 = _BinaryenOrInt64(),
  XorI64 = _BinaryenXorInt64(),
  ShlI64 = _BinaryenShlInt64(),
  ShrU64 = _BinaryenShrUInt64(),
  ShrI64 = _BinaryenShrSInt64(),
  RotlI64 = _BinaryenRotLInt64(),
  RotrI64 = _BinaryenRotRInt64(),
  EqI64 = _BinaryenEqInt64(),
  NeI64 = _BinaryenNeInt64(),
  LtI64 = _BinaryenLtSInt64(),
  LtU64 = _BinaryenLtUInt64(),
  LeI64 = _BinaryenLeSInt64(),
  LeU64 = _BinaryenLeUInt64(),
  GtI64 = _BinaryenGtSInt64(),
  GtU64 = _BinaryenGtUInt64(),
  GeI64 = _BinaryenGeSInt64(),
  GeU64 = _BinaryenGeUInt64(),
  AddF32 = _BinaryenAddFloat32(),
  SubF32 = _BinaryenSubFloat32(),
  MulF32 = _BinaryenMulFloat32(),
  DivF32 = _BinaryenDivFloat32(),
  CopysignF32 = _BinaryenCopySignFloat32(),
  MinF32 = _BinaryenMinFloat32(),
  MaxF32 = _BinaryenMaxFloat32(),
  EqF32 = _BinaryenEqFloat32(),
  NeF32 = _BinaryenNeFloat32(),
  LtF32 = _BinaryenLtFloat32(),
  LeF32 = _BinaryenLeFloat32(),
  GtF32 = _BinaryenGtFloat32(),
  GeF32 = _BinaryenGeFloat32(),
  AddF64 = _BinaryenAddFloat64(),
  SubF64 = _BinaryenSubFloat64(),
  MulF64 = _BinaryenMulFloat64(),
  DivF64 = _BinaryenDivFloat64(),
  CopysignF64 = _BinaryenCopySignFloat64(),
  MinF64 = _BinaryenMinFloat64(),
  MaxF64 = _BinaryenMaxFloat64(),
  EqF64 = _BinaryenEqFloat64(),
  NeF64 = _BinaryenNeFloat64(),
  LtF64 = _BinaryenLtFloat64(),
  LeF64 = _BinaryenLeFloat64(),
  GtF64 = _BinaryenGtFloat64(),
  GeF64 = _BinaryenGeFloat64()
}

export enum HostOp {
  PageSize = _BinaryenPageSize(),
  CurrentMemory = _BinaryenCurrentMemory(),
  GrowMemory = _BinaryenGrowMemory(),
  HasFeature = _BinaryenHasFeature(),

  // see: https://github.com/WebAssembly/bulk-memory-operations/blob/master/proposals/bulk-memory-operations/Overview.md#design
  // MoveMemory
  // SetMemory
}

export enum AtomicRMWOp {
  Add = _BinaryenAtomicRMWAdd(),
  Sub = _BinaryenAtomicRMWSub(),
  And = _BinaryenAtomicRMWAnd(),
  Or = _BinaryenAtomicRMWOr(),
  Xor = _BinaryenAtomicRMWXor(),
  Xchg = _BinaryenAtomicRMWXchg()
}

export class MemorySegment {

  buffer: Uint8Array;
  offset: U64;

  static create(buffer: Uint8Array, offset: U64) {
    var segment = new MemorySegment();
    segment.buffer = buffer;
    segment.offset = offset;
    return segment;
  }
}

export class Module {

  ref: ModuleRef;
  lit: BinaryenLiteral;

  static MAX_MEMORY_WASM32: Index = 0xffff;

  static create(): Module {
    var module = new Module();
    module.ref = _BinaryenModuleCreate();
    module.lit = changetype<BinaryenLiteral>(allocate_memory(16));
    return module;
  }

  static createFrom(buffer: Uint8Array): Module {
    var cArr = allocU8Array(buffer);
    try {
      var module = new Module();
      module.ref = _BinaryenModuleRead(cArr, buffer.length);
      module.lit = changetype<BinaryenLiteral>(allocate_memory(16));
       return module;
    } finally {
      free_memory(changetype<usize>(cArr));
    }
  }

  private constructor() { }

  // types

  addFunctionType(name: string, result: NativeType, paramTypes: NativeType[]): FunctionRef {
    var cStr = allocString(name);
    var cArr = allocI32Array(paramTypes);
    try {
      return _BinaryenAddFunctionType(this.ref, cStr, result, cArr, paramTypes.length);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  getFunctionTypeBySignature(result: NativeType, paramTypes: NativeType[]): FunctionTypeRef {
    var cArr = allocI32Array(paramTypes);
    try {
      return _BinaryenGetFunctionTypeBySignature(this.ref, result, cArr, paramTypes.length);
    } finally {
      free_memory(cArr);
    }
  }

  // expressions

  createI32(value: i32): ExpressionRef {
    _BinaryenLiteralInt32(this.lit, value);
    return _BinaryenConst(this.ref, this.lit);
  }

  createI64(lo: i32, hi: i32 = 0): ExpressionRef {
    _BinaryenLiteralInt64(this.lit, lo, hi);
    return _BinaryenConst(this.ref, this.lit);
  }

  createF32(value: f32): ExpressionRef {
    _BinaryenLiteralFloat32(this.lit, value);
    return _BinaryenConst(this.ref, this.lit);
  }

  createF64(value: f64): ExpressionRef {
    _BinaryenLiteralFloat64(this.lit, value);
    return _BinaryenConst(this.ref, this.lit);
  }

  createUnary(op: UnaryOp, expr: ExpressionRef): ExpressionRef {
    return _BinaryenUnary(this.ref, op, expr);
  }

  createBinary(op: BinaryOp, left: ExpressionRef, right: ExpressionRef): ExpressionRef {
    return _BinaryenBinary(this.ref, op, left, right);
  }

  createHost(op: HostOp, name: string | null = null, operands: ExpressionRef[] | null = null): ExpressionRef {
    var cStr = allocString(name);
    var cArr = allocI32Array(operands);
    try {
      return _BinaryenHost(this.ref, op, cStr, cArr, operands ? (<ExpressionRef[]>operands).length : 0);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  createGetLocal(index: i32, type: NativeType): ExpressionRef {
    return _BinaryenGetLocal(this.ref, index, type);
  }

  createTeeLocal(index: i32, value: ExpressionRef): ExpressionRef {
    return _BinaryenTeeLocal(this.ref, index, value);
  }

  createGetGlobal(name: string, type: NativeType): ExpressionRef {
    var cStr = allocString(name);
    try {
      return _BinaryenGetGlobal(this.ref, cStr, type);
    } finally {
      free_memory(cStr);
    }
  }

  createLoad(bytes: Index, signed: bool, ptr: ExpressionRef, type: NativeType, offset: Index = 0): ExpressionRef {
    return _BinaryenLoad(this.ref, bytes, signed ? 1 : 0, offset, /* always aligned */ bytes, type, ptr);
  }

  createStore(bytes: Index, ptr: ExpressionRef, value: ExpressionRef, type: NativeType, offset: Index = 0): ExpressionRef {
    return _BinaryenStore(this.ref, bytes, offset, /* always aligned */ bytes, ptr, value, type);
  }

  createAtomicLoad(bytes: Index, ptr: ExpressionRef, type: NativeType, offset: Index = 0): ExpressionRef {
    return _BinaryenAtomicLoad(this.ref, bytes, offset, type, ptr);
  }

  createAtomicStore(bytes: Index, ptr: ExpressionRef, value: ExpressionRef, type: NativeType, offset: Index = 0): ExpressionRef {
    return _BinaryenAtomicStore(this.ref, bytes, offset, ptr, value, type);
  }

  createAtomicRMW(op: AtomicRMWOp, bytes: Index, offset: Index, ptr: ExpressionRef, value: ExpressionRef, type: NativeType): ExpressionRef {
    return _BinaryenAtomicRMW(this.ref, op, bytes, offset, ptr, value, type);
  }

  createAtomicCmpxchg(bytes: Index, offset: Index, ptr: ExpressionRef, expected: ExpressionRef, replacement: ExpressionRef, type: NativeType): ExpressionRef {
    return _BinaryenAtomicCmpxchg(this.ref, bytes, offset, ptr, expected, replacement, type);
  }

  createAtomicWait(ptr: ExpressionRef, expected: ExpressionRef, timeout: ExpressionRef, expectedType: NativeType): ExpressionRef {
    return _BinaryenAtomicWait(this.ref, ptr, expected, timeout, expectedType);
  }

  createAtomicWake(ptr: ExpressionRef, wakeCount: ExpressionRef): ExpressionRef {
    return _BinaryenAtomicWake(this.ref, ptr, wakeCount);
  }

  // statements

  createSetLocal(index: Index, value: ExpressionRef): ExpressionRef {
    return _BinaryenSetLocal(this.ref, index, value);
  }

  createSetGlobal(name: string, value: ExpressionRef): ExpressionRef {
    var cStr = allocString(name);
    try {
      return _BinaryenSetGlobal(this.ref, cStr, value);
    } finally {
      free_memory(cStr);
    }
  }

  createBlock(label: string | null, children: ExpressionRef[], type: NativeType = NativeType.Auto): ExpressionRef {
    var cStr = allocString(label);
    var cArr = allocI32Array(children);
    try {
      return _BinaryenBlock(this.ref, cStr, cArr, children.length, type);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  createBreak(label: string | null, condition: ExpressionRef = 0, value: ExpressionRef = 0): ExpressionRef {
    var cStr = allocString(label);
    try {
      return _BinaryenBreak(this.ref, cStr, condition, value);
    } finally {
      free_memory(cStr);
    }
  }

  createDrop(expression: ExpressionRef): ExpressionRef {
    return _BinaryenDrop(this.ref, expression);
  }

  createLoop(label: string | null, body: ExpressionRef): ExpressionRef {
    var cStr = allocString(label);
    try {
      return _BinaryenLoop(this.ref, cStr, body);
    } finally {
      free_memory(cStr);
    }
  }

  createIf(condition: ExpressionRef, ifTrue: ExpressionRef, ifFalse: ExpressionRef = 0): ExpressionRef {
    return _BinaryenIf(this.ref, condition, ifTrue, ifFalse);
  }

  createNop(): ExpressionRef {
    return _BinaryenNop(this.ref);
  }

  createReturn(expression: ExpressionRef = 0): ExpressionRef {
    return _BinaryenReturn(this.ref, expression);
  }

  createSelect(ifTrue: ExpressionRef, ifFalse: ExpressionRef, condition: ExpressionRef): ExpressionRef {
    return _BinaryenSelect(this.ref, condition, ifTrue, ifFalse);
  }

  createSwitch(names: string[], defaultName: string | null, condition: ExpressionRef, value: ExpressionRef = 0): ExpressionRef {
    var strs = new Array<usize>(names.length);
    for (var i = 0, k: i32 = names.length; i < k; ++i)
      strs[i] = allocString(names[i]);
    var cArr = allocI32Array(strs);
    var cStr = allocString(defaultName);
    try {
      return _BinaryenSwitch(this.ref, cArr, k, cStr, condition, value);
    } finally {
      free_memory(cStr);
      free_memory(cArr);
      for (i = k - 1; i >= 0; --i) free_memory(strs[i]);
    }
  }

  createCall(target: string, operands: ExpressionRef[] | null, returnType: NativeType): ExpressionRef {
    var cStr = allocString(target);
    var cArr = allocI32Array(operands);
    try {
      return _BinaryenCall(this.ref, cStr, cArr, operands && operands.length || 0, returnType);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  createCallImport(target: string, operands: ExpressionRef[] | null, returnType: NativeType): ExpressionRef {
    var cStr = allocString(target);
    var cArr = allocI32Array(operands);
    try {
      return _BinaryenCallImport(this.ref, cStr, cArr, operands && operands.length || 0, returnType);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  createUnreachable(): ExpressionRef {
    return _BinaryenUnreachable(this.ref);
  }

  // meta

  addGlobal(name: string, type: NativeType, mutable: bool, initializer: ExpressionRef): GlobalRef {
    var cStr = allocString(name);
    try {
      return _BinaryenAddGlobal(this.ref, cStr, type, mutable ? 1 : 0, initializer);
    } finally {
      free_memory(cStr);
    }
  }

  addFunction(name: string, type: FunctionTypeRef, varTypes: NativeType[], body: ExpressionRef): FunctionRef {
    var cStr = allocString(name);
    var cArr = allocI32Array(varTypes);
    try {
      return _BinaryenAddFunction(this.ref, cStr, type, cArr, varTypes.length, body);
    } finally {
      free_memory(cArr);
      free_memory(cStr);
    }
  }

  removeFunction(name: string): void {
    var cStr = allocString(name);
    try {
      _BinaryenRemoveFunction(this.ref, cStr);
    } finally {
      free_memory(cStr);
    }
  }

  addFunctionExport(internalName: string, externalName: string): ExportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalName);
    try {
      return _BinaryenAddFunctionExport(this.ref, cStr1, cStr2);
    } finally {
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addTableExport(internalName: string, externalName: string): ExportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalName);
    try {
      return _BinaryenAddTableExport(this.ref, cStr1, cStr2);
    } finally {
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addMemoryExport(internalName: string, externalName: string): ExportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalName);
    try {
      return _BinaryenAddMemoryExport(this.ref, cStr1, cStr2);
    } finally {
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addGlobalExport(internalName: string, externalName: string): ExportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalName);
    try {
      return _BinaryenAddGlobalExport(this.ref, cStr1, cStr2);
    } finally {
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  removeExport(externalName: string): void {
    var cStr = allocString(externalName);
    try {
      _BinaryenRemoveExport(this.ref, cStr);
    } finally {
      free_memory(cStr);
    }
  }

  addFunctionImport(internalName: string, externalModuleName: string, externalBaseName: string, functionType: FunctionTypeRef): ImportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalModuleName);
    var cStr3 = allocString(externalBaseName);
    try {
      return _BinaryenAddFunctionImport(this.ref, cStr1, cStr2, cStr3, functionType);
    } finally {
      free_memory(cStr3);
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addTableImport(internalName: string, externalModuleName: string, externalBaseName: string): ImportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalModuleName);
    var cStr3 = allocString(externalBaseName);
    try {
      return _BinaryenAddTableImport(this.ref, cStr1, cStr2, cStr3);
    } finally {
      free_memory(cStr3);
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addMemoryImport(internalName: string, externalModuleName: string, externalBaseName: string): ImportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalModuleName);
    var cStr3 = allocString(externalBaseName);
    try {
      return _BinaryenAddMemoryImport(this.ref, cStr1, cStr2, cStr3);
    } finally {
      free_memory(cStr3);
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  addGlobalImport(internalName: string, externalModuleName: string, externalBaseName: string, globalType: NativeType): ImportRef {
    var cStr1 = allocString(internalName);
    var cStr2 = allocString(externalModuleName);
    var cStr3 = allocString(externalBaseName);
    try {
      return _BinaryenAddGlobalImport(this.ref, cStr1, cStr2, cStr3, globalType);
    } finally {
      free_memory(cStr3);
      free_memory(cStr2);
      free_memory(cStr1);
    }
  }

  removeImport(internalName: string): void {
    var cStr = allocString(internalName);
    try {
      _BinaryenRemoveImport(this.ref, cStr);
    } finally {
      free_memory(cStr);
    }
  }

  setMemory(initial: Index, maximum: Index, segments: MemorySegment[], target: Target, exportName: string | null = null): void {
    var cStr = allocString(exportName);
    var k = segments.length;
    var segs = new Array<usize>(k);
    var offs = new Array<ExpressionRef>(k);
    var sizs = new Array<Index>(k);
    for (var i = 0; i < k; ++i) {
      var buffer = segments[i].buffer;
      var offset = segments[i].offset;
      segs[i] = allocU8Array(buffer);
      offs[i] = target == Target.WASM64
        ? this.createI64(offset.lo, offset.hi)
        : this.createI32(offset.toI32());
      sizs[i] = buffer.length;
    }
    var cArr1 = allocI32Array(segs);
    var cArr2 = allocI32Array(offs);
    var cArr3 = allocI32Array(sizs);
    try {
      _BinaryenSetMemory(this.ref, initial, maximum, cStr, cArr1, cArr2, cArr3, k);
    } finally {
      free_memory(cArr3);
      free_memory(cArr2);
      free_memory(cArr1);
      for (i = k - 1; i >= 0; --i) free_memory(segs[i]);
      free_memory(cStr);
    }
  }

  setFunctionTable(funcs: FunctionRef[]): void {
    var cArr = allocI32Array(funcs);
    try {
      _BinaryenSetFunctionTable(this.ref, cArr, funcs.length);
    } finally {
      free_memory(cArr);
    }
  }

  setStart(func: FunctionRef): void {
    _BinaryenSetStart(this.ref, func);
  }

  setOptimizeLevel(level: i32 = 2): void {
    _BinaryenSetOptimizeLevel(level);
  }

  setShrinkLevel(level: i32 = 1): void {
    _BinaryenSetShrinkLevel(level);
  }

  setDebugInfo(on: bool = false): void {
    _BinaryenSetDebugInfo(on);
  }

  optimize(func: FunctionRef = 0): void {
    if (func) {
      _BinaryenFunctionOptimize(func, this.ref);
    } else {
      _BinaryenModuleOptimize(this.ref);
    }
  }

  runPasses(passes: string[], func: FunctionRef = 0): void {
    var k = passes.length;
    var names = new Array<usize>(k);
    for (var i = 0; i < k; ++i)
      names[i] = allocString(passes[i]);
    var cArr = allocI32Array(names);
    try {
      if (func)
        _BinaryenFunctionRunPasses(func, this.ref, cArr, k);
      else
        _BinaryenModuleRunPasses(this.ref, cArr, k);
    } finally {
      free_memory(cArr);
      for (; i >= 0; --i) free_memory(names[i]);
    }
  }

  validate(): bool {
    return _BinaryenModuleValidate(this.ref) == 1;
  }

  interpret(): void {
    _BinaryenModuleInterpret(this.ref);
  }

  write(output: usize, outputSize: usize = 1048576): usize {
    return _BinaryenModuleWrite(this.ref, output, outputSize);
  }

  print(): void {
    _BinaryenModulePrint(this.ref);
  }

  printAsmjs(): void {
    _BinaryenModulePrintAsmjs(this.ref);
  }

  toBinary(bufferSize: usize = 1048576): Uint8Array {
    // FIXME: target specific / JS glue overrides this
    throw new Error("not implemented");
  }

  toText(): string {
    // FIXME: target specific / JS glue overrides this
    throw new Error("not implemented");
  }

  dispose(): void {
    if (!this.ref) return; // sic
    _BinaryenModuleDispose(this.ref);
    free_memory(changetype<usize>(this.lit));
  }

  createRelooper(): Relooper {
    return Relooper.create(this);
  }

  // currently supports side effect free expressions only
  cloneExpression(expr: ExpressionRef, noSideEffects: bool = false, maxDepth: i32 = i32.MAX_VALUE): ExpressionRef {
    if (maxDepth < 0)
      return 0;

    var nested1: ExpressionRef,
        nested2: ExpressionRef;

    switch (_BinaryenExpressionGetId(expr)) {

      case ExpressionId.Const:
        switch (_BinaryenExpressionGetType(expr)) {
          case NativeType.I32: return this.createI32(_BinaryenConstGetValueI32(expr));
          case NativeType.I64: return this.createI64(_BinaryenConstGetValueI64Low(expr), _BinaryenConstGetValueI64High(expr));
          case NativeType.F32: return this.createF32(_BinaryenConstGetValueF32(expr));
          case NativeType.F64: return this.createF64(_BinaryenConstGetValueF64(expr));
          default: throw new Error("concrete type expected");
        }

      case ExpressionId.GetLocal:
        return _BinaryenGetLocal(this.ref, _BinaryenGetLocalGetIndex(expr), _BinaryenExpressionGetType(expr));

      case ExpressionId.GetGlobal:
        var globalName = _BinaryenGetGlobalGetName(expr);
        if (!globalName)
          break;
        return _BinaryenGetGlobal(this.ref, globalName, _BinaryenExpressionGetType(expr));

      case ExpressionId.Load:
        if (!(nested1 = this.cloneExpression(_BinaryenLoadGetPtr(expr), noSideEffects, maxDepth - 1)))
          break;
        return _BinaryenLoadIsAtomic(expr)
          ? _BinaryenAtomicLoad(this.ref, _BinaryenLoadGetBytes(expr), _BinaryenLoadGetOffset(expr), _BinaryenExpressionGetType(expr), nested1)
          : _BinaryenLoad(this.ref, _BinaryenLoadGetBytes(expr), _BinaryenLoadIsSigned(expr) ? 1 : 0, _BinaryenLoadGetOffset(expr),  _BinaryenLoadGetAlign(expr), _BinaryenExpressionGetType(expr), nested1);

      case ExpressionId.Unary:
        if (!(nested1 = this.cloneExpression(_BinaryenUnaryGetValue(expr), noSideEffects, maxDepth - 1)))
          break;
        return _BinaryenUnary(this.ref, _BinaryenUnaryGetOp(expr), nested1);

      case ExpressionId.Binary:
        if (!(nested1 = this.cloneExpression(_BinaryenBinaryGetLeft(expr), noSideEffects, maxDepth - 1)))
          break;
        if (!(nested2 = this.cloneExpression(_BinaryenBinaryGetRight(expr), noSideEffects, maxDepth - 1)))
          break;
        return _BinaryenBinary(this.ref, _BinaryenBinaryGetOp(expr), nested1, nested2);
    }
    return 0;
  }
}

export class Relooper {

  module: Module;
  ref: RelooperRef;

  static create(module: Module): Relooper {
    var relooper = new Relooper();
    relooper.module = module;
    relooper.ref = _RelooperCreate();
      return relooper;
  }

  static createStub(module: Module): Relooper {
    var relooper = new Relooper();
    relooper.module = module;
    relooper.ref = 0;
    return relooper;
  }

  private constructor() {}

  addBlock(code: ExpressionRef): RelooperBlockRef {
    return _RelooperAddBlock(this.ref, code);
  }

  addBranch(from: RelooperBlockRef, to: RelooperBlockRef, condition: ExpressionRef = 0, code: ExpressionRef = 0): void {
    _RelooperAddBranch(from, to, condition, code);
  }

  addBlockWithSwitch(code: ExpressionRef, condition: ExpressionRef): RelooperBlockRef {
    return _RelooperAddBlockWithSwitch(this.ref, code, condition);
  }

  addBranchForSwitch(from: RelooperBlockRef, to: RelooperBlockRef, indexes: i32[], code: ExpressionRef = 0): void {
    var cArr = allocI32Array(indexes);
    try {
      _RelooperAddBranchForSwitch(from, to, cArr, indexes.length, code);
    } finally {
      free_memory(cArr);
    }
  }

  renderAndDispose(entry: RelooperBlockRef, labelHelper: Index): ExpressionRef {
    return _RelooperRenderAndDispose(this.ref, entry, labelHelper, this.module.ref);
  }
}

// helpers
// can't do stack allocation here: STACKTOP is a global in WASM but a hidden variable in asm.js

function allocU8Array(u8s: Uint8Array | null): usize {
  if (!u8s) return 0;
  var ptr = allocate_memory(u8s.length);
  var idx = ptr;
  for (var i = 0, k = u8s.length; i < k; ++i)
    store<u8>(idx++, u8s[i]);
  return ptr;
}

function allocI32Array(i32s: i32[] | null): usize {
  if (!i32s) return 0;
  var ptr = allocate_memory(i32s.length << 2);
  var idx = ptr;
  for (var i = 0, k = i32s.length; i < k; ++i) {
    var val = i32s[i];
    // store<i32>(idx, val) is not portable
    store<u8>(idx    , ( val         & 0xff) as u8);
    store<u8>(idx + 1, ((val >>   8) & 0xff) as u8);
    store<u8>(idx + 2, ((val >>  16) & 0xff) as u8);
    store<u8>(idx + 3, ( val >>> 24        ) as u8);
    idx += 4;
  }
  return ptr;
}

function stringLengthUTF8(str: string): usize {
  var len = 0;
  for (var i = 0, k = str.length; i < k; ++i) {
    var u = str.charCodeAt(i);
    if (u >= 0xD800 && u <= 0xDFFF && i + 1 < k)
      u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    if (u <= 0x7F)
      ++len;
    else if (u <= 0x7FF)
      len += 2;
    else if (u <= 0xFFFF)
      len += 3;
    else if (u <= 0x1FFFFF)
      len += 4;
    else if (u <= 0x3FFFFFF)
      len += 5;
    else
      len += 6;
  }
  return len;
}

function allocString(str: string | null): usize {
  if (str == null) return 0;
  var ptr = allocate_memory(stringLengthUTF8(str) + 1);
  var idx = ptr;
  for (var i = 0, k = str.length; i < k; ++i) {
    var u = str.charCodeAt(i);
    if (u >= 0xD800 && u <= 0xDFFF && i + 1 < k)
      u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    if (u <= 0x7F)
      store<u8>(idx++, u as u8);
    else if (u <= 0x7FF) {
      store<u8>(idx++, (0xC0 |  (u >>> 6)       ) as u8);
      store<u8>(idx++, (0x80 | ( u         & 63)) as u8);
    } else if (u <= 0xFFFF) {
      store<u8>(idx++, (0xE0 |  (u >>> 12)      ) as u8);
      store<u8>(idx++, (0x80 | ((u >>>  6) & 63)) as u8);
      store<u8>(idx++, (0x80 | ( u         & 63)) as u8);
    } else if (u <= 0x1FFFFF) {
      store<u8>(idx++, (0xF0 |  (u >>> 18)      ) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 12) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>>  6) & 63)) as u8);
      store<u8>(idx++, (0x80 | ( u         & 63)) as u8);
    } else if (u <= 0x3FFFFFF) {
      store<u8>(idx++, (0xF8 |  (u >>> 24)      ) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 18) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 12) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>>  6) & 63)) as u8);
      store<u8>(idx++, (0x80 | ( u         & 63)) as u8);
    } else {
      store<u8>(idx++, (0xFC |  (u >>> 30)      ) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 24) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 18) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>> 12) & 63)) as u8);
      store<u8>(idx++, (0x80 | ((u >>>  6) & 63)) as u8);
      store<u8>(idx++, (0x80 | ( u         & 63)) as u8);
    }
  }
  store<u8>(idx, 0);
  return ptr;
}

export function readString(ptr: usize): string | null {
  if (!ptr) return null;
  var arr = new Array<i32>();
  // the following is based on Emscripten's UTF8ArrayToString
  var cp: u32;
  var u1: u32, u2: u32, u3: u32, u4: u32, u5: u32;
  while (cp = load<u8>(ptr++)) {
    if (!(cp & 0x80)) {
      arr.push(cp);
      continue;
    }
    u1 = load<u8>(ptr++) & 63;
    if ((cp & 0xE0) == 0xC0) {
      arr.push(((cp & 31) << 6) | u1);
      continue;
    }
    u2 = load<u8>(ptr++) & 63;
    if ((cp & 0xF0) == 0xE0) {
      cp = ((cp & 15) << 12) | (u1 << 6) | u2;
    } else {
      u3 = load<u8>(ptr++) & 63;
      if ((cp & 0xF8) == 0xF0) {
        cp = ((cp & 7) << 18) | (u1 << 12) | (u2 << 6) | u3;
      } else {
        u4 = load<u8>(ptr++) & 63;
        if ((cp & 0xFC) == 0xF8) {
          cp = ((cp & 3) << 24) | (u1 << 18) | (u2 << 12) | (u3 << 6) | u4;
        } else {
          u5 = load<u8>(ptr++) & 63;
          cp = ((cp & 1) << 30) | (u1 << 24) | (u2 << 18) | (u3 << 12) | (u4 << 6) | u5;
        }
      }
    }
    // if (cp < 0x10000) {
    //   arr.push(cp);
    // } else {
    //   var ch = cp - 0x10000;
    //   arr.push(0xD800 | (ch >> 10));
    //   arr.push(0xDC00 | (ch & 0x3FF));
    // }
  }
  // return String.fromCharCodes(arr);
  return String.fromCodePoints(arr);
}
