{*=========================================================================================|
| Imaging.pas                                                                              |
|=========================================================================================*}
function XT_ImBlurFilter(ImgArr: T2DIntegerArray; Block:Integer):  T2DIntegerArray;  
begin
  exp_ImBlurFilter(ImgArr, Block, Result);
end;

function XT_ImMedianFilter(ImgArr: T2DIntegerArray; Block:Integer):  T2DIntegerArray;  
begin
  exp_ImMedianFilter(ImgArr, Block, Result);
end;

function XT_ImBrighten(ImgArr:T2DIntegerArray; Amount:Extended; Legacy:Boolean):  T2DIntegerArray;  
begin
  exp_ImBrighten(ImgArr, Amount, Legacy, Result);
end;

function XT_ImEnhance(ImgArr:T2DIntegerArray; Enhancement:Byte; C:Extended):  T2DIntegerArray;  
begin
 exp_ImEnhance(ImgArr, Enhancement, C, Result);
end;

function XT_ImThreshold(const ImgArr:T2DIntegerArray; Threshold, Alpha, Beta:Byte; Invert:Boolean):  T2DIntegerArray;  
begin
  exp_ImThreshold(ImgArr, Threshold, Alpha, Beta, Invert, Result);
end;

function XT_ImThresholdAdaptive(const ImgArr:T2DIntegerArray; Alpha, Beta: Byte; Invert:Boolean; Method:TxThreshMethod; C:Integer):  T2DIntegerArray;  
begin
  exp_ImThresholdAdaptive(ImgArr, Alpha, Beta, Invert, Method, C, Result);
end;


function XT_ImFindContours(const ImgArr:T2DIntegerArray; Outlines:Boolean):  T2DPointArray;  
begin
  exp_ImFindContours(ImgArr,Outlines, Result);
end;

function XT_ImCEdges(const ImgArr: T2DIntegerArray; MinDiff: Integer):  TPointArray;  
begin
  exp_ImCEdges(ImgArr, MinDiff, Result);
end;

procedure XT_ImResize(var ImgArr:T2DIntegerArray; NewW, NewH: Integer; Method:TxResizeMethod);  
begin
  exp_ImResize(ImgArr, NewW, NewH, Method);
end;