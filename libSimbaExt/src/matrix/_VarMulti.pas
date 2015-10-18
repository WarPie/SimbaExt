{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2013, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt

 Find the N-minimum or N-maximum values in the matrix.
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
{$define VarMultiBody :=
  H := High(Mat);
  if (H = -1) then NewException(exEmptyMatrix);
  W := High(Mat[0]);

  Heap := THeapq.Create(HiLo);

  width := w + 1;
  case HiLo of
    True:
      for y:=0 to H do
        for x:=0 to W do
          if (Heap.size < count) or (mat[y,x] > Heap[0].value) then
          begin
            if (heap.size = count) then Heap.pop();
            Heap.push(mat[y,x], y*width+x);
          end;
    False:
      for y:=0 to H do
        for x:=0 to W do
          if (Heap.size < count) or (mat[y,x] < Heap[0].value) then
          begin
            if (heap.size = count) then Heap.pop();
            Heap.push(mat[y,x], y*width+x);
          end;
  end;

  SetLength(Result, heap.size);
  for i:=0 to heap.size-1 do
    Result[i] := Heap[i].value;
}

function VarMulti(Mat:T2DByteArray; Count:Int32; HiLo:Boolean): CoreTypes.TByteArray; overload;
type
  THeapq = specialize HeapQueue<Byte>;
var
  W,H,i,y,x,width: Int32;
  heap:THeapq;
begin
  VarMultiBody
end;


function VarMulti(Mat:T2DIntArray; Count:Int32; HiLo:Boolean): TIntArray; overload;
type
  THeapq = specialize HeapQueue<Int32>;
var
  W,H,i,y,x,width: Int32;
  heap:THeapq;
begin
  VarMultiBody
end;


function VarMulti(Mat:T2DExtArray; Count:Int32; HiLo:Boolean): TExtArray; overload;
type
  THeapq = specialize HeapQueue<Extended>;
var
  W,H,i,y,x,width: Int32;
  heap:THeapq;
begin
  VarMultiBody
end;


function VarMulti(Mat:T2DDoubleArray; Count:Int32; HiLo:Boolean): TDoubleArray; overload;
type
  THeapq = specialize HeapQueue<Double>;
var
  W,H,i,y,x,width: Int32;
  heap:THeapq;
begin
  VarMultiBody
end;



function VarMulti(Mat:T2DFloatArray; Count:Int32; HiLo:Boolean): TFloatArray; overload;
type
  THeapq = specialize HeapQueue<Single>;
var
  W,H,i,y,x,width: Int32;
  heap:THeapq;
begin
  VarMultiBody
end;



