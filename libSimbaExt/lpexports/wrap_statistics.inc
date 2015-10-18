{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2014, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
 
 Wrap all numeric methods (related to number arrays: Numeric.pas) .
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
var _____F: Extended; _____I: Int64;


//sum
function exp_SumA_u8(var SE:Pointer; const Arr: TU8Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 1, False); end;

function exp_SumA_s8(var SE:Pointer; const Arr: TS8Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 1, True); end;

function exp_SumA_u16(var SE:Pointer; const Arr: TU16Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 2, False); end;

function exp_SumA_s16(var SE:Pointer; const Arr: TS16Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 2, True); end;

function exp_SumA_u32(var SE:Pointer; const Arr: TU32Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 4, False); end;

function exp_SumA_s32(var SE:Pointer; const Arr: TS32Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 4, True); end;

function exp_SumA_u64(var SE:Pointer; const Arr: TU64Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 8, False); end;

function exp_SumA_s64(var SE:Pointer; const Arr: TS64Array): Int64; Cdecl;
begin Result := Statistics.SumPtr(Pointer(Arr), 8, True); end;

function exp_SumA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.SumFPtr(Pointer(Arr), 4); end;

function exp_SumA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.SumFPtr(Pointer(Arr), 8); end;

function exp_SumA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.SumFPtr(Pointer(Arr), 10); end;



//MinMax
procedure exp_MinMaxA_u8(var SE:Pointer; const Arr: TU8Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, False, Min,Max); end;

procedure exp_MinMaxA_s8(var SE:Pointer; const Arr: TS8Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, True, Min,Max); end;

procedure exp_MinMaxA_u16(var SE:Pointer; const Arr: TU16Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, False, Min,Max); end;

procedure exp_MinMaxA_s16(var SE:Pointer; const Arr: TS16Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, True, Min,Max); end;

procedure exp_MinMaxA_u32(var SE:Pointer; const Arr: TU32Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, False, Min,Max); end;

procedure exp_MinMaxA_s32(var SE:Pointer; const Arr: TS32Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, True, Min,Max); end;

procedure exp_MinMaxA_u64(var SE:Pointer; const Arr: TU64Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, False, Min,Max); end;

procedure exp_MinMaxA_s64(var SE:Pointer; const Arr: TS64Array; var Min,Max:Int64); Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, True, Min,Max); end;

procedure exp_MinMaxA_f32(var SE:Pointer; const Arr: TFloatArray; var Min,Max:Extended); Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 4, Min,Max); end;

procedure exp_MinMaxA_f64(var SE:Pointer; const Arr: TDoubleArray; var Min,Max:Extended); Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 8, Min,Max); end;

procedure exp_MinMaxA_f80(var SE:Pointer; const Arr: TExtArray; var Min,Max:Extended); Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 10, Min,Max); end;


//min
function exp_MinA_u8(var SE:Pointer; const Arr: TU8Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, False, Result,_____I); end;

function exp_MinA_s8(var SE:Pointer; const Arr: TS8Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, True, Result,_____I); end;

function exp_MinA_u16(var SE:Pointer; const Arr: TU16Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, False, Result,_____I); end;

function exp_MinA_s16(var SE:Pointer; const Arr: TS16Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, True, Result,_____I); end;

function exp_MinA_u32(var SE:Pointer; const Arr: TU32Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, False, Result,_____I); end;

function exp_MinA_s32(var SE:Pointer; const Arr: TS32Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, True, Result,_____I); end;

function exp_MinA_u64(var SE:Pointer; const Arr: TU64Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, False, Result,_____I); end;

function exp_MinA_s64(var SE:Pointer; const Arr: TS64Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, True, Result,_____I); end;

function exp_MinA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 4, Result, _____F); end;

function exp_MinA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 8, Result, _____F); end;

function exp_MinA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 10, Result, _____F); end;


//max
function exp_MaxA_u8(var SE:Pointer; const Arr: TU8Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, False, _____I, Result); end;

function exp_MaxA_s8(var SE:Pointer; const Arr: TS8Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 1, True, _____I, Result); end;

function exp_MaxA_u16(var SE:Pointer; const Arr: TU16Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, False, _____I, Result); end;

function exp_MaxA_s16(var SE:Pointer; const Arr: TS16Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 2, True, _____I, Result); end;

function exp_MaxA_u32(var SE:Pointer; const Arr: TU32Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, False, _____I, Result); end;

function exp_MaxA_s32(var SE:Pointer; const Arr: TS32Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 4, True, _____I, Result); end;

function exp_MaxA_u64(var SE:Pointer; const Arr: TU64Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, False, _____I, Result); end;

function exp_MaxA_s64(var SE:Pointer; const Arr: TS64Array): Int64; Cdecl;
begin Statistics.MinMaxPtr(Pointer(Arr), 8, True, _____I, Result); end;

function exp_MaxA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 4, _____F, Result); end;

function exp_MaxA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 8, _____F, Result); end;

function exp_MaxA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Statistics.MinMaxFPtr(Pointer(Arr), 10, _____F, Result); end;



//mean
function exp_MeanA_u8(var SE:Pointer; const Arr: TU8Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 1, False); end;

function exp_MeanA_s8(var SE:Pointer; const Arr: TS8Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 1, True); end;

function exp_MeanA_u16(var SE:Pointer; const Arr: TU16Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 2, False); end;

function exp_MeanA_s16(var SE:Pointer; const Arr: TS16Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 2, True); end;

function exp_MeanA_u32(var SE:Pointer; const Arr: TU32Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 4, False); end;

function exp_MeanA_s32(var SE:Pointer; const Arr: TS32Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 4, True); end;

function exp_MeanA_u64(var SE:Pointer; const Arr: TU64Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 8, False); end;

function exp_MeanA_s64(var SE:Pointer; const Arr: TS64Array): Extended; Cdecl;
begin Result := Statistics.MeanPtr(Pointer(Arr), 8, True); end;

function exp_MeanA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.MeanFPtr(Pointer(Arr), 4); end;

function exp_MeanA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.MeanFPtr(Pointer(Arr), 8); end;

function exp_MeanA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.MeanFPtr(Pointer(Arr), 10); end;


//variance
function exp_VarianceA_u8(var SE:Pointer; const Arr: TU8Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 1, False); end;

function exp_VarianceA_s8(var SE:Pointer; const Arr: TS8Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 1, True); end;

function exp_VarianceA_u16(var SE:Pointer; const Arr: TU16Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 2, False); end;

function exp_VarianceA_s16(var SE:Pointer; const Arr: TS16Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 2, True); end;

function exp_VarianceA_u32(var SE:Pointer; const Arr: TU32Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 4, False); end;

function exp_VarianceA_s32(var SE:Pointer; const Arr: TS32Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 4, True); end;

function exp_VarianceA_u64(var SE:Pointer; const Arr: TU64Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 8, False); end;

function exp_VarianceA_s64(var SE:Pointer; const Arr: TS64Array): Extended; Cdecl;
begin Result := Statistics.VariancePtr(Pointer(Arr), 8, True); end;

function exp_VarianceA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.VarianceFPtr(Pointer(Arr), 4); end;

function exp_VarianceA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.VarianceFPtr(Pointer(Arr), 8); end;

function exp_VarianceA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.VarianceFPtr(Pointer(Arr), 10); end;



//stdev
function exp_StdevA_u8(var SE:Pointer; const Arr: TU8Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 1, False); end;

function exp_StdevA_s8(var SE:Pointer; const Arr: TS8Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 1, True); end;

function exp_StdevA_u16(var SE:Pointer; const Arr: TU16Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 2, False); end;

function exp_StdevA_s16(var SE:Pointer; const Arr: TS16Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 2, True); end;

function exp_StdevA_u32(var SE:Pointer; const Arr: TU32Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 4, False); end;

function exp_StdevA_s32(var SE:Pointer; const Arr: TS32Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 4, True); end;

function exp_StdevA_u64(var SE:Pointer; const Arr: TU64Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 8, False); end;

function exp_StdevA_s64(var SE:Pointer; const Arr: TS64Array): Extended; Cdecl;
begin Result := Statistics.StdevPtr(Pointer(Arr), 8, True); end;

function exp_StdevA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.StdevFPtr(Pointer(Arr), 4); end;

function exp_StdevA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.StdevFPtr(Pointer(Arr), 8); end;

function exp_StdevA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.StdevFPtr(Pointer(Arr), 10); end;


//mode
function exp_ModeA_u8(var SE:Pointer; const Arr: TU8Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 1, False); end;

function exp_ModeA_s8(var SE:Pointer; const Arr: TS8Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 1, True); end;

function exp_ModeA_u16(var SE:Pointer; const Arr: TU16Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 2, False); end;

function exp_ModeA_s16(var SE:Pointer; const Arr: TS16Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 2, True); end;

function exp_ModeA_u32(var SE:Pointer; const Arr: TU32Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 4, False); end;

function exp_ModeA_s32(var SE:Pointer; const Arr: TS32Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 4, True); end;

function exp_ModeA_u64(var SE:Pointer; const Arr: TU64Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 8, False); end;

function exp_ModeA_s64(var SE:Pointer; const Arr: TS64Array): Int64; Cdecl;
begin Result := Statistics.ModePtr(Pointer(Arr), 8, True); end;

function exp_ModeA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.ModeFPtr(Pointer(Arr), 4); end;

function exp_ModeA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.ModeFPtr(Pointer(Arr), 8); end;

function exp_ModeA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.ModeFPtr(Pointer(Arr), 10); end;


//median
function exp_MedianA_u8(var SE:Pointer; const Arr: TU8Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 1, False); end;

function exp_MedianA_s8(var SE:Pointer; const Arr: TS8Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 1, True); end;

function exp_MedianA_u16(var SE:Pointer; const Arr: TU16Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 2, False); end;

function exp_MedianA_s16(var SE:Pointer; const Arr: TS16Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 2, True); end;

function exp_MedianA_u32(var SE:Pointer; const Arr: TU32Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 4, False); end;

function exp_MedianA_s32(var SE:Pointer; const Arr: TS32Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 4, True); end;

function exp_MedianA_u64(var SE:Pointer; const Arr: TU64Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 8, False); end;

function exp_MedianA_s64(var SE:Pointer; const Arr: TS64Array): Extended; Cdecl;
begin Result := Statistics.MedianPtr(Pointer(Arr), 8, True); end;

function exp_MedianA_f32(var SE:Pointer; const Arr: TFloatArray): Extended; Cdecl;
begin Result := Statistics.MedianFPtr(Pointer(Arr), 4); end;

function exp_MedianA_f64(var SE:Pointer; const Arr: TDoubleArray): Extended; Cdecl;
begin Result := Statistics.MedianFPtr(Pointer(Arr), 8); end;

function exp_MedianA_f80(var SE:Pointer; const Arr: TExtArray): Extended; Cdecl;
begin Result := Statistics.MedianFPtr(Pointer(Arr), 10); end;


//combos
function exp_TIACombinations(var SE:Pointer; const Arr: TIntArray; Seq:Integer): T2DIntArray; cdecl;
begin Result := TIACombinations(Arr, Seq); end;

function exp_TEACombinations(var SE:Pointer; const Arr: TExtArray; Seq:Integer): T2DExtArray; cdecl;
begin Result := TEACombinations(Arr, Seq); end;