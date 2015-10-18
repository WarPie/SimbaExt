unit MatrixOps;
{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2013, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
{$mode objfpc}{$H+}
{$macro on}
interface

uses CoreTypes, SysUtils;

procedure FillMatrix(var Mat:T2DByteArray; Area:TBox; Fill:UInt8); overload;
procedure FillMatrix(var Mat:T2DIntArray; Area:TBox; Fill:Int32); overload;
procedure FillMatrix(var Mat:T2DFloatArray; Area:TBox; Fill:Single); overload;
procedure FillMatrix(var Mat:T2DDoubleArray; Area:TBox; Fill:Double); overload;
procedure FillMatrix(var Mat:T2DExtArray; Area:TBox; Fill:Extended); overload;

procedure FillMatrix(var Mat:T2DByteArray; Fill:UInt8); overload;
procedure FillMatrix(var Mat:T2DIntArray; Fill:Int32); overload;
procedure FillMatrix(var Mat:T2DFloatArray; Fill:Single); overload;
procedure FillMatrix(var Mat:T2DDoubleArray; Fill:Double); overload;
procedure FillMatrix(var Mat:T2DExtArray; Fill:Extended); overload;

function ArgMax(Mat: T2DByteArray): TPoint; overload;
function ArgMax(Mat: T2DIntArray): TPoint; overload;
function ArgMax(Mat: T2DExtArray): TPoint; overload;
function ArgMax(Mat: T2DDoubleArray): TPoint; overload;
function ArgMax(Mat: T2DFloatArray): TPoint; overload;

function ArgMin(Mat: T2DByteArray): TPoint; overload;
function ArgMin(Mat: T2DIntArray): TPoint; overload;
function ArgMin(Mat: T2DExtArray): TPoint; overload;
function ArgMin(Mat: T2DDoubleArray): TPoint; overload;
function ArgMin(Mat: T2DFloatArray): TPoint; overload;

function ArgMax(Mat: T2DByteArray; B: TBox): TPoint; overload;
function ArgMax(Mat: T2DIntArray; B: TBox): TPoint; overload;
function ArgMax(Mat: T2DExtArray; B: TBox): TPoint; overload;
function ArgMax(Mat: T2DDoubleArray; B: TBox): TPoint; overload;
function ArgMax(Mat: T2DFloatArray; B: TBox): TPoint; overload;

function ArgMin(Mat: T2DByteArray; B: TBox): TPoint; overload;
function ArgMin(Mat: T2DIntArray; B: TBox): TPoint; overload;
function ArgMin(Mat: T2DExtArray; B: TBox): TPoint; overload;
function ArgMin(Mat: T2DDoubleArray; B: TBox): TPoint; overload;
function ArgMin(Mat: T2DFloatArray; B: TBox): TPoint; overload;


function Indices(const Mat: T2DByteArray; B: TBox; Value: byte; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DIntArray; B: TBox; Value: integer; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DExtArray; B: TBox; Value: extended; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DDoubleArray; B: TBox; Value: double; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DFloatArray; B: TBox; Value: single; const Comparator: EComparator): TPointArray; overload;

function Indices(const Mat: T2DByteArray; Value: byte; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DIntArray; Value: integer; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DExtArray; Value: extended; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DDoubleArray; Value: double; const Comparator: EComparator): TPointArray; overload;
function Indices(const Mat: T2DFloatArray; Value: single; const Comparator: EComparator): TPointArray; overload;


procedure MinMax(Mat: T2DByteArray; var Min, Max: byte); overload;
procedure MinMax(Mat: T2DIntArray; var Min, Max: integer); overload;
procedure MinMax(Mat: T2DExtArray; var Min, Max: extended); overload;
procedure MinMax(Mat: T2DDoubleArray; var Min, Max: double); overload;
procedure MinMax(Mat: T2DFloatArray; var Min, Max: single); overload;


function VarMulti(Mat: T2DByteArray; Count: Int32; HiLo: boolean): CoreTypes.TByteArray; overload;
function VarMulti(Mat: T2DIntArray; Count: Int32; HiLo: boolean): TIntArray; overload;
function VarMulti(Mat: T2DExtArray; Count: Int32; HiLo: boolean): TExtArray; overload;
function VarMulti(Mat: T2DDoubleArray; Count: Int32; HiLo: boolean): TDoubleArray; overload;
function VarMulti(Mat: T2DFloatArray; Count: Int32; HiLo: boolean): TFloatArray; overload;


function ArgMulti(Mat:T2DByteArray; Count:Int32; HiLo:Boolean): TPointArray; overload;
function ArgMulti(Mat:T2DIntArray; Count:Int32; HiLo:Boolean): TPointArray; overload;
function ArgMulti(Mat:T2DExtArray; Count:Int32; HiLo:Boolean): TPointArray; overload;
function ArgMulti(Mat:T2DDoubleArray; Count:Int32; HiLo:Boolean): TPointArray; overload;
function ArgMulti(Mat:T2DFloatArray; Count:Int32; HiLo:Boolean): TPointArray; overload;


function CombineMatrix(Mat1:T2DByteArray; Mat2:T2DByteArray; OP:Char): T2DByteArray; overload;
function CombineMatrix(Mat1:T2DIntArray; Mat2:T2DIntArray; OP:Char): T2DIntArray; overload;
function CombineMatrix(Mat1:T2DFloatArray; Mat2:T2DFloatArray; OP:Char): T2DFloatArray; overload;
function CombineMatrix(Mat1:T2DDoubleArray; Mat2:T2DDoubleArray; OP:Char): T2DDoubleArray; overload;
function CombineMatrix(Mat1:T2DExtArray; Mat2:T2DExtArray; OP:Char): T2DExtArray; overload;


function GetValues(const Mat:T2DByteArray; const indices:TPointArray): CoreTypes.TByteArray; overload;
function GetValues(const Mat:T2DIntArray; const indices:TPointArray): TIntArray; overload;
function GetValues(const Mat:T2DFloatArray; const indices:TPointArray): TFloatArray; overload;
function GetValues(const Mat:T2DDoubleArray; const indices:TPointArray): TDoubleArray; overload;
function GetValues(const Mat:T2DExtArray; const indices:TPointArray): TExtArray; overload;


procedure PutValues(var Matrix:T2DByteArray; const indices:TPointArray; Values:CoreTypes.TByteArray); 
procedure PutValues(var Matrix:T2DIntArray; const indices:TPointArray; Values:TIntArray); overload;
procedure PutValues(var Matrix:T2DFloatArray; const indices:TPointArray; Values:TFloatArray); overload;
procedure PutValues(var Matrix:T2DDoubleArray; const indices:TPointArray; Values:TDoubleArray); overload;
procedure PutValues(var Matrix:T2DExtArray; const indices:TPointArray; Values:TExtArray); overload;


function Normalize(const Mat:T2DByteArray; Alpha,Beta:Single): T2DFloatArray; overload;
function Normalize(const Mat:T2DIntArray; Alpha,Beta:Double): T2DDoubleArray; overload;
function Normalize(const Mat:T2DFloatArray; Alpha,Beta:Single): T2DFloatArray; overload;
function Normalize(const Mat:T2DDoubleArray; Alpha,Beta:Double): T2DDoubleArray; overload;
function Normalize(const Mat:T2DExtArray; Alpha,Beta:Extended): T2DExtArray; overload;


function GetArea(const Mat:T2DByteArray; x1,y1,x2,y2:Int32): T2DByteArray; overload;
function GetArea(const Mat:T2DIntArray; x1,y1,x2,y2:Int32): T2DIntArray; overload;
function GetArea(const Mat:T2DFloatArray; x1,y1,x2,y2:Int32): T2DFloatArray; overload;
function GetArea(const Mat:T2DDoubleArray; x1,y1,x2,y2:Int32): T2DDoubleArray; overload;
function GetArea(const Mat:T2DExtArray; x1,y1,x2,y2:Int32): T2DExtArray; overload;


function GetCols(const Mat:T2DByteArray; FromCol, ToCol:Int32): T2DByteArray; overload;
function GetCols(const Mat:T2DIntArray; FromCol, ToCol:Int32): T2DIntArray; overload;
function GetCols(const Mat:T2DFloatArray; FromCol, ToCol:Int32): T2DFloatArray; overload;
function GetCols(const Mat:T2DDoubleArray; FromCol, ToCol:Int32): T2DDoubleArray; overload;
function GetCols(const Mat:T2DExtArray; FromCol, ToCol:Int32): T2DExtArray; overload;


function GetRows(const Mat:T2DByteArray; FromRow, ToRow:Int32): T2DByteArray; overload;
function GetRows(const Mat:T2DIntArray; FromRow, ToRow:Int32): T2DIntArray; overload;
function GetRows(const Mat:T2DFloatArray; FromRow, ToRow:Int32): T2DFloatArray; overload;
function GetRows(const Mat:T2DDoubleArray; FromRow, ToRow:Int32): T2DDoubleArray; overload;
function GetRows(const Mat:T2DExtArray; FromRow, ToRow:Int32): T2DExtArray; overload;


function FlipMat(const Mat:T2DByteArray): T2DByteArray; overload;
function FlipMat(const Mat:T2DIntArray): T2DIntArray; overload;
function FlipMat(const Mat:T2DFloatArray): T2DFloatArray; overload;
function FlipMat(const Mat:T2DDoubleArray): T2DDoubleArray; overload;
function FlipMat(const Mat:T2DExtArray): T2DExtArray; overload;


function CumSum(constref Mat:T2DByteArray; axis:Int8): T2DIntArray; overload;
function CumSum(constref Mat:T2DIntArray; axis:Int8): T2DIntArray; overload;
function CumSum(constref Mat:T2DFloatArray; axis:Int8): T2DFloatArray; overload;
function CumSum(constref Mat:T2DDoubleArray; axis:Int8): T2DDoubleArray; overload;
function CumSum(constref Mat:T2DExtArray; axis:Int8): T2DExtArray; overload;


function Pad(constref Mat:T2DByteArray; Pre, Post:TPoint): T2DByteArray; overload;
function Pad(constref Mat:T2DIntArray; Pre, Post:TPoint): T2DIntArray; overload;
function Pad(constref Mat:T2DFloatArray; Pre, Post:TPoint): T2DFloatArray; overload;
function Pad(constref Mat:T2DDoubleArray; Pre, Post:TPoint): T2DDoubleArray; overload;
function Pad(constref Mat:T2DExtArray; Pre, Post:TPoint): T2DExtArray; overload;


//-----------------------------------------------------------------------
implementation

uses
  Math, CoreMath, CoreMisc,
  PointList, SimpleHeap, MatrixMath,
  BoxTools, ExceptionMgr,
  ThreadPool;

{$I Matrix/_FillMatrix.pas}
{$I Matrix/_ArgMinMax.pas}
{$I Matrix/_MinMax.pas}
{$I Matrix/_indices.pas}
{$I Matrix/_VarMulti.pas}
{$I Matrix/_ArgMulti.pas}
{$I Matrix/_Combine.pas}
{$I Matrix/_GetValues.pas}
{$I Matrix/_PutValues.pas}
{$I Matrix/_Normalize.pas}
{$I Matrix/_GetArea.pas}
{$I Matrix/_GetCols.pas}
{$I Matrix/_GetRows.pas}
{$I Matrix/_Flip.pas}
{$I Matrix/_CumSum.pas}
{$I Matrix/_PadMatrix.pas}

end.
