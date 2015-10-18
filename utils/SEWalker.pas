program new;
{$I SimbaExt/SimbaExt.simba}
{$I SimbaExt/Utils.simba}
{$f-}
(*
 Copyright (2014) Jarl <slacky> Holta
 Requires the SimbaExt version from: "08 July 14"  or later
 Requires the [250x250] map pack from http://slackworld.net/downloads/
 - Extract it in include folder, and name the extracted folder "OSRS_Map_250x250"
*)

const
  SEW_Path = IncludesPath + 'SimbaExt_beta\Utils\maps\OSRS_Map_250x250\';
  SEW_Extension = '.png';
  SEW_Map_Size: TSize2D = [250,250];
  SEW_Rows = 28;
  SEW_Cols = 30;

  SEW_MMCenter: TPoint = [648, 83];
  SEW_MMRad: Int8 = 75;
  SEW_Outer: Int8 = 68;
  SEW_Inner: Int8 = 42;

type
  SEW_SafeProc = Procedure();

type
  SEWalker = record
    TopLeft: TPoint;
    Map: TRafBitmap;
    Custom: Boolean;
    Initalized:Boolean;
    ETimeOut: Int32;
    DeepScan: Boolean;
    SafeProc: SEW_SafeProc;
    SkipDist: Single;
    NoBlindWalk: Boolean;
  end;



procedure SEWalker.Init(Area: TBox);
begin
  Self.Custom := False;
  Self.TopLeft := Self.AssambleMaps( Self.GetArea(Area) );
  Self.Initalized := True;
  Self.ETimeOut := 10000;
  Self.SkipDist := 4;
end;


procedure SEWalker.Init(Maps:TStringArray); overload;
begin
  Self.Custom := False;
  Self.TopLeft := Self.AssambleMaps(Maps);
  Self.Initalized := True;
  Self.ETimeOut := 10000;
  Self.SkipDist := 4;
end;


procedure SEWalker.InitCustom(MapPath:String);
begin
  Self.Custom := True;
  Self.Map.Open(MapPath);
  Self.TopLeft := Point(0,0);
  Self.Initalized := True;
  Self.ETimeOut := 10000;
  Self.SkipDist := 4;
end;


(*
  Must call once you are done walking to avoid Leak.
*)
procedure SEWalker.Free();
begin
  Self.Map.Free();
end;


(*
 To avoid going in to an eternal loop for some reason,
 say if your char pings out.. this function sets the number
 of MS before the "walker" times out.

 > Default: 10000ms
*)
procedure SEWalker.SetTimeout(TimeMS:Int32);
begin
  Self.ETimeOut := TimeMS;
end;

(*
  For every step in the path we take this procedure will
  be called.. So it can call some random-check procedure, or
  just a wait procedure..

  > Default: nil
*)
procedure SEWalker.SetSafeProc(Proc:SEW_SafeProc);
begin
  Self.SafeProc := Proc;
end;

(*
  if True that means whenever the GetMyPos-function fails
  it will just click the next corrdinate in "Path" and assume
  averythings fine.

  > Default: True
*)
procedure SEWalker.SetBlindWalk(Disallow:Boolean=False);
begin
  Self.NoBlindWalk := Disallow;
end;

(*
  SetDeepScan to True means that you will search trough
  the whole image. This is slow and almost never needed.

  Custom maps however always scans the whole custom map.

  > Default: False (True if custom-map)
*)
procedure SEWalker.SetDeepScan(Deep:Boolean=False);
begin
  if Self.Custom then
    RaiseException(erException, 'SEWalker: Custom maps does not support this feature');
  Self.DeepScan := Deep;
end;


(*
  SetSkipClose sets how close to the resulting pos
  you have to be before it click the next coordinate.

  > Default: 4 (px)
*)
procedure SEWalker.SetSkipClose(Dist:Single);
begin
  SkipDist := Dist;
end;



{---| Implementation |---------------------------------------------------------}
(*
  Get the compass angle (Radians)
*)
function SEWalker.CompassAngle(): Single;
var
  A,B: TPoint; M:TPoint = [561,20];
  i:Integer;
  ATPA:T2DPointArray;
  TPA:TPointArray;
  Filter:TBox = [554,13,568,27];
begin
  FindColorsSpiralTolerance(M.x,M.y,TPA, 920735, 543,3,578,38, 1);
  ATPA := TPA.Cluster(3,True);
  SetLength(TPA, 0);
  for i:=0 to High(ATPA) do
    if TPA.Len() < 3 then begin
      A := ATPA[i].Pop();
      if not Filter.Contains(A) then TPA.Append(A);
    end;
  se.LongestPolyVector(TPA, A,B);
  TPA.Remove(A);
  TPA.Remove(B);
  Result := se.Modulo(ArcTan2(-(M.y-TPA[0].y),(M.x-TPA[0].x)),PI*2);
end;



(*
  Dirty search for minimap flag (it's all that's needed)
*)
function SEWalker.FlagExists(): Boolean;
var
  TPA: TPointArray;
  ATPA: T2DPointArray;
  i: Integer;
begin
  Result := False;
  if FindColorsTolerance(TPA, 255, SEW_MMCenter.x-SEW_Outer, SEW_MMCenter.y-SEW_Outer,
                                   SEW_MMCenter.x+SEW_Outer, SEW_MMCenter.y+SEW_Outer, 1) then
  begin
    ATPA := SplitTPA(TPA,1);
    for i := 0 to High(ATPA) do
      if (Length(ATPA[i]) >= 15) AND (Length(ATPA[i]) <= 50) then
        Result := True;
  end;
end;


(*
  Gathers the needed pieces from a the given TBox.
*)
function SEWalker.GetArea(Area:TBox): TStringArray;
var
  upper,lower:TPoint;
  x,y:Int32;
begin
  Area.Expand(SEW_MMRad);

  Upper.X := Max(0,Area.x1) div SEW_Map_Size.W;
  Upper.Y := Max(0,Area.y1) div SEW_Map_Size.H;
  Lower.X := Max(0,Area.x2) div SEW_Map_Size.W;
  Lower.Y := Max(0,Area.y2) div SEW_Map_Size.H;
  for y:=Upper.y to Lower.y do
    for x:=Upper.x to Lower.x do
      Result.Append(ToStr(y)+'_'+ToStr(x));
end;


(*
  Converts the given pieces in to one big map.
*)
function SEWalker.AssambleMaps(Maps:TStringArray): TPoint;
var
  lx,ly,sx,sy,i:Int32;
  xy:TStringArray;
  tpa:TPointArray;
  tmp:TRafBitmap;
  Pos:TPoint;
begin
  LX := $FFFFFF;
  LY := $FFFFFF;
  for i:=0 to High(Maps) do
  begin
    xy := Maps[i].Split('_');
    TPA.Append( [StrToInt(xy[1]), StrToInt(xy[0])] );
    LY := Min(TPA[i].y, LY);
    LX := Min(TPA[i].x, LX);
  end;
  Result := Point(LX * SEW_Map_Size.W, LY * SEW_Map_Size.H);

  Map.Create(0,0);
  for i:=0 to High(TPA) do
  begin
    SY := TPA[i].y;
    SX := TPA[i].x;
    tmp.Open(SEW_Path + Maps[i] + SEW_Extension);
    Pos := Point((SX-LX) * SEW_Map_Size.W, (SY-LY) * SEW_Map_Size.H);
    Map.Draw(tmp, Pos, True);
  end;
  tmp.Free();
end;


(*
 Method is used to safely call the given safeproc.
*)
procedure SEWalker.CallSafeProc();
begin
  if Self.SafeProc <> nil then
    try
      Self.SafeProc();
    except
      RaiseException(erException, 'SEWalker: Failed while calling SafeProc');
    end;
end;


(*
 GetCorrelationInfo first extract the `n` highest peaks, then using those peaks
 it then cluster them, and inspects each group for the max peak.
 Returns the point where the peak is highest.

 //Note to self: Look once more.
*)
function SEWalker.GetCorrelationInfo(Mat:TFloatMatrix; n:Int32; out midpt:TPoint): Double;
var
  i,j:Int32;
  ATPA:T2DPointArray;
  TPA:TPointArray;
  Sums:TExtArray;
begin
  TPA := Mat.ArgMax(n);
  if (Length(TPA) = 0) then Exit();
  ATPA := TPA.Cluster(1,False);
  SetLength(Sums, Length(ATPA));
  for i:=0 to High(ATPA) do
    Sums[i] := Mat.Get(ATPA[i]).VarMax();
  j := Sums.ArgMax();
  Result := Sums[j];
  midpt := ATPA[j][Mat.Get(ATPA[j]).ArgMax()];
end;


(*
 Scans trough the whole global map for our current position.
*)
function SEWalker.GetMyPos(): TPoint;
const
  angles = [-10, 0, 10];
var
  i, size: Int32;
  BMP,RotatedBMP:TRafBitmap;
  Mid: TPoint;
  Corr: TFloatMatrix;
  values:TDoubleArray;
  PTS: TPointArray;
begin
  BMP.FromClient(SEW_MMCenter.x - SEW_outer, SEW_MMCenter.y - SEW_outer,
                 SEW_MMCenter.x + SEW_outer, SEW_MMCenter.y + SEW_outer);

  BMP.LazyRotate(-Self.CompassAngle()+PI/2, False);

  mid := Point(SEW_outer, SEW_outer);
  Size := SEW_inner * 2 + 1;

  SetLength(PTS,Length(Angles));
  for i:=0 to High(Angles) do
  begin
    RotatedBMP := BMP.Rotate(Radians(Angles[i]), False);
    RotatedBMP.LazyCrop(mid.x - SEW_inner, mid.y - SEW_inner,
                        mid.x + SEW_inner, mid.y + SEW_inner);

    Corr := se.MatchTemplate(Map, RotatedBMP, TM_CCOEFF_NORMED);
    Values.append(GetCorrelationInfo(Corr, 50, PTS[i]));
    RotatedBMP.Free();
  end;
  Mid := PTS[Values.ArgMax()];

  bmp.Free();
  Mid.Offset(Point( SEW_inner+TopLeft.x, SEW_inner+TopLeft.y ));
  Result := Mid;
end;


(*
 Scans trough only a part of the global map for our current position.
 The part which we scans trough is based on "AssumedPos", and the radius scanned
 trough is the parameter "Radius".
*)
function SEWalker.GetMyPos(AssumedPos:TPoint; Radius:Int32=160): TPoint; overload;
const
  angles = [-10, 0, 10];
var
  i, size: Int32;
  Part,BMP,RotatedBMP:TRafBitmap;
  Mid,low,hei: TPoint;
  Corr: TFloatMatrix;
  values:TDoubleArray;
  PTS: TPointArray;
begin
  low.x := Max(0, AssumedPos.x - Radius - TopLeft.x);
  low.y := Max(0, AssumedPos.y - Radius - TopLeft.y);
  hei.x := Min(Map.Width,  AssumedPos.x + Radius - TopLeft.x);
  hei.y := Min(Map.Height, AssumedPos.y + Radius - TopLeft.y);
  Part := Map.Crop(low.x, low.y, hei.x, hei.y);

  BMP.FromClient(SEW_MMCenter.x - SEW_outer, SEW_MMCenter.y - SEW_outer,
                 SEW_MMCenter.x + SEW_outer, SEW_MMCenter.y + SEW_outer);

  BMP.LazyRotate(-Self.CompassAngle()+PI/2, False);
  BMP.Debug();

  Mid := Point(SEW_outer, SEW_outer);
  Size := SEW_inner * 2 + 1;

  SetLength(PTS,Length(Angles));
  for i:=0 to High(Angles) do
  begin
    RotatedBMP := BMP.Rotate(Radians(angles[i]), False);
    RotatedBMP.LazyCrop(mid.x - SEW_inner, mid.y - SEW_inner,
                        mid.x + SEW_inner, mid.y + SEW_inner);

    Corr := se.MatchTemplate(Part, RotatedBMP, TM_CCOEFF_NORMED);
    Values.Append(GetCorrelationInfo(Corr, 50, PTS[i]));
    RotatedBMP.Free();
  end;
  Mid := PTS[Values.ArgMax()];

  BMP.Free();
  Part.Free();

  Mid.Offset(Point( SEW_inner+TopLeft.x+low.x, SEW_inner+TopLeft.y+low.y ));
  Result := Mid;
end;


(*
 Converts the point to a point around center based around "Mid"
*)
function SEWalker.GetRelativePos(Mid,Off:TPoint): TPoint;
begin
  Result := Off;
  Result.Offset(Point(-Mid.x, -Mid.y));
end;


(*
 Gets the current pos using the selected method (global-, or "area"-search)
*)
function SEWalker.__GetPos(var Pos:TPoint; Goal:TPoint): Single;
begin
  case DeepScan of
    True:  Pos := Self.GetMyPos();
    False: Pos := Self.GetMyPos(Goal);
  end;

  Result := Pos.DistanceTo(Goal);
end;


(*
 Walks to the given point on the global map.
*)
procedure SEWalker.WalkTo(Goal:TPoint; Prev:TPoint=[-1,-1]);
var
  i:Int32;
  Failed: Boolean;
  Start,PT,Mark: TPoint;
  Dist2,PrevDist: Single;
  T: Double;
begin
  if not( Initalized ) then
     RaiseException(erException, 'SEWalker: Not initalized');

  Dist2 := Self.__GetPos(Start,Goal);
  for i:=0 to 5 do
    if (Dist2 > SEW_MMRad) then begin
      Dist2 := Self.__GetPos(Start,Goal);
      Failed := True;
      Wait(50);
    end else begin
      Failed := False;
      Break;
    end;

  if Failed then
    if NoBlindWalk then
      RaiseException(erException, 'SEWalker: Distance to `Goal` is exceeding boundaries: '+
                     '"'+ToStr(Start)+'", "'+ ToStr(Goal) +'"')
    else begin
      while Self.FlagExists() do Wait(5);
      if Prev.EQ([-1,-1]) then
        RaiseException(erException, 'SEWalker: Distance to `Goal` is exceeding boundaries: '+
                                    '"'+ToStr(Start)+'", "'+ ToStr(Goal) +'"');
      Start := Prev;
      Dist2 := Start.DistanceTo(Goal);
    end;

  PT := Self.GetRelativePos(Start,Goal);
  if PT.DistanceTo(Point(0,0)) > SEW_MMRad then
    Exit();
  PT := RotatePoint(PT,-Self.CompassAngle()+PI/2,0,0);
  PT.Offset(SEW_MMCenter);

  Mouse.Click(PT, mbLeft);

  T := MarkTime();
  while (Dist2 > SkipDist) and Self.FlagExists() do
  begin
    case DeepScan of
      True:  Dist2 := Self.GetMyPos().DistanceTo(Goal);
      False: Dist2 := Self.GetMyPos(Goal).DistanceTo(Goal)
    end;
    if (T - MarkTime()) > Self.ETimeOut then
      RaiseException(erException, 'SEWalker: Timed out while walking to '+
                                  '"'+ToStr(Goal)+'", from "'+ToStr(Start)+'"');
  end;

  for i:=1 to 3 do
    if (Dist2 > SkipDist) then Wait(100);
end;


(*
 Function is used to validate a path. It ensures that each point is reachable
 from the previous point.
*)
function SEWalker.ValidatePath(Path:TPointArray): Boolean;
var i:Int32;
begin
  for i:=1 to High(Path) do
    if Path[i-1].DistanceTo(Path[i]) > SEW_Outer then
    begin
      WriteLn('SEWalker: "Path['+ToStr(i-1)+']" to "Path['+ToStr(i)+']" is greater then MaxDist: '+ToStr(SEW_Outer));
      Exit(False);
    end;
  Result := True;
end;


(*
 Walks a path..
*)
procedure SEWalker.Walk(Path:TPointArray);
var
  i,j,ii,halfdist,hi:Int32;
  Pos:TPoint;
begin
  if not( Initalized ) then
     RaiseException(erException, 'SEWalker: Not initalized');

  if not(Self.ValidatePath(Path)) then
     RaiseException(erException, 'SEWalker: Invalid Path');

  HalfDist := (SEW_Inner div 2);
  i := 0;
  hi := High(Path);
  while i <= hi do
  begin
    for j:=0 to 2 do
    begin
      Pos := Self.GetMyPos(Path[i]);
      if (i < hi) then
        if Pos.DistanceTo(Path[i+1]) < Pos.DistanceTo(Path[i]) then
          Inc(i);

      if (Pos.DistanceTo(Path[i]) > HalfDist) or (j=0) then
        Self.WalkTo(Path[i], Pos)
      else
        Break;
    end;

    Self.CallSafeProc();
    Inc(i);
  end;
end;


(*
var
  Walker:SEWalker;
  Path:TPointArray;
begin
  //Path starts at varroc west bank (door)
  Path := [Point(4559, 2959), Point(4600, 2959), Point(4635, 2963), Point(4655, 2955), Point(4678, 2939), Point(4720, 2957), Point(4755, 2962), Point(4791, 2963), Point(4834, 2960), Point(4814, 2953), Point(4807, 2925), Point(4782, 2904), Point(4749, 2904), Point(4718, 2929), Point(4705, 2961), Point(4687, 2981), Point(4660, 2975), Point(4628, 2966), Point(4600, 2959), Point(4559, 2959)];
  Walker.Init(Path.Bounds());
  Walker.SetSkipClose(10);
  Walker.Walk(Path);
  Walker.Free();
end.*)