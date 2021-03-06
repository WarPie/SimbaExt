{!DOCTOPIC}{ 
  Type � TBoxArray
}


{!DOCREF} {
  @method: function TBoxArray.Len(): Int32;
  @desc: Returns the length of the array. Same as 'Length(arr)'
}
function TBoxArray.Len(): Int32;
begin
  Result := Length(Self);
end;


{!DOCREF} {
  @method: function TBoxArray.IsEmpty(): Boolean;
  @desc: Returns True if the array is empty. Same as 'Length(arr) = 0'
}
function TBoxArray.IsEmpty(): Boolean;
begin
  Result := Length(Self) = 0;
end;


{!DOCREF} {
  @method: procedure TBoxArray.Append(const B:TBox);
  @desc: Add another string to the array
}
procedure TBoxArray.Append(const B:TBox);
var
  l:Int32;
begin
  l := Length(Self);
  SetLength(Self, l+1);
  Self[l] := B;
end;


{!DOCREF} {
  @method: procedure TBoxArray.Insert(idx:Int32; Value:TBox);
  @desc: 
    Inserts a new item `value` in the array at the given position. If position `idx` is greater then the length, 
    it will append the item `value` to the end. If it's less then 0 it will substract the index from the length of the array.[br]
    
    `Arr.Insert(0, x)` inserts at the front of the list, and `Arr.Insert(length(a), x)` is equivalent to `Arr.Append(x)`.
}
procedure TBoxArray.Insert(idx:Int32; Value:TBox);
var l:Int32;
begin
  l := Length(Self);
  if (idx < 0) then
    idx := math.modulo(idx,l);

  if (l <= idx) then begin
    self.append(value);
    Exit();
  end;

  SetLength(Self, l+1);
  MemMove(Self[idx], self[idx+1], (L-Idx)*SizeOf(TBox));
  Self[idx] := value;
end; 


{!DOCREF} {
  @method: procedure TBoxArray.Del(idx:Int32);
  @desc: Removes the element at the given index c'idx'
}
procedure TBoxArray.Del(idx:Int32);
var i,l:Int32;
begin
  l := Length(Self);
  if (l <= idx) or (idx < 0) then 
    Exit();
  if (L-1 <> idx) then
    MemMove(Self[idx+1], self[idx], (L-Idx)*SizeOf(TBox));
  SetLength(Self, l-1);
end;


{!DOCREF} {
  @method: procedure TBoxArray.Remove(Value:TBox);
  @desc: Removes the first element from left which is equal to c'Value'
}
procedure TBoxArray.Remove(Value:TBox);
begin
  Self.Del( Self.Find(Value) );
end;


{!DOCREF} {
  @method: function TBoxArray.Pop(): TBox;
  @desc: Removes and returns the last item in the array
}
function TBoxArray.Pop(): TBox;
var H:Int32;
begin
  H := high(Self);
  Result := Self[H];
  SetLength(Self, H);
end;


{!DOCREF} {
  @method: function TBoxArray.PopLeft(): TBox;
  @desc: Removes and returns the first item in the array
}
function TBoxArray.PopLeft(): TBox;
begin
  Result := Self[0];
  MemMove(Self[1], Self[0], SizeOf(Int32)*Length(Self));
  SetLength(Self, High(self));
end;


{!DOCREF} {
  @method: function TBoxArray.Slice(Start,Stop: Int32; Step:Int32=1): TBoxArray;
  @desc:
    Slicing similar to slice in Python, tho goes from 'start to and including stop'
    Can be used to eg reverse an array, and at the same time allows you to c'step' past items.
    You can give it negative start, and stop, then it will wrap around based on length(..)
    
    If c'Start >= Stop', and c'Step <= -1' it will result in reversed output.
    
    [note]Don't pass positive c'Step', combined with c'Start > Stop', that is undefined[/note]
}
function TBoxArray.Slice(Start:Int64=DefVar64; Stop: Int64=DefVar64; Step:Int64=1): TBoxArray;
begin
  if (Start = DefVar64) then
    if Step < 0 then Start := -1
    else Start := 0;       
  if (Stop = DefVar64) then 
    if Step > 0 then Stop := -1
    else Stop := 0;
    
  if Step = 0 then Exit;
  try Result := exp_slice(Self, Start,Stop,Step);
  except SetLength(Result,0) end;
end;


{!DOCREF} {
  @method: procedure TBoxArray.Extend(Arr:TBoxArray);
  @desc: Extends the array with an array
}
procedure TBoxArray.Extend(Arr:TBoxArray);
var L:Int32;
begin
  L := Length(Self);
  SetLength(Self, Length(Arr) + L);
  MemMove(Arr[0],Self[L],Length(Arr)*SizeOf(TBox));
end;  


{!DOCREF} {
  @method: function TBoxArray.Find(Value:TBox): Int32;
  @desc: Searces for the given value and returns the first position from the left.
}
function TBoxArray.Find(Value:TBox): Int32;
begin
  Result := exp_Find(Self,[Value]);
end;


{!DOCREF} {
  @method: function TBoxArray.Find(Sequence:TBoxArray): Int32; overload;
  @desc: Searces for the given sequence and returns the first position from the left.
}
function TBoxArray.Find(Sequence:TBoxArray): Int32; overload;
begin
  Result := exp_Find(Self,Sequence);
end;



{!DOCREF} {
  @method: function TBoxArray.FindAll(Value:TBox): TIntArray;
  @desc: Searces for the given value and returns all the position where it was found.
}
function TBoxArray.FindAll(Value:TBox): TIntArray;
begin
  Result := exp_FindAll(Self,[value]);
end;


{!DOCREF} {
  @method: function TBoxArray.FindAll(Sequence:TBoxArray): TIntArray; overload;
  @desc: Searces for the given sequence and returns all the position where it was found.
}
function TBoxArray.FindAll(Sequence:TBoxArray): TIntArray; overload;
begin
  Result := exp_FindAll(Self,sequence);
end;


{!DOCREF} {
  @method: function TBoxArray.Contains(val:TBox): Boolean;
  @desc: Checks if the arr contains the given value c'val'
}
function TBoxArray.Contains(val:TBox): Boolean;
begin
  Result := Self.Find(val) <> -1;
end;


{!DOCREF} {
  @method: function TBoxArray.Count(val:TBox): Int32;
  @desc: Counts all the occurances of the given value c'val'
}
function TBoxArray.Count(val:TBox): Int32;
begin
  Result := Length(Self.FindAll(val));
end;



{!DOCREF} {
  @method: procedure TBoxArray.Sort(key:TSortKey=sort_Default);
  @desc: Sorts the array [not supported]
}
procedure TBoxArray.Sort(key:TSortKey=sort_Default);
begin
  //case key of
  //  sort_default, sort_lex: se.SortTSA(Self,IgnoreCase);
  //  sort_logical: se.SortTSANatural(Self);
  //else 
  //  WriteLn('TSortKey not supported');
  //end;
  WriteLn('TBoxArray sorting is not supported yet');
end;


{!DOCREF} {
  @method: function TStringArray.Sorted(key:TSortKey=sort_Default; IgnoreCase:Boolean=False): TStringArray;
  @desc: Sorts and returns a copy of the array [not supported]
}
function TBoxArray.Sorted(key:TSortKey=sort_Default): TStringArray;
begin
  //Result := Self.Slice();
  //case key of
  //  sort_default, sort_lex: se.SortTSA(Result,IgnoreCase);
  //  sort_logical: se.SortTSANatural(Result);
  //else 
  //  WriteLn('TSortKey not supported');
  //end;
  WriteLn('TBoxArray sorting is not supported yet');
end;




{!DOCREF} {
  @method: function TBoxArray.Reversed(): TBoxArray;
  @desc: Creates a reversed copy of the array
}
function TBoxArray.Reversed(): TBoxArray;
begin
  Result := Self.Slice(,,-1);
end;


{!DOCREF} {
  @method: procedure TBoxArray.Reverse();
  @desc:  Reverses the array 
}
procedure TBoxArray.Reverse();
begin
  Self := Self.Slice(,,-1);
end;




{=============================================================================}
// The functions below this line is not in the standard array functionality
//
// By "standard array functionality" I mean, functions that all standard
// array types should have.
{=============================================================================}





