{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2014, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
 
 To-do: avoid FFI for performance sensitive methods
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}

type 
  T_WRAP = packed record
    ref: T_TYPE;
    items: Pointer;
  end;


function ARRAY_CREATE(var rec:T_WRAP; data:Pointer; threadId:NativeInt): T_WRAP; cdecl;
begin
  with Result do
  begin
    ref := T_TYPE.Create(data, T_COMPARE, True);
    items := @(ref.items);
    ClassManager.Add(threadId, ref as TObject);
  end;
end;

procedure ARRAY_FREE(var rec:T_WRAP; threadId:NativeInt); cdecl;
begin
  with rec do
  begin
    ClassManager.Release(threadId, ref as TObject);
    ref := nil;
    items := nil;
  end;
end;

function ARRAY_LENGTH(var rec:T_WRAP): SizeInt; cdecl;
begin
  with rec do Result := ref.Length();
end;

function ARRAY_HIGH(var rec:T_WRAP): SizeInt; cdecl;
begin
  with rec do Result := ref.Length();
end;

function ARRAY_COPY(var rec:T_WRAP): T_WRAP; cdecl;
begin
  with rec do
  begin
    Result.ref := ref.Copy() as T_TYPE;
    Result.items := @(Result.ref.items);
  end;
end;

procedure ARRAY_APPEND(var rec:T_WRAP; item:T); cdecl;
begin
  with rec do
  begin
    ref.Append(item);
    items := @(ref.items);
  end;
end;

procedure ARRAY_EXTEND(var rec:T_WRAP; arr:T_WRAP); cdecl;
begin
  with rec do
  begin
    ref.Extend(arr.ref);
    items := @(ref.items);
  end;
end;

function ARRAY_INDEXOF(var rec:T_WRAP; item:T): Int32; cdecl;
begin
  with rec do Result := ref.IndexOf(item);
end;

procedure ARRAY_DELETE(var rec:T_WRAP; idx:Int32); cdecl;
begin
  with rec do
  begin
    ref.Delete(idx);
    items := @(ref.items);
  end;
end;

procedure ARRAY_REMOVE(var rec:T_WRAP; item:T); cdecl;
begin
  with rec do
  begin
    ref.Remove(item);
    items := @(ref.items);
  end;
end;

function ARRAY_POP(var rec:T_WRAP): T; cdecl;
begin
  with rec do
  begin
    Result := ref.Pop();
    items := @(ref.items);
  end;
end;

function ARRAY_POP2(var rec:T_WRAP; idx:Int32): T;
begin
  with rec do
  begin
    Result := ref.Pop(idx);
    items := @(ref.items);
  end;
end;

procedure ARRAY_INSERT(var rec:T_WRAP; idx:Int32; value:T); cdecl;
begin
  with rec do
  begin
    ref.Insert(idx, value);
    items := @(ref.items);
  end;
end;

function ARRAY_SLICE(var rec:T_WRAP; start, stop, step:Int32): T_WRAP; cdecl;
begin
  with rec do
  begin
    Result.ref := ref.Slice(start,stop,step) as T_TYPE;
    Result.items := @(Result.ref.items);
  end;
end;

procedure ARRAY_SORT(var rec:T_WRAP); cdecl;
begin
  with rec do ref.Sort();
end;


//--- specialize in numerics ---------------------------------\\
function ARRAY_MIN(var rec:T_WRAP): T; cdecl;
begin
  with rec do Result := ref.Min();
end;

function ARRAY_MAX(var rec:T_WRAP): T; cdecl;
begin
  with rec do Result := ref.Max();
end;

function ARRAY_SUM(var rec:T_WRAP): TOvf; cdecl;
begin
  with rec do Result := ref.Sum();
end;

function ARRAY_MEAN(var rec:T_WRAP): Double; cdecl;
begin
  with rec do Result := ref.Mean();
end;

function ARRAY_MEDIAN(var rec:T_WRAP): T; cdecl;
begin
  with rec do Result := ref.Median();
end;

function ARRAY_VARIANCE(var rec:T_WRAP): Double; cdecl;
begin
  with rec do Result := ref.Variance();
end;

function ARRAY_STDEV(var rec:T_WRAP): Double; cdecl;
begin
  with rec do Result := ref.Stdev();
end;

function ARRAY_MODE(var rec:T_WRAP): T; cdecl;
begin
  with rec do Result := ref.Mode();
end;

function ARRAY_QSELECT(var rec:T_WRAP; kth:Int32): T; cdecl;
begin
  with rec do Result := ref.Quickselect(kth);
end;




