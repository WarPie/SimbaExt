Unit ColorHash;
{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=]
 Copyright (c) 2013, Jarl K. <Slacky> Holta || http://github.com/WarPie
 All rights reserved.
 For more info see: Copyright.txt
[=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=}
interface

uses
  Classes, SysUtils;

type
  ColorLAB = Record
    L: Single;
    A: Single;
    B: Single;
  end;

  ColorLABEntry = Record
    Key: Integer;
    Value: ColorLAB;
    Isset: Boolean;
  end;
  
  ColorLABTable = Array of ColorLABEntry;
  
  //----------------------------------\\
  //--------<Integer, ColorLAB>-------\\
  ColorDict = class(TObject)
  private
    Table: ColorLABTable;
    Len: Integer;
  public
    constructor Create(Size:Integer);
    function Get(Key:Integer; var Res:ColorLAB): Boolean;  Inline;
    function Add(Key:Integer; Value:ColorLAB): Boolean;    Inline;
    Destructor Destroy; override;
  end;
 
//--------------------------------------------------
implementation

uses 
  CoreMath;

constructor ColorDict.Create(Size:Integer);
begin
  inherited Create;
  Size := NextPrime( Trunc(Size*1.2) );
  SetLength(Table, Size);
  Len := Size;
end;

destructor ColorDict.Destroy;
begin
  inherited Destroy;
  SetLength(Table, 0);
end;

//Gets the LAB-color from the given key.. Result = False if it does not exist.
function ColorDict.Get(Key:Integer; var Res:ColorLAB): Boolean;
var
  Hash,I:Integer;
begin
  Result := False;
  Hash := (Key mod Len);
  for i:=0 to Len-1 do
  begin
    if (Table[Hash].Isset = False) or (Table[Hash].Key = Key) then
      Break;
    Inc(Hash);
    if (Hash = Len) then Hash := 0;
  end;
  if (Table[Hash].Isset = False) then Exit;

  Res := Table[Hash].Value;
  Result := True;
end;


//Adds a color to the dictionary at the given key
function ColorDict.Add(Key:Integer; Value:ColorLAB): Boolean;
var
  Hash,i:Integer;
begin
  Hash := (Key mod Len);
  for i:=0 to Len-1 do
  begin
    if (Table[Hash].Isset <> True) or (Table[Hash].Key = Key) then
      Break;
    Inc(Hash);
    if (Hash = Len) then Hash := 0;
  end;
  
  if ((Table[Hash].Key <> Key) and (Table[Hash].Isset=True)) then 
    Exit(False); //The hashmap is filled :| ...
  
  Table[Hash].Value := Value;
  if (Table[Hash].Isset=False) then
  begin
    Table[Hash].Key := Key;
    Table[Hash].Isset := True;
  end;
  Result := True;
end;

end.
