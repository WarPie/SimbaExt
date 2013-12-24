{*=========================================================================================|
| Matrix.pas                                                                               |
|=========================================================================================*}
function XT_NewMatrixEx(W,H, Init:Integer): T2DIntegerArray;  
begin
  exp_NewMatrixEx(W,H, Init, Result);
end;

function XT_NewMatrix(W,H:Integer): T2DIntegerArray;  
begin
  exp_NewMatrix(W,H, Result);
end;

procedure XT_MatrixSetTPA(var Matrix:T2DIntegerArray; const TPA:TPointArray; Value:Integer; const Offset:TPoint);  
begin
  exp_MatrixSetTPA(Matrix,TPA, Value, Offset);
end;

function XT_TPAToMatrixEx(const TPA:TPointArray; Init, Value:Integer; Align:Boolean): T2DIntegerArray;  
begin
  exp_TPAToMatrixEx(TPA,Init,Value,Align, Result);
end;

function XT_TPAToMatrix(const TPA:TPointArray; Value:Integer; Align:Boolean): T2DIntegerArray;  
begin
  exp_TPAToMatrix(TPA, Value, Align, Result);
end;

function XT_NormalizeMat(const Mat:T2DIntegerArray; Alpha, Beta:Integer): T2DIntegerArray;  
begin
  exp_NormalizeMat(Mat, Alpha, Beta, Result);
end;

function XT_MatGetValues(const Mat:T2DIntegerArray; const Indices:TPointArray): TIntegerArray;  
begin
  exp_MatGetValues(Mat, Indices, Result);
end;

procedure XT_MatCombine(var Mat:T2DIntegerArray; const Mat2:T2DIntegerArray; Value:Integer);  
begin
  exp_MatCombine(Mat, Mat2, Value);
end;

function XT_MatGetCol(const Mat:T2DIntegerArray; Column:Integer): TIntegerArray;  
begin
  exp_MatGetCol(Mat, Column, Result);
end;

function XT_MatGetRow(const Mat:T2DIntegerArray; Row:Integer): TIntegerArray;  
begin
  exp_MatGetRow(Mat, Row, Result);
end;

function XT_MatGetCols(const Mat:T2DIntegerArray; FromCol, ToCol:Integer): T2DIntegerArray;  
begin
  exp_MatGetCols(Mat, FromCol, ToCol, Result);
end;

function XT_MatGetRows(const Mat:T2DIntegerArray; FromRow, ToRow:Integer): T2DIntegerArray;  
begin
  exp_MatGetRows(Mat, FromRow, ToRow, Result);
end;

function XT_MatGetArea(const Mat:T2DIntegerArray; X1,Y1,X2,Y2:Integer): T2DIntegerArray;  
begin
  exp_MatGetArea(Mat, X1,Y1,X2,Y2, Result);
end;

function XT_MatFromTIA(const Arr:TIntegerArray; Width,Height:Integer):  T2DIntegerArray;  
begin
  exp_MatFromTIA(Arr, Width, Height, Result);
end;

procedure XT_PadMatrix(var Matrix:T2DIntegerArray; HPad,WPad:Integer);  
begin
  exp_PadMatrix(Matrix,HPad,WPad);
end;

function XT_FloodFillMatrixEx(ImgArr:T2DIntegerArray; const Start:TPoint; EightWay:Boolean): TPointArray;  
begin
  exp_FloodFillMatrixEx(ImgArr, Start, EightWay, Result);
end;