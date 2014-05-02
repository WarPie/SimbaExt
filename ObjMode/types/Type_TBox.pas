(*=============================================================================|
 TBox functionality
|=============================================================================*)
function TBox.Width(): Int32;
begin
  Result := (X2-X1+1);
end;

function TBox.Height(): Int32;
begin
  Result := (Y2-Y1+1);
end;


//gives the area the box covers
function TBox.Area(): Integer;
begin
  Result := Self.Width() * Self.Height();
end;


//gives the center of the box
function TBox.Center(): TPoint;
begin
  Result.X := Self.X1 + (Self.Width() shr 1);
  Result.Y := Self.Y1 + (Self.Height() shr 1);
end;


//expand/(shrink if negative) the TBox by sizechange.
procedure TBox.Expand(const SizeChange: Integer);
begin
  Self.X1 := Self.X1 - SizeChange;
  Self.Y1 := Self.Y1 - SizeChange;
  Self.X2 := Self.X2 + SizeChange;
  Self.Y2 := Self.Y2 + SizeChange;
end;


//Return true if a point is inside the rectangle.
function TBox.Contains(Pt:TPoint): Boolean;
begin
  Result := (self.x1 <= pt.x) and (pt.x <= self.x2) and
            (self.y1 <= pt.y) and (pt.y <= self.y2);
end;  
  
  
//Return true if a this box overlaps the other box.
function TBox.Overlaps(Other:TBox): Boolean;
begin
  Result:= (self.x2 > other.x1) and (self.x1 < other.x2) and
          (self.y1 < other.y2) and (self.y2 > other.y1);
end;


//Combine two boxes - Lazy (does not expand on current)
function TBox.Combine(Other:TBox): TBox;
begin
  Result := ToBox(Min(Min(Other.X1, Other.X2), Min(Self.X1, Self.X2)),
                  Min(Min(Other.Y1, Other.Y2), Min(Self.Y1, Self.Y2)),
                  Max(Max(Other.X1, Other.X2), Max(Self.X1, Self.X2)),
                  Max(Max(Other.Y1, Other.Y2), Max(Self.Y1, Self.Y2)));
end;  


//Return a TPA of the corner points (clockwise).
function TBox.ToCoords(): TPointArray;
begin
  Result := [Point(self.x1,self.y1), Point(self.x2,self.y1), 
             Point(self.x2,self.y2), Point(self.x1,self.y2)];
end;


//Offsets the box, returns new box.
function TBox.Offset(offx,offy:Int32): TBox;
begin
  Result := [self.x1+offx, self.y1+offy, self.x2+offx, self.y2+offy];
end;