Unit Std;
{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2013, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
{$mode objfpc}{$H+}
{$macro on}
{$inline on}

interface
uses
  SysUtils,CoreTypes;

function Slice(const Arr:TIntArray; Start,Stop:Int64; Step:Int32=1): TIntArray; overload;
function Slice(const Arr:TExtArray; Start,Stop:Int64; Step:Int32=1): TExtArray; overload;
function Slice(const Arr:TFloatArray; Start,Stop:Int64; Step:Int32=1): TFloatArray; overload;
function Slice(const Arr:TDoubleArray; Start,Stop:Int64; Step:Int32=1): TDoubleArray; overload;
function Slice(const Arr:TPointArray; Start,Stop:Int64; Step:Int32=1): TPointArray; overload;
function Slice(const Arr:TByteArray; Start,Stop:Int64; Step:Int32=1): TByteArray; overload;
function Slice(const Arr:TBoxArray; Start,Stop:Int64; Step:Int32=1): TBoxArray; overload;
function Slice(const Arr:String; Start,Stop:Int64; Step:Int32=1): String; overload;

function Slice(const Arr:T2DIntArray; Start,Stop:Int64; Step:Int32=1): T2DIntArray; overload;
function Slice(const Arr:T2DExtArray; Start,Stop:Int64; Step:Int32=1): T2DExtArray; overload;
function Slice(const Arr:T2DFloatArray; Start,Stop:Int64; Step:Int32=1): T2DFloatArray; overload;
function Slice(const Arr:T2DDoubleArray; Start,Stop:Int64; Step:Int32=1): T2DDoubleArray; overload;
function Slice(const Arr:T2DPointArray; Start,Stop:Int64; Step:Int32=1): T2DPointArray; overload;
function Slice(const Arr:T2DByteArray; Start,Stop:Int64; Step:Int32=1): T2DByteArray; overload;
function Slice(const Arr:T2DBoxArray; Start,Stop:Int64; Step:Int32=1): T2DBoxArray; overload;
function Slice(const Arr:TStringArray; Start,Stop:Int64; Step:Int32=1): TStringArray; overload;


(* *)
function Find(const Arr, Seq:TByteArray): Int32; overload;
function Find(const Arr, Seq:TIntArray): Int32; overload;
function Find(const Arr, Seq:TFloatArray): Int32; overload;
function Find(const Arr, Seq:TDoubleArray): Int32; overload;
function Find(const Arr, Seq:TExtArray): Int32; overload;
function Find(const Arr, Seq:TPointArray): Int32; overload;
function Find(const Arr, Seq:TBoxArray): Int32; overload;
function Find(const Arr, Seq:TStringArray): Int32; overload;
function Find(const Arr, Seq:String): Int32; overload;

function Find(const Arr:TByteArray; Item:Byte): Int32; overload;
function Find(const Arr:TIntArray; Item:Int32): Int32; overload;
function Find(const Arr:TFloatArray; Item:Single): Int32; overload;
function Find(const Arr:TDoubleArray; Item:Double): Int32; overload;
function Find(const Arr:TExtArray; Item:Extended): Int32; overload;
function Find(const Arr:TPointArray; Item:TPoint): Int32; overload;
function Find(const Arr:TBoxArray; Item:TBox): Int32; overload;
function Find(const Arr:TStringArray; Item:String): Int32; overload;
function Find(const Arr:String; Item:Char): Int32; overload;


(* *)
function FindAll(const Arr, Seq:TByteArray): TIntArray; overload;
function FindAll(const Arr, Seq:TIntArray): TIntArray; overload;
function FindAll(const Arr, Seq:TFloatArray): TIntArray; overload;
function FindAll(const Arr, Seq:TDoubleArray): TIntArray; overload;
function FindAll(const Arr, Seq:TExtArray): TIntArray; overload;
function FindAll(const Arr, Seq:TPointArray): TIntArray; overload;
function FindAll(const Arr, Seq:TBoxArray): TIntArray; overload;
function FindAll(const Arr, Seq:TStringArray): TIntArray; overload;
function FindAll(const Arr, Seq:String): TIntArray; overload;

function FindAll(const Arr:TByteArray; Item:Byte): TIntArray; overload;
function FindAll(const Arr:TIntArray; Item:Int32): TIntArray; overload;
function FindAll(const Arr:TFloatArray; Item:Single): TIntArray; overload;
function FindAll(const Arr:TDoubleArray; Item:Double): TIntArray; overload;
function FindAll(const Arr:TExtArray; Item:Extended): TIntArray; overload;
function FindAll(const Arr:TPointArray; Item:TPoint): TIntArray; overload;
function FindAll(const Arr:TBoxArray; Item:TBox): TIntArray; overload;
function FindAll(const Arr:TStringArray; Item:String): TIntArray; overload;
function FindAll(const Arr:String; Item:Char): TIntArray; overload;


(*
function Uniq(const Arr:TByteArray): TByteArray; overload;
function Uniq(const Arr:TIntArray): TIntArray; overload;
function Uniq(const Arr:TFloatArray): TFloatArray; overload;
function Uniq(const Arr:TDoubleArray): TDoubleArray; overload;
function Uniq(const Arr:TExtArray): TExtArray; overload;
function Uniq(const Arr:TPointArray): TPointArray; overload;
function Uniq(const Arr:TBoxArray): TBoxArray; overload;
function Uniq(const Arr:TStringArray): TStringArray; overload;
function Uniq(const Arr:String): String; overload;
*)

//--------------------------------------------------
implementation
uses CoreMath, ExceptionMgr;

{$I std/ArrSlice.pas}
{$I std/ArrFind.pas}
{$I std/ArrFindAll.pas}

end.