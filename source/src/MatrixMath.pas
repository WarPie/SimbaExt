unit MatrixMath;
{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2013, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
(*
 Defines a set of operators used on matrices.
 // Casts
 > ToFloat - Byte, Int, Extended. (line 300-350)           ||  FloatMatrix := ToFloat(Matrix)

 // Operators:                                      || Mat op Mat | Mat op Number | Number op Mat
 > MUL = Extended, Double, Single, Integer, Byte    || YES        | YES           | PARTIAL (DOUBLE/FLOAT)
 > ADD = Extended, Double, Single, Integer, Byte    || YES        | YES           | YES
 > SUB = Extended, Double, Single, Integer, Byte    || YES        | YES           | YES
 > DIV = Extended, Double, Single, Integer, Byte    || YES        | YES           | PARTIAL (DOUBLE/FLOAT)
 > POW = Extended, Double, Single, Integer, Byte    || NO         | YES           | NO

 // Functions
 > SQRT   = Extended, Double, Single, Integer, Byte  @ Equal result as Matrix**0.5            ||  Matrix := Sqrt(Matrix)
 > SQR    = Extended, Double, Single, Integer, Byte  @ Equal result as Matrix**2              ||  Matrix := Sqr(Matrix)
 > ARCTAN = Extended, Double, Single, Integer, Byte  @ Equal result as Sqrt(Sqr(L) + Sqr(R))  ||  Matrix := ArcTan(Matrix)
 > HYPOT  = Extended, Double, Single, Integer, Byte  @ Not working with Hypot(Matrix,Number)  ||  Matrix := Hypot(Matrix1, Matrix2)
 > Round(To)/(f)Ceil/(f)Trunc/(f)Floor = Extended & Single (line 3430-3625)                   ||  Matrix := Trunc(Matrix)
*)
{$mode objfpc}{$H+}
{$macro on}
{$inline on}

interface

uses SysUtils, XT_Types, Math;

type
  T2DExt   = T2DExtArray;
  T2DFloat = T2DFloatArray;
  T2DDouble= T2DDoubleArray;
  T2DInt   = T2DIntArray;
  T2DByte  = T2DByteArray;

// Casting
function ToFloat(const mat:T2DByteArray): T2DFloatArray; overload;
function ToFloat(const mat:T2DIntArray): T2DFloatArray; overload;
function ToFloat(const mat:T2DDoubleArray): T2DFloatArray; overload;
function ToFloat(const mat:T2DExtArray): T2DFloatArray; overload;
function ToDouble(const mat:T2DByteArray): T2DDoubleArray; overload;
function ToDouble(const mat:T2DIntArray): T2DDoubleArray; overload;
function ToDouble(const mat:T2DFloatArray): T2DDoubleArray; overload;
function ToDouble(const mat:T2DExtArray): T2DDoubleArray; overload;
function ToExtended(const mat:T2DByteArray): T2DExtArray; overload;
function ToExtended(const mat:T2DIntArray): T2DExtArray; overload;
function ToExtended(const mat:T2DFloatArray): T2DExtArray; overload;
function ToExtended(const mat:T2DDoubleArray): T2DExtArray; overload;


// Multiplication: x * y
Operator * (l: T2DFloat; r: T2DFloat): T2DFloat; 
Operator * (l: T2DInt; r: T2DFloat): T2DFloat; 
Operator * (l: T2DFloat; r: T2DInt): T2DFloat; 
Operator * (l: T2DFloat; r: T2DByte): T2DFloat; 
Operator * (l: T2DByte; r: T2DFloat): T2DFloat; 
Operator * (l: T2DFloat; r: Integer): T2DFloat; 
Operator * (l: T2DFloat; r: Single): T2DFloat;
Operator * (l: T2DFloat; r: Double): T2DFloat;
Operator * (l: T2DFloat; r: Extended): T2DExt;
Operator * (l: T2DFloat; r: Byte): T2DFloat; 
Operator * (l: Integer; r: T2DFloat): T2DFloat;
Operator * (l: Byte; r: T2DFloat): T2DFloat;
Operator * (l: Single; r: T2DFloat): T2DFloat;
Operator * (l: Double; r: T2DFloat): T2DDouble;
Operator * (l: Extended; r: T2DFloat): T2DExt;
Operator * (l: T2DExt; r: T2DExt): T2DExt; 
Operator * (l: T2DFloat; r: T2DExt): T2DExt; 
Operator * (l: T2DExt; r: T2DFloat): T2DExt;
Operator * (l: T2DInt; r: T2DExt): T2DExt; 
Operator * (l: T2DExt; r: T2DInt): T2DExt; 
Operator * (l: T2DExt; r: T2DByte): T2DExt; 
Operator * (l: T2DByte; r: T2DExt): T2DExt; 
Operator * (l: T2DExt; r: Integer): T2DExt; 
Operator * (l: T2DExt; r: Extended): T2DExt; 
Operator * (l: T2DExt; r: Single): T2DExt; 
Operator * (l: T2DExt; r: Double): T2DExt; 
Operator * (l: T2DExt; r: Byte): T2DExt;
Operator * (l: T2DInt; r: T2DInt): T2DInt;
Operator * (l: T2DByte; r: T2DByte): T2DInt;
Operator * (l: T2DInt; r: T2DByte): T2DByte;
Operator * (l: T2DByte; r: T2DInt): T2DInt;
Operator * (l: T2DInt; r: Integer): T2DInt;
Operator * (l: T2DInt; r: Byte): T2DInt;
Operator * (l: T2DInt; r: Single): T2DFloat;
Operator * (l: T2DInt; r: Double): T2DDouble;
Operator * (l: T2DInt; r: Extended): T2DExt;
Operator * (l: T2DDouble; r: T2DDouble): T2DDouble; 
Operator * (l: T2DDouble; r: T2DFloat): T2DDouble; 
Operator * (l: T2DFloat; r: T2DDouble): T2DDouble; 
Operator * (l: T2DInt; r: T2DDouble): T2DDouble; 
Operator * (l: T2DDouble; r: T2DInt): T2DDouble; 
Operator * (l: T2DDouble; r: T2DByte): T2DDouble; 
Operator * (l: T2DByte; r: T2DDouble): T2DDouble; 
Operator * (l: T2DDouble; r: Integer): T2DDouble; 
Operator * (l: T2DDouble; r: Single): T2DDouble;
Operator * (l: T2DDouble; r: Double): T2DDouble;
Operator * (l: T2DDouble; r: Extended): T2DExt;
Operator * (l: T2DDouble; r: Byte): T2DDouble; 
Operator * (l: Byte; r: T2DDouble): T2DDouble;
Operator * (l: Integer; r: T2DDouble): T2DDouble;
Operator * (l: Single; r: T2DDouble): T2DDouble;
Operator * (l: Double; r: T2DExt): T2DDouble;
Operator * (l: Extended; r: T2DDouble): T2DExt;

// Addition: x + y
Operator + (l: T2DFloat; r: T2DFloat): T2DFloat;
Operator + (l: T2DInt; r: T2DFloat): T2DFloat;
Operator + (l: T2DFloat; r: T2DInt): T2DFloat;
Operator + (l: T2DFloat; r: T2DByte): T2DFloat;
Operator + (l: T2DByte; r: T2DFloat): T2DFloat;
Operator + (l: T2DFloat; r: Integer): T2DFloat;
Operator + (l: T2DFloat; r: Single): T2DFloat;
Operator + (l: T2DFloat; r: Double): T2DDouble;
Operator + (l: T2DFloat; r: Extended): T2DExt;
Operator + (l: T2DFloat; r: Byte): T2DFloat;
Operator + (l: Integer; r: T2DFloat): T2DFloat;
Operator + (l: Byte; r: T2DFloat): T2DFloat;
Operator + (l: Single; r: T2DFloat): T2DFloat;
Operator + (l: Double; r: T2DFloat): T2DDouble;
Operator + (l: Extended; r: T2DFloat): T2DExt;
Operator + (l: T2DExt; r: T2DExt): T2DExt;
Operator + (l: T2DFloat; r: T2DExt): T2DExt;
Operator + (l: T2DExt; r: T2DFloat): T2DExt;
Operator + (l: T2DExt; r: T2DDouble): T2DExt;
Operator + (l: T2DDouble; r: T2DExt): T2DExt;
Operator + (l: T2DInt; r: T2DExt): T2DExt;
Operator + (l: T2DExt; r: T2DInt): T2DExt;
Operator + (l: T2DExt; r: T2DByte): T2DExt;
Operator + (l: T2DByte; r: T2DExt): T2DExt;
Operator + (l: T2DExt; r: Integer): T2DExt;
Operator + (l: T2DExt; r: Extended): T2DExt;
Operator + (l: T2DExt; r: Double): T2DExt;
Operator + (l: T2DExt; r: Single): T2DExt;
Operator + (l: T2DExt; r: Byte): T2DFloat;
Operator + (l: Integer; r: T2DExt): T2DExt;
Operator + (l: Byte; r: T2DExt): T2DExt;
Operator + (l: Single; r: T2DExt): T2DExt;
Operator + (l: Double; r: T2DExt): T2DExt;
Operator + (l: Extended; r: T2DExt): T2DExt;
Operator + (l: T2DInt; r: T2DInt): T2DInt;
Operator + (l: T2DByte; r: T2DByte): T2DInt;
Operator + (l: T2DInt; r: T2DByte): T2DByte;
Operator + (l: T2DByte; r: T2DInt): T2DInt;
Operator + (l: T2DInt; r: Integer): T2DInt;
Operator + (l: T2DInt; r: Byte): T2DInt;
Operator + (l: T2DInt; r: Single): T2DFloat;
Operator + (l: T2DInt; r: Double): T2DExt;
Operator + (l: T2DInt; r: Extended): T2DExt;
Operator + (l: Integer; r: T2DInt): T2DInt;
Operator + (l: Byte; r: T2DInt): T2DInt;
Operator + (l: Single; r: T2DInt): T2DFloat;
Operator + (l: Double; r: T2DInt): T2DDouble;
Operator + (l: Extended; r: T2DInt): T2DExt;
Operator + (l: T2DDouble; r: T2DDouble): T2DDouble;
Operator + (l: T2DFloat; r: T2DDouble): T2DDouble;
Operator + (l: T2DDouble; r: T2DFloat): T2DDouble;
Operator + (l: T2DInt; r: T2DDouble): T2DDouble;
Operator + (l: T2DDouble; r: T2DInt): T2DDouble;
Operator + (l: T2DDouble; r: T2DByte): T2DDouble;
Operator + (l: T2DByte; r: T2DDouble): T2DDouble;
Operator + (l: T2DDouble; r: Integer): T2DDouble;
Operator + (l: T2DDouble; r: Extended): T2DExt;
Operator + (l: T2DDouble; r: Double): T2DDouble;
Operator + (l: T2DDouble; r: Single): T2DDouble;
Operator + (l: T2DDouble; r: Byte): T2DDouble;
Operator + (l: Integer; r: T2DDouble): T2DDouble;
Operator + (l: Byte; r: T2DDouble): T2DDouble;
Operator + (l: Single; r: T2DDouble): T2DDouble;
Operator + (l: Double; r: T2DExt): T2DDouble;
Operator + (l: Extended; r: T2DDouble): T2DExt;

// Substraction: x - y
Operator - (l: T2DFloat; r: T2DFloat): T2DFloat;
Operator - (l: T2DInt; r: T2DFloat): T2DFloat;
Operator - (l: T2DFloat; r: T2DInt): T2DFloat;
Operator - (l: T2DFloat; r: T2DByte): T2DFloat;
Operator - (l: T2DByte; r: T2DFloat): T2DFloat;
Operator - (l: T2DFloat; r: Integer): T2DFloat;
Operator - (l: T2DFloat; r: Single): T2DFloat;
Operator - (l: T2DFloat; r: Double): T2DDouble;
Operator - (l: T2DFloat; r: Extended): T2DExt;
Operator - (l: T2DFloat; r: Byte): T2DFloat;
Operator - (l: Integer; r: T2DFloat): T2DFloat;
Operator - (l: Byte; r: T2DFloat): T2DFloat;
Operator - (l: Single; r: T2DFloat): T2DFloat;
Operator - (l: Double; r: T2DFloat): T2DDouble;
Operator - (l: Extended; r: T2DFloat): T2DExt;
Operator - (l: T2DExt; r: T2DExt): T2DExt;
Operator - (l: T2DFloat; r: T2DExt): T2DExt;
Operator - (l: T2DExt; r: T2DFloat): T2DExt;
Operator - (l: T2DDouble; r: T2DExt): T2DExt;
Operator - (l: T2DExt; r: T2DDouble): T2DExt;
Operator - (l: T2DInt; r: T2DExt): T2DExt;
Operator - (l: T2DExt; r: T2DInt): T2DExt;
Operator - (l: T2DExt; r: T2DByte): T2DExt;
Operator - (l: T2DByte; r: T2DExt): T2DExt;
Operator - (l: T2DExt; r: Integer): T2DExt;
Operator - (l: T2DExt; r: Extended): T2DExt;
Operator - (l: T2DExt; r: Double): T2DExt;
Operator - (l: T2DExt; r: Single): T2DExt;
Operator - (l: T2DExt; r: Byte): T2DFloat;
Operator - (l: Integer; r: T2DExt): T2DExt;
Operator - (l: Byte; r: T2DExt): T2DExt;
Operator - (l: Single; r: T2DExt): T2DExt;
Operator - (l: Double; r: T2DExt): T2DExt;
Operator - (l: Extended; r: T2DExt): T2DExt;
Operator - (l: T2DInt; r: T2DInt): T2DInt;
Operator - (l: T2DByte; r: T2DByte): T2DInt;
Operator - (l: T2DInt; r: T2DByte): T2DByte;
Operator - (l: T2DByte; r: T2DInt): T2DInt;
Operator - (l: T2DInt; r: Integer): T2DInt;
Operator - (l: T2DInt; r: Byte): T2DInt;
Operator - (l: T2DInt; r: Single): T2DFloat;
Operator - (l: T2DInt; r: Double): T2DDouble;
Operator - (l: T2DInt; r: Extended): T2DExt;
Operator - (l: Integer; r: T2DInt): T2DInt;
Operator - (l: Byte; r: T2DInt): T2DInt;
Operator - (l: Single; r: T2DInt): T2DFloat;
Operator - (l: Double; r: T2DInt): T2DDouble;
Operator - (l: Extended; r: T2DInt): T2DExt;
Operator - (l: T2DDouble; r: T2DDouble): T2DDouble;
Operator - (l: T2DFloat; r: T2DDouble): T2DDouble;
Operator - (l: T2DDouble; r: T2DFloat): T2DDouble;
Operator - (l: T2DInt; r: T2DDouble): T2DDouble;
Operator - (l: T2DDouble; r: T2DInt): T2DDouble;
Operator - (l: T2DDouble; r: T2DByte): T2DDouble;
Operator - (l: T2DByte; r: T2DDouble): T2DDouble;
Operator - (l: T2DDouble; r: Integer): T2DDouble;
Operator - (l: T2DDouble; r: Extended): T2DExt;
Operator - (l: T2DDouble; r: Double): T2DDouble;
Operator - (l: T2DDouble; r: Single): T2DDouble;
Operator - (l: T2DDouble; r: Byte): T2DDouble;
Operator - (l: Integer; r: T2DDouble): T2DDouble;
Operator - (l: Byte; r: T2DDouble): T2DDouble;
Operator - (l: Single; r: T2DDouble): T2DDouble;
Operator - (l: Double; r: T2DDouble): T2DDouble;
Operator - (l: Extended; r: T2DDouble): T2DExt;

// Division: x / y
Operator / (l: T2DFloat; r: T2DFloat): T2DFloat;
Operator / (l: T2DInt; r: T2DFloat): T2DFloat;
Operator / (l: T2DFloat; r: T2DInt): T2DFloat;
Operator / (l: T2DFloat; r: T2DByte): T2DFloat;
Operator / (l: T2DByte; r: T2DFloat): T2DFloat;
Operator / (l: T2DFloat; r: Integer): T2DFloat;
Operator / (l: T2DFloat; r: Single): T2DFloat;
Operator / (l: T2DFloat; r: Extended): T2DExt;
Operator / (l: T2DFloat; r: Byte): T2DFloat;
Operator / (l: T2DExt; r: T2DExt): T2DExt;
Operator / (l: T2DFloat; r: T2DExt): T2DExt;
Operator / (l: T2DExt; r: T2DFloat): T2DExt;
Operator / (l: T2DInt; r: T2DExt): T2DExt;
Operator / (l: T2DExt; r: T2DInt): T2DExt;
Operator / (l: T2DExt; r: T2DByte): T2DExt;
Operator / (l: T2DByte; r: T2DExt): T2DExt;
Operator / (l: T2DExt; r: Integer): T2DExt;
Operator / (l: T2DExt; r: Extended): T2DExt;
Operator / (l: T2DExt; r: Double): T2DExt;
Operator / (l: T2DExt; r: Single): T2DExt;
Operator / (l: T2DExt; r: Byte): T2DFloat;
Operator / (l: T2DInt; r: T2DInt): T2DInt;
Operator / (l: T2DByte; r: T2DByte): T2DInt;
Operator / (l: T2DInt; r: T2DByte): T2DByte;
Operator / (l: T2DByte; r: T2DInt): T2DInt;
Operator / (l: T2DInt; r: Integer): T2DInt;
Operator / (l: T2DInt; r: Byte): T2DInt;
Operator / (l: T2DInt; r: Single): T2DFloat;
Operator / (l: T2DInt; r: Double): T2DDouble;
Operator / (l: T2DInt; r: Extended): T2DExt;
Operator / (l: Integer; r: T2DInt): T2DInt;
Operator / (l: Byte; r: T2DInt): T2DInt;
Operator / (l: Single; r: T2DInt): T2DFloat;
Operator / (l: Double; r: T2DInt): T2DDouble;
Operator / (l: Extended; r: T2DInt): T2DExt;
Operator / (l: T2DDouble; r: T2DDouble): T2DDouble;
Operator / (l: T2DFloat; r: T2DDouble): T2DDouble;
Operator / (l: T2DDouble; r: T2DFloat): T2DDouble;
Operator / (l: T2DInt; r: T2DDouble): T2DDouble;
Operator / (l: T2DDouble; r: T2DInt): T2DDouble;
Operator / (l: T2DDouble; r: T2DByte): T2DDouble;
Operator / (l: T2DByte; r: T2DDouble): T2DDouble;
Operator / (l: T2DDouble; r: Integer): T2DDouble;
Operator / (l: T2DDouble; r: Extended): T2DExt;
Operator / (l: T2DDouble; r: Double): T2DDouble;
Operator / (l: T2DDouble; r: Single): T2DDouble;
Operator / (l: T2DDouble; r: Byte): T2DDouble;
Operator / (l: Integer; r: T2DDouble): T2DDouble;
Operator / (l: Byte; r: T2DDouble): T2DDouble;
Operator / (l: Single; r: T2DDouble): T2DDouble;
Operator / (l: Double; r: T2DDouble): T2DDouble;
Operator / (l: Extended; r: T2DDouble): T2DExt;

// x**number
Operator ** (l: T2DFloat; r: Integer): T2DFloat; 
Operator ** (l: T2DFloat; r: Single): T2DFloat; 
Operator ** (l: T2DFloat; r: Double): T2DExt; 
Operator ** (l: T2DFloat; r: Extended): T2DExt;
Operator ** (l: T2DFloat; r: Byte): T2DFloat; 
Operator ** (l: T2DDouble; r: Integer): T2DDouble; 
Operator ** (l: T2DDouble; r: Single): T2DDouble; 
Operator ** (l: T2DDouble; r: Double): T2DDouble; 
Operator ** (l: T2DDouble; r: Extended): T2DExt;
Operator ** (l: T2DDouble; r: Byte): T2DDouble; 
Operator ** (l: T2DExt; r: Integer): T2DExt; 
Operator ** (l: T2DExt; r: Single): T2DExt; 
Operator ** (l: T2DExt; r: Double): T2DExt; 
Operator ** (l: T2DExt; r: Extended): T2DExt;
Operator ** (l: T2DExt; r: Byte): T2DExt; 
Operator ** (l: T2DInt; r: Integer): T2DFloat; 
Operator ** (l: T2DInt; r: Single): T2DFloat; 
Operator ** (l: T2DInt; r: Double): T2DExt; 
Operator ** (l: T2DInt; r: Extended): T2DExt;
Operator ** (l: T2DInt; r: Byte): T2DFloat; 

// Sqrt(x)
function fSqrt(x: T2DByte): T2DFloat; overload;
function fSqrt(x: T2DInt): T2DFloat; overload;
function fSqrt(x: T2DFloat): T2DFloat; overload;
function Sqrt(x: T2DByte): T2DDouble; overload;
function Sqrt(x: T2DInt): T2DDouble; overload;
function Sqrt(x: T2DFloat): T2DDouble; overload;
function Sqrt(x: T2DExt): T2DExt; overload;
function Sqrt(x: T2DDouble): T2DDouble; overload;
function Sqr(x: T2DByte): T2DInt; overload;
function Sqr(x: T2DInt): T2DInt; overload;
function Sqr(x: T2DFloat): T2DFloat; overload;
function Sqr(x: T2DExt): T2DExt; overload;
function Sqr(x: T2DDouble): T2DDouble; overload;
function ArcTan(x: T2DByte): T2DDouble; overload;
function ArcTan(x: T2DInt): T2DDouble; overload;
function ArcTan(x: T2DFloat): T2DFloat; overload;
function ArcTan(x: T2DExt): T2DExt; overload;
function ArcTan(x: T2DDouble): T2DDouble; overload;

// Hyport(x,y)
function Hypot(l: T2DByte; r: T2DByte): T2DDouble; overload;
function Hypot(l: T2DByte; r: T2DInt): T2DDouble; overload;
function Hypot(l: T2DByte; r: T2DFloat): T2DDouble; overload;
function Hypot(l: T2DInt; r: T2DByte): T2DDouble; overload;
function Hypot(l: T2DInt; r: T2DInt): T2DDouble; overload;
function Hypot(l: T2DInt; r: T2DFloat): T2DDouble; overload;
function Hypot(l: T2DFloat; r: T2DByte): T2DDouble; overload;
function Hypot(l: T2DFloat; r: T2DInt): T2DDouble; overload;
function Hypot(l: T2DFloat; r: T2DFloat): T2DDouble; overload;
function Hypot(l: T2DDouble; r: T2DDouble): T2DDouble; overload;
function Hypot(l: T2DDouble; r: T2DFloat): T2DDouble; overload;
function Hypot(l: T2DFloat; r: T2DDouble): T2DDouble; overload;
function Hypot(l: T2DDouble; r: T2DInt): T2DDouble; overload;
function Hypot(l: T2DInt; r: T2DDouble): T2DDouble; overload;
function Hypot(l: T2DDouble; r: T2DByte): T2DDouble; overload;
function Hypot(l: T2DByte; r: T2DDouble): T2DDouble; overload;
function Hypot(l: T2DExt; r: T2DExt): T2DExt; overload;
function Hypot(l: T2DExt; r: T2DByte): T2DExt; overload;
function Hypot(l: T2DExt; r: T2DInt): T2DExt; overload;
function Hypot(l: T2DExt; r: T2DFloat): T2DExt; overload;
function Hypot(l: T2DFloat; r: T2DExt): T2DExt; overload;
function Hypot(l: T2DInt; r: T2DExt): T2DExt; overload;
function Hypot(l: T2DByte; r: T2DExt): T2DExt; overload;
function Hypot(l: T2DExt; r: T2DDouble): T2DExt; overload;
function Hypot(l: T2DDouble; r: T2DExt): T2DExt; overload;

// Rounding
function RoundTo(x: T2DFloat; Digits:Integer): T2DFloat; overload;
function RoundTo(x: T2DDouble; Digits:Integer): T2DFloat; overload;
function RoundTo(x: T2DExt; Digits:Integer): T2DFloat; overload;
function Round(x: T2DFloat): T2DInt; overload;
function Round(x: T2DDouble): T2DInt; overload;
function Round(x: T2DExt): T2DInt; overload;
function fCeil(x: T2DFloat): T2DFloat; overload;
function fCeil(x: T2DDouble): T2DFloat; overload;
function fCeil(x: T2DExt): T2DFloat; overload;
function Ceil(x: T2DFloat): T2DInt; overload;
function Ceil(x: T2DDouble): T2DInt; overload;
function Ceil(x: T2DExt): T2DInt; overload;
function fTrunc(x: T2DFloat): T2DFloat; overload;
function fTrunc(x: T2DDouble): T2DFloat; overload;
function fTrunc(x: T2DExt): T2DFloat; overload;
function Trunc(x: T2DFloat): T2DInt; overload;
function Trunc(x: T2DExt): T2DInt; overload;
function Trunc(x: T2DDouble): T2DInt; overload;
function fFloor(x: T2DExt): T2DFloat; overload;
function fFloor(x: T2DDouble): T2DFloat; overload;
function fFloor(x: T2DFloat): T2DFloat; overload;
function Floor(x: T2DFloat): T2DInt; overload;
function Floor(x: T2DDouble): T2DInt; overload;
function Floor(x: T2DExt): T2DInt; overload;

//------------------------------------------------------------------------
implementation


{------------------ Casting from one type to another --------------------}
function ToFloat(const mat:T2DByteArray): T2DFloatArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;


function ToFloat(const mat:T2DIntArray): T2DFloatArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToFloat(const mat:T2DDoubleArray): T2DFloatArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToFloat(const mat:T2DExtArray): T2DFloatArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;


function ToDouble(const mat:T2DByteArray): T2DDoubleArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;


function ToDouble(const mat:T2DIntArray): T2DDoubleArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToDouble(const mat:T2DFloatArray): T2DDoubleArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToDouble(const mat:T2DExtArray): T2DDoubleArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;





function ToExtended(const mat:T2DByteArray): T2DExtArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;


function ToExtended(const mat:T2DIntArray): T2DExtArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToExtended(const mat:T2DFloatArray): T2DExtArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;

function ToExtended(const mat:T2DDoubleArray): T2DExtArray; overload;
var W,H,x,y:Integer;
begin
  W := high(mat[0]);
  H := high(mat);
  SetLength(Result, H+1,W+1);
  for y:=0 to H do
    for x:=0 to W do
      Result[y][x] := mat[y][x];
end;




{------ Multiplication goes all the way down to around line 500. --------}

(*-----------------------------------------------------------------------] 
 First of in our operator overloads, we have Single-result type.
[-----------------------------------------------------------------------*)

//Float2d * Float2d
Operator * (l: T2DFloat; r: T2DFloat): T2DFloat; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Int2d * Float2d
Operator * (l: T2DInt; r: T2DFloat): T2DFloat; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Float2d * Int2d
Operator * (l: T2DFloat; r: T2DInt): T2DFloat; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Float2d * Byte2d
Operator * (l: T2DFloat; r: T2DByte): T2DFloat; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Byte2d * Float2d
Operator * (l: T2DByte; r: T2DFloat): T2DFloat; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Float2d * Integer
Operator * (l: T2DFloat; r: Integer): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Float2d * Single
Operator * (l: T2DFloat; r: Single): T2DFloat;
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Float2d * Double = T2DExt;
Operator * (l: T2DFloat; r: Double): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;

//Float2d * Extended = T2DExt;
Operator * (l: T2DFloat; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Float2d * Byte
Operator * (l: T2DFloat; r: Byte): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


{------| Left only signs |-----}
{--| Result can change type |--}

//Integer * T2DFloat
Operator * (l: Integer; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Byte * T2DFloat
Operator * (l: Byte; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Single * T2DFloat
Operator * (l: Single; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Double * T2DFloat = T2DExt 
Operator * (l: Double; r: T2DFloat): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Extended * T2DFloat = T2DExt 
Operator * (l: Extended; r: T2DFloat): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;



(*-----------------------------------------------------------------------] 
 Secound of in our operator overloads, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Ext2d * Ext2d
Operator * (l: T2DExt; r: T2DExt): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];;
end;


//Float2d * Ext2d
Operator * (l: T2DFloat; r: T2DExt): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];;
end;


//Ext2d * Float2d
Operator * (l: T2DExt; r: T2DFloat): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];;
end;


//Int2d * Ext2d
Operator * (l: T2DInt; r: T2DExt): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];;
end;


//Ext2d * Int2d
Operator * (l: T2DExt; r: T2DInt): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Ext2d * Byte2d
Operator * (l: T2DExt; r: T2DByte): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Byte2d * Ext2d
Operator * (l: T2DByte; r: T2DExt): T2DExt; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;

{------| right only signs |------}

//Ext2d * Integer
Operator * (l: T2DExt; r: Integer): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Ext2d * Extended
Operator * (l: T2DExt; r: Extended): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Ext2d * Single
Operator * (l: T2DExt; r: Single): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Ext2d * Double
Operator * (l: T2DExt; r: Double): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Ext2d * Byte
Operator * (l: T2DExt; r: Byte): T2DExt;
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


(*-----------------------------------------------------------------------]
 Third of in our operator overloads, we have Integer-result type.
 This will include Byte2D*Byte2D multiplication as that would normally
 overflow.
[-----------------------------------------------------------------------*)

//Int2d * Int2d
Operator * (l: T2DInt; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Byte2d * Byte2d
Operator * (l: T2DByte; r: T2DByte): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Int2d * Byte2d
Operator * (l: T2DInt; r: T2DByte): T2DByte;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Byte2d * Int2d
Operator * (l: T2DByte; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Int2d * Integer
Operator * (l: T2DInt; r: Integer): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Int2d * Byte
Operator * (l: T2DInt; r: Byte): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Int2d * Single
Operator * (l: T2DInt; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Int2d * Double = T2DDouble
Operator * (l: T2DInt; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//Int2d * Extended = T2DExt
Operator * (l: T2DInt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;




(*-----------------------------------------------------------------------] 
 Fourth of in our operator overloads, we have Double-result type.
[-----------------------------------------------------------------------*)
//T2DDouble * T2DDouble
Operator * (l: T2DDouble; r: T2DDouble): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//T2DDouble * T2DFloat
Operator * (l: T2DDouble; r: T2DFloat): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//T2DDouble * T2DFloat
Operator * (l: T2DFloat; r: T2DDouble): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Int2d * T2DDouble
Operator * (l: T2DInt; r: T2DDouble): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//T2DDouble * Int2d
Operator * (l: T2DDouble; r: T2DInt): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//T2DDouble * Byte2d
Operator * (l: T2DDouble; r: T2DByte): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


//Byte2d * T2DDouble
Operator * (l: T2DByte; r: T2DDouble): T2DDouble; 
var Wl,Hl,Wr,Hr,i,j: Integer; 
begin 
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] * r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//T2DDouble * Integer
Operator * (l: T2DDouble; r: Integer): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//T2DDouble * Single
Operator * (l: T2DDouble; r: Single): T2DDouble;
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//T2DDouble * Double;
Operator * (l: T2DDouble; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;

//T2DDouble * Extended = T2DExt;
Operator * (l: T2DDouble; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


//T2DDouble * Byte
Operator * (l: T2DDouble; r: Byte): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] * r;
end;


{------| Left only signs |-----}

//Byte * T2DDouble
Operator * (l: Byte; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;

//Integer * T2DDouble
Operator * (l: Integer; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Single * T2DDouble
Operator * (l: Single; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Double * T2DDouble
Operator * (l: Double; r: T2DExt): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;


//Extended * Double2D 
Operator * (l: Extended; r: T2DDouble): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l * r[i][j]
end;






{--------- Addition goes all the way down to around line 1300. ----------}

(*-----------------------------------------------------------------------]
 First of in our operator overloads, we have Single-result type.
[-----------------------------------------------------------------------*)

//Float2d + Float2d
Operator + (l: T2DFloat; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Int2d + Float2d
Operator + (l: T2DInt; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Float2d + Int2d
Operator + (l: T2DFloat; r: T2DInt): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Float2d + Byte2d
Operator + (l: T2DFloat; r: T2DByte): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Byte2d + Float2d
Operator + (l: T2DByte; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Float2d + Integer
Operator + (l: T2DFloat; r: Integer): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Single
Operator + (l: T2DFloat; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Double = T2DExt
Operator + (l: T2DFloat; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Extended = T2DExt
Operator + (l: T2DFloat; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Byte
Operator + (l: T2DFloat; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;



{------| Left only signs |-----}
{--| Result can change type |--}

//Integer + T2DFloat
Operator + (l: Integer; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Byte + T2DFloat
Operator + (l: Byte; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Single + T2DFloat
Operator + (l: Single; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Double + T2DFloat = T2DExt 
Operator + (l: Double; r: T2DFloat): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Extended + T2DFloat = T2DExt 
Operator + (l: Extended; r: T2DFloat): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;



(*-----------------------------------------------------------------------]
 Secound of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Ext2d + Ext2d
Operator + (l: T2DExt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;

//Float2d + Ext2d
Operator + (l: T2DFloat; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Ext2d + Float2d
Operator + (l: T2DExt; r: T2DFloat): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Ext2d + Double2d
Operator + (l: T2DExt; r: T2DDouble): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Double2d + Ext2d
Operator + (l: T2DDouble; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Int2d + Ext2d
Operator + (l: T2DInt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Ext2d + Int2d
Operator + (l: T2DExt; r: T2DInt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Ext2d + Byte2d
Operator + (l: T2DExt; r: T2DByte): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Byte2d + Ext2d
Operator + (l: T2DByte; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


{------| right only signs |------}

//Ext2d + Integer
Operator + (l: T2DExt; r: Integer): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Ext2d + Extended
Operator + (l: T2DExt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;

//Ext2d + Double
Operator + (l: T2DExt; r: Double): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Ext2d + Single
Operator + (l: T2DExt; r: Single): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Byte
Operator + (l: T2DExt; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


{------| Left only signs |-----}

//Integer + T2DExt
Operator + (l: Integer; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Byte + T2DExt
Operator + (l: Byte; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Single + T2DExt
Operator + (l: Single; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Double + T2DExt = T2DExt 
Operator + (l: Double; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Extended + Ext2D 
Operator + (l: Extended; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;



(*-----------------------------------------------------------------------]
 Third of in our operator types, we have Integer-result type.
 This will include Byte2D*Byte2D multiplication as that would normally
 overflow.
[-----------------------------------------------------------------------*)

//Int2d + Int2d
Operator + (l: T2DInt; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Byte2d + Byte2d
Operator + (l: T2DByte; r: T2DByte): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Int2d + Byte2d
Operator + (l: T2DInt; r: T2DByte): T2DByte;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Byte2d + Int2d
Operator + (l: T2DByte; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Int2d + Integer
Operator + (l: T2DInt; r: Integer): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Int2d + Byte
Operator + (l: T2DInt; r: Byte): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Int2d + Single
Operator + (l: T2DInt; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Int2d + Double (returns extended)
Operator + (l: T2DInt; r: Double): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Int2d + Extended (Result is extended)
Operator + (l: T2DInt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


{------| Left only signs |-----}
{--| Result can change type |--}

//Integer + Int2d
Operator + (l: Integer; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Byte + Int2d
Operator + (l: Byte; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Single + Int2d = T2DFloat
Operator + (l: Single; r: T2DInt): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Double + Int2d = T2DDouble
Operator + (l: Double; r: T2DInt): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Extended + Int2d = T2DExt 
Operator + (l: Extended; r: T2DInt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;





(*-----------------------------------------------------------------------]
 Fourth of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Double2d + Double2d
Operator + (l: T2DDouble; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;

//Float2d + Double2d
Operator + (l: T2DFloat; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Ext2d + Float2d
Operator + (l: T2DDouble; r: T2DFloat): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Int2d + Double2d
Operator + (l: T2DInt; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Double2d + Int2d
Operator + (l: T2DDouble; r: T2DInt): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Double2d + Byte2d
Operator + (l: T2DDouble; r: T2DByte): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


//Byte2d + Double2d
Operator + (l: T2DByte; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] + r[i][j];
end;


{------| right only signs |------}

//Double2d + Integer
Operator + (l: T2DDouble; r: Integer): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Double2d + Extended
Operator + (l: T2DDouble; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;

//Double2d + Double
Operator + (l: T2DDouble; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Ext2d + Single
Operator + (l: T2DDouble; r: Single): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


//Float2d + Byte
Operator + (l: T2DDouble; r: Byte): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] + r
end;


{------| Left only signs |-----}

//Integer + T2DDouble
Operator + (l: Integer; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Byte + T2DDouble
Operator + (l: Byte; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Single + T2DDouble
Operator + (l: Single; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Double + T2DDouble
Operator + (l: Double; r: T2DExt): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;


//Extended + Double2D 
Operator + (l: Extended; r: T2DDouble): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l + r[i][j]
end;



















{--------- Substraction goes all the way down to around line 2200. ----------}

(*-----------------------------------------------------------------------]
 First of in our operator overloads, we have Single-result type.
[-----------------------------------------------------------------------*)

//Float2d - Float2d
Operator - (l: T2DFloat; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Int2d - Float2d
Operator - (l: T2DInt; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Float2d - Int2d
Operator - (l: T2DFloat; r: T2DInt): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Float2d - Byte2d
Operator - (l: T2DFloat; r: T2DByte): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Byte2d - Float2d
Operator - (l: T2DByte; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Float2d - Integer
Operator - (l: T2DFloat; r: Integer): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Single
Operator - (l: T2DFloat; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Double
Operator - (l: T2DFloat; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Extended (Result is extended)
Operator - (l: T2DFloat; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Byte
Operator - (l: T2DFloat; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


{------| Left only signs |-----}
{--| Result can change type |--}

//Integer - Float2d
Operator - (l: Integer; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Byte - Float2d
Operator - (l: Byte; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Single - Ext2d
Operator - (l: Single; r: T2DFloat): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Double - Float2d = Double2D
Operator - (l: Double; r: T2DFloat): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Extended - Float2d = Ext2D
Operator - (l: Extended; r: T2DFloat): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;



(*-----------------------------------------------------------------------]
 Secound of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Ext2d - Ext2d
Operator - (l: T2DExt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;

//Float2d - Ext2d
Operator - (l: T2DFloat; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Ext2d - Float2d
Operator - (l: T2DExt; r: T2DFloat): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Double2d - Ext2d
Operator - (l: T2DDouble; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Ext2d - Double2d
Operator - (l: T2DExt; r: T2DDouble): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Int2d - Ext2d
Operator - (l: T2DInt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Ext2d - Int2d
Operator - (l: T2DExt; r: T2DInt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Ext2d - Byte2d
Operator - (l: T2DExt; r: T2DByte): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Byte2d - Ext2d
Operator - (l: T2DByte; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


{------| right only signs |------}

//Ext2d - Integer
Operator - (l: T2DExt; r: Integer): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Ext2d - Extended
Operator - (l: T2DExt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Ext2d - Double
Operator - (l: T2DExt; r: Double): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Ext2d - Single
Operator - (l: T2DExt; r: Single): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Byte
Operator - (l: T2DExt; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;



{------| Left only signs |-----}

//Integer - Ext2d
Operator - (l: Integer; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Byte - Ext2d
Operator - (l: Byte; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Single - Ext2d
Operator - (l: Single; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Double - Ext2d 
Operator - (l: Double; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Extended - Ext2d
Operator - (l: Extended; r: T2DExt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


(*-----------------------------------------------------------------------]
 Third of in our operator types, we have Integer-result type.
 This will include Byte2D*Byte2D multiplication as that would normally
 overflow.
[-----------------------------------------------------------------------*)

//Int2d - Int2d
Operator - (l: T2DInt; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Byte2d - Byte2d
Operator - (l: T2DByte; r: T2DByte): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Int2d - Byte2d
Operator - (l: T2DInt; r: T2DByte): T2DByte;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Byte2d - Int2d
Operator - (l: T2DByte; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Int2d - Integer
Operator - (l: T2DInt; r: Integer): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Int2d - Byte
Operator - (l: T2DInt; r: Byte): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Int2d - Single
Operator - (l: T2DInt; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Int2d - Double = T2DDouble
Operator - (l: T2DInt; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Int2d - Extended (Result is extended)
Operator - (l: T2DInt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;



{------| Left only signs |-----}
{--| Result can change type |--}

//Integer - Int2d
Operator - (l: Integer; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Byte - Int2d
Operator - (l: Byte; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Single - Int2d
Operator - (l: Single; r: T2DInt): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Double - Int2d = T2DDouble
Operator - (l: Double; r: T2DInt): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Extended - Int2d = T2DExt 
Operator - (l: Extended; r: T2DInt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;




(*-----------------------------------------------------------------------]
 Fourth of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Double2d - Double2d
Operator - (l: T2DDouble; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;

//Float2d - Double2d
Operator - (l: T2DFloat; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Ext2d - Float2d
Operator - (l: T2DDouble; r: T2DFloat): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Int2d - Double2d
Operator - (l: T2DInt; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Double2d - Int2d
Operator - (l: T2DDouble; r: T2DInt): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Double2d - Byte2d
Operator - (l: T2DDouble; r: T2DByte): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


//Byte2d - Double2d
Operator - (l: T2DByte; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] - r[i][j];
end;


{------| right only signs |------}

//Double2d - Integer
Operator - (l: T2DDouble; r: Integer): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Double2d - Extended
Operator - (l: T2DDouble; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;

//Double2d - Double
Operator - (l: T2DDouble; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Ext2d - Single
Operator - (l: T2DDouble; r: Single): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


//Float2d - Byte
Operator - (l: T2DDouble; r: Byte): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] - r
end;


{------| Left only signs |-----}

//Integer - T2DDouble
Operator - (l: Integer; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Byte - T2DDouble
Operator - (l: Byte; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Single - T2DDouble
Operator - (l: Single; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Double - T2DDouble
Operator - (l: Double; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;


//Extended - Double2D 
Operator - (l: Extended; r: T2DDouble): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l - r[i][j]
end;



































{--------- Division goes all the way down to around line 2000. ----------}

(*-----------------------------------------------------------------------]
 First of in our operator overloads, we have Single-result type.
[-----------------------------------------------------------------------*)

//Float2d / Float2d
Operator / (l: T2DFloat; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Int2d / Float2d
Operator / (l: T2DInt; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Float2d / Int2d
Operator / (l: T2DFloat; r: T2DInt): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Float2d / Byte2d
Operator / (l: T2DFloat; r: T2DByte): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Byte2d / Float2d
Operator / (l: T2DByte; r: T2DFloat): T2DFloat;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Float2d / Integer
Operator / (l: T2DFloat; r: Integer): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Float2d / Single
Operator / (l: T2DFloat; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Float2d / Extended (Result is extended)
Operator / (l: T2DFloat; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Float2d / Byte
Operator / (l: T2DFloat; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;





(*-----------------------------------------------------------------------]
 Secound of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Ext2d / Ext2d
Operator / (l: T2DExt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Float2d / Ext2d
Operator / (l: T2DFloat; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Ext2d / Float2d
Operator / (l: T2DExt; r: T2DFloat): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Int2d / Ext2d
Operator / (l: T2DInt; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Ext2d / Int2d
Operator / (l: T2DExt; r: T2DInt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Ext2d / Byte2d
Operator / (l: T2DExt; r: T2DByte): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Byte2d / Ext2d
Operator / (l: T2DByte; r: T2DExt): T2DExt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


{------| right only signs |------}

//Ext2d / Integer
Operator / (l: T2DExt; r: Integer): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;


//Ext2d / Extended
Operator / (l: T2DExt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;

//Ext2d / Double
Operator / (l: T2DExt; r: Double): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;


//Ext2d / Single
Operator / (l: T2DExt; r: Single): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;


//Float2d / Byte
Operator / (l: T2DExt; r: Byte): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;





(*-----------------------------------------------------------------------]
 Third of in our operator types, we have Integer-result type.
 This will include Byte2D/Byte2D multiplication as that would normally
 overflow.
[-----------------------------------------------------------------------*)

//Int2d / Int2d
Operator / (l: T2DInt; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] div r[i][j];
end;


//Byte2d / Byte2d
Operator / (l: T2DByte; r: T2DByte): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] div r[i][j];
end;


//Int2d / Byte2d
Operator / (l: T2DInt; r: T2DByte): T2DByte;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] div r[i][j];
end;


//Byte2d / Int2d
Operator / (l: T2DByte; r: T2DInt): T2DInt;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] div r[i][j];
end;


{------| right only signs |-----}
{--| Result can change type |--}

//Int2d / Integer
Operator / (l: T2DInt; r: Integer): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] div r;
end;


//Int2d / Byte
Operator / (l: T2DInt; r: Byte): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] div r;
end;


//Int2d / Single
Operator / (l: T2DInt; r: Single): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;


//Int2d / Double
Operator / (l: T2DInt; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;


//Int2d / Extended (Result is extended)
Operator / (l: T2DInt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r;
end;



{------| Left only signs |-----}

//Integer / T2DInt
Operator / (l: Integer; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l div r[i][j]
end;


//Byte / T2DInt
Operator / (l: Byte; r: T2DInt): T2DInt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l div r[i][j]
end;


//Single / T2DInt
Operator / (l: Single; r: T2DInt): T2DFloat;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Double / T2DInt
Operator / (l: Double; r: T2DInt): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Extended / Int2D 
Operator / (l: Extended; r: T2DInt): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;






(*-----------------------------------------------------------------------]
 Fourth of in our operator types, we have Extended-result type.
[-----------------------------------------------------------------------*)

//Double2d / Double2d
Operator / (l: T2DDouble; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;

//Float2d / Double2d
Operator / (l: T2DFloat; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Ext2d / Float2d
Operator / (l: T2DDouble; r: T2DFloat): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Int2d / Double2d
Operator / (l: T2DInt; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Double2d / Int2d
Operator / (l: T2DDouble; r: T2DInt): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Double2d / Byte2d
Operator / (l: T2DDouble; r: T2DByte): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


//Byte2d / Double2d
Operator / (l: T2DByte; r: T2DDouble): T2DDouble;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := l[i][j] / r[i][j];
end;


{------| right only signs |------}

//Double2d / Integer
Operator / (l: T2DDouble; r: Integer): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Double2d / Extended
Operator / (l: T2DDouble; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;

//Double2d / Double
Operator / (l: T2DDouble; r: Double): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Ext2d / Single
Operator / (l: T2DDouble; r: Single): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


//Float2d / Byte
Operator / (l: T2DDouble; r: Byte): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l[i][j] / r
end;


{------| Left only signs |-----}

//Integer / T2DDouble
Operator / (l: Integer; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Byte / T2DDouble
Operator / (l: Byte; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Single / T2DDouble
Operator / (l: Single; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Double / T2DDouble
Operator / (l: Double; r: T2DDouble): T2DDouble;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;


//Extended / Double2D 
Operator / (l: Extended; r: T2DDouble): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(r);
  W := Length(r[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := l / r[i][j]
end;






















{------- Exponentiation goes all the way down to around line 2900. ------}
{---------- Exponent can not be a matrix - maybe in the future ----------} 

{------| Single operations |------}
//Float2d ^ Integer
Operator ** (l: T2DFloat; r: Integer): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Float2d ^ Single
Operator ** (l: T2DFloat; r: Single): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Float2d ^ Double = T2DExt
Operator ** (l: T2DFloat; r: Double): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Float2d ^ Extended = T2DExt
Operator ** (l: T2DFloat; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Float2d ^ Byte
Operator ** (l: T2DFloat; r: Byte): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;



{------| Double operations |------}
//Ext2d ^ Integer
Operator ** (l: T2DDouble; r: Integer): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Single
Operator ** (l: T2DDouble; r: Single): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Double
Operator ** (l: T2DDouble; r: Double): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Double2d ^ Extended
Operator ** (l: T2DDouble; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Byte
Operator ** (l: T2DDouble; r: Byte): T2DDouble; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


{------| Extended operations |------}
//Ext2d ^ Integer
Operator ** (l: T2DExt; r: Integer): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Single
Operator ** (l: T2DExt; r: Single): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Double
Operator ** (l: T2DExt; r: Double): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Extended
Operator ** (l: T2DExt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Ext2d ^ Byte
Operator ** (l: T2DExt; r: Byte): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;




{------| Integer operations |------}
//Int2d ^ Integer = T2DFloat
Operator ** (l: T2DInt; r: Integer): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := IntPower(l[i][j], r);
end;


//Int2d ^ Single = T2DFloat
Operator ** (l: T2DInt; r: Single): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Int2d ^ Double = T2DExt
Operator ** (l: T2DInt; r: Double): T2DExt; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Int2d ^ Extended = T2DExt
Operator ** (l: T2DInt; r: Extended): T2DExt;
var W,H,i,j: Integer;
begin
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;


//Int2d ^ Byte
Operator ** (l: T2DInt; r: Byte): T2DFloat; 
var W,H,i,j: Integer; 
begin 
  H := Length(l);
  W := Length(l[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Power(l[i][j], r);
end;
















{------- Square root funcs goes all the way down to around line 2300. ------}

function fSqrt(x: T2DByte): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;

function fSqrt(x: T2DInt): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;


function fSqrt(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;


//more precise.
function Sqrt(x: T2DByte): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;

function Sqrt(x: T2DInt): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;

function Sqrt(x: T2DFloat): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;


function Sqrt(x: T2DExt): T2DExt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;


function Sqrt(x: T2DDouble): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Sqrt(x[i][j]);
end;















{------- Square funcs goes all the way down to around line 2370. ------}

function Sqr(x: T2DByte): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := x[i][j] * x[i][j];
end;

function Sqr(x: T2DInt): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := x[i][j] * x[i][j];
end;


function Sqr(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := x[i][j] * x[i][j];
end;


function Sqr(x: T2DExt): T2DExt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := x[i][j] * x[i][j];
end;


function Sqr(x: T2DDouble): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := x[i][j] * x[i][j];
end;


















{------- ArcTan funcs goes all the way down to around line 2430. ------}

function ArcTan(x: T2DByte): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := ArcTan(x[i][j]);
end;

function ArcTan(x: T2DInt): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := ArcTan(x[i][j]);
end;


function ArcTan(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := ArcTan(x[i][j]);
end;


function ArcTan(x: T2DExt): T2DExt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := ArcTan(x[i][j]);
end;


function ArcTan(x: T2DDouble): T2DDouble; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := ArcTan(x[i][j]);
end;



















{------- Hypot funcs goes all the way down to around line 2720. ------}
{------------------- Equal to Sqrt(Sqr(L)+Sqr(R)) --------------------}

// Double 2D array output ------------------------------------->

// Hypot(T2DByte, T2DByte)
function Hypot(l: T2DByte; r: T2DByte): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DByte, T2DInt)
function Hypot(l: T2DByte; r: T2DInt): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DByte, T2DFloat)
function Hypot(l: T2DByte; r: T2DFloat): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DByte)
function Hypot(l: T2DInt; r: T2DByte): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DInt)
function Hypot(l: T2DInt; r: T2DInt): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DFloat)
function Hypot(l: T2DInt; r: T2DFloat): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DFloat, T2DByte)
function Hypot(l: T2DFloat; r: T2DByte): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DFloat, T2DInt)
function Hypot(l: T2DFloat; r: T2DInt): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DFloat, T2DFloat)
function Hypot(l: T2DFloat; r: T2DFloat): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;



// Hypot(T2DDouble, T2DDouble)
function Hypot(l: T2DDouble; r: T2DDouble): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DDouble, T2DFloat)
function Hypot(l: T2DDouble; r: T2DFloat): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;



// Hypot(T2DFloat, T2DDouble)
function Hypot(l: T2DFloat; r: T2DDouble): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DDouble, T2DInt)
function Hypot(l: T2DDouble; r: T2DInt): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DDouble)
function Hypot(l: T2DInt; r: T2DDouble): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;

// Hypot(T2DDouble, T2DByte)
function Hypot(l: T2DDouble; r: T2DByte): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DDouble)
function Hypot(l: T2DByte; r: T2DDouble): T2DDouble; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;





// Extended 2D array output ----------------------------------------->

// Hypot(T2DExt, T2DExt)
function Hypot(l: T2DExt; r: T2DExt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;

// Hypot(T2DExt, T2DByte)
function Hypot(l: T2DExt; r: T2DByte): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DExt, T2DInt)
function Hypot(l: T2DExt; r: T2DInt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DExt, T2DFloat)
function Hypot(l: T2DExt; r: T2DFloat): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DFloat, T2DExt)
function Hypot(l: T2DFloat; r: T2DExt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DInt, T2DExt)
function Hypot(l: T2DInt; r: T2DExt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DByte, T2DExt)
function Hypot(l: T2DByte; r: T2DExt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DExt, T2DDouble)
function Hypot(l: T2DExt; r: T2DDouble): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;


// Hypot(T2DDouble, T2DExt)
function Hypot(l: T2DDouble; r: T2DExt): T2DExt; overload;
var Wl,Hl,Wr,Hr,i,j: Integer;
begin
  Hl := Length(l);
  Wl := Length(l[0]);
  Hr := Length(r);
  Wr := Length(r[0]);
  if (Hl<>Hr) or (Wl<>Wr) then Exit;
  SetLength(Result, Hl,Wl);
  for i:=0 to Hl-1 do
    for j:=0 to Wl-1 do
      Result[i][j] := Sqrt(Sqr(l[i][j]) + Sqr(r[i][j]));
end;







{-- Round/Ceil/Trunc/Floor funcs goes all the way down to around line 2925. --}

//Rounding ------->
function RoundTo(x: T2DFloat; Digits:Integer): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := RoundTo(x[i][j], Digits);
end;

function RoundTo(x: T2DDouble; Digits:Integer): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := RoundTo(x[i][j], Digits);
end;

function RoundTo(x: T2DExt; Digits:Integer): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := RoundTo(x[i][j], Digits);
end;

function Round(x: T2DFloat): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Round(x[i][j]);
end;

function Round(x: T2DDouble): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Round(x[i][j]);
end;

function Round(x: T2DExt): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Round(x[i][j]);
end;


//Ceiling ------->
function fCeil(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;

function fCeil(x: T2DDouble): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;

function fCeil(x: T2DExt): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;


function Ceil(x: T2DFloat): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;

function Ceil(x: T2DDouble): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;

function Ceil(x: T2DExt): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Ceil(x[i][j]);
end;


//Truncating ------->
function fTrunc(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;

function fTrunc(x: T2DDouble): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;

function fTrunc(x: T2DExt): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;


function Trunc(x: T2DFloat): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;


function Trunc(x: T2DExt): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;

function Trunc(x: T2DDouble): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Trunc(x[i][j]);
end;




//Flooring ------->
function fFloor(x: T2DExt): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;

function fFloor(x: T2DDouble): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;

function fFloor(x: T2DFloat): T2DFloat; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;


function Floor(x: T2DFloat): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;


function Floor(x: T2DDouble): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;


function Floor(x: T2DExt): T2DInt; overload;
var W,H,i,j: Integer;
begin
  H := Length(x);
  W := Length(x[0]);
  SetLength(Result, H,W);
  for i:=0 to H-1 do
    for j:=0 to W-1 do
      Result[i][j] := Floor(x[i][j]);
end;




end.