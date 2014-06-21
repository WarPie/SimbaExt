


function Sqr(mat: T2DExtended): T2DExtended; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DDouble): T2DDouble; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DSingle): T2DSingle; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DUInt64): T2DUInt64; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DInt64): T2DInt64; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DUInt32): T2DUInt32; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DInt32): T2DInt32; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DUInt8): T2DInt32; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;



function Sqr(mat: T2DInt8): T2DInt32; overload; 
var W,H,i,j: Int32; 
begin 
  H := High(mat);
  if (H = -1) then Exit(); 
  W := High(mat[0]);
  SetLength(Result, H+1,W+1);
  for i:=0 to H do
    for j:=0 to W do
      Result[i][j] := Sqr(Mat[i][j]);
end;


