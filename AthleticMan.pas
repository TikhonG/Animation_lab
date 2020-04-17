unit AthleticMan;

interface

uses
  Vcl.ExtCtrls, Vcl.Graphics, System.Classes, Vcl.Controls, Vcl.Forms;

const
  NumberOfStates = 35; // ���������� ���������

type
  TJumpingMan = class
    State: Integer;
    Scale: Real;
  private
    Owner: TForm;
    X, Y: Integer;
    Timer: TTimer;
    Canvas: TCanvas;
    procedure DrawLine(const X1, Y1, X2, Y2: Integer);
    procedure DrawCircle(const Rad, X, Y: Integer);
    function GetX(const X: Integer): Integer;
    function GetY(const Y: Integer): Integer;
    procedure TimerOnTimer(Sender: TObject);
  public
    constructor Create(const AOwner: TForm);
    procedure Draw(const X, Y: Integer);
    procedure StartAnimation;
    procedure PauseAnimation;
    procedure StopAnimation;
  end;

implementation

procedure TJumpingMan.DrawLine(const X1, Y1, X2, Y2: Integer);
begin
  Self.Canvas.MoveTo(X1, Y1);
  Self.Canvas.LineTo(X2, Y2);
end;

function TJumpingMan.GetX(const X: Integer): Integer;
begin
  Result := Self.X + Trunc(X * Scale);
end;

function TJumpingMan.GetY(const Y: Integer): Integer;
begin
  Result := Self.Y + Trunc(Y * Scale);
end;

procedure TJumpingMan.PauseAnimation;
begin
  Self.Timer.Enabled := False;
end;

procedure TJumpingMan.DrawCircle(const Rad, X, Y: Integer);
begin
  Self.Canvas.Ellipse(X - Rad, Y - Rad, X + Rad, Y + Rad);
end;

procedure TJumpingMan.TimerOnTimer(Sender: TObject);
begin
  Inc(Self.State);
  if Self.State >= NumberOfStates then
    State := 0;
  Self.Owner.Invalidate;
end;

constructor TJumpingMan.Create(const AOwner: TForm);
begin
  Self.Owner := AOwner;
  Self.Canvas := AOwner.Canvas;
  Self.Scale := 1.0;
  Self.State := 0;

  Self.Timer := TTimer.Create(AOwner);
  Self.Timer.Enabled := False;
  Self.Timer.Interval := 200;
  Self.Timer.OnTimer := TimerOnTimer;
end;

procedure TJumpingMan.Draw(const X, Y: Integer);
begin
  Self.X := X;
  Self.Y := Y;
  case State of
    0:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(40), GetY(250)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(80), GetY(230)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;
    1:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(20), GetY(230)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(100), GetY(210)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;
    2:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(0), GetY(190)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(120), GetY(170)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;

    3:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(20), GetY(110)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(100), GetY(80)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;

    4:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(40), GetY(90)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(80), GetY(60)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;

    5:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(120), GetY(110)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(100), GetY(80)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;

    6:
      begin
        DrawLine(GetX(60), GetY(150), GetX(60), GetY(230)); // ��������
        DrawLine(GetX(60), GetY(170), GetX(140), GetY(150)); // ���� �����
        DrawLine(GetX(60), GetY(170), GetX(120), GetY(120)); // ���� ������
        DrawLine(GetX(60), GetY(230), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(230), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(60), GetY(130)); // ������
      end;

    7:
      begin
        DrawLine(GetX(70), GetY(160), GetX(50), GetY(240)); // ��������
        DrawLine(GetX(60), GetY(190), GetX(140), GetY(210)); // ���� �����
        DrawLine(GetX(60), GetY(190), GetX(120), GetY(180)); // ���� ������
        DrawLine(GetX(50), GetY(240), GetX(60), GetY(300));
        DrawLine(GetX(60), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(50), GetY(240), GetX(80), GetY(290));
        DrawLine(GetX(80), GetY(290), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(75), GetY(145)); // ������
      end;

    8:
      begin
        DrawLine(GetX(90), GetY(170), GetX(40), GetY(250)); // ��������
        DrawLine(GetX(75), GetY(190), GetX(140), GetY(220)); // ���� �����
        DrawLine(GetX(75), GetY(190), GetX(120), GetY(200)); // ���� ������
        DrawLine(GetX(40), GetY(250), GetX(70), GetY(300));
        DrawLine(GetX(70), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(40), GetY(250), GetX(90), GetY(280));
        DrawLine(GetX(90), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(100), GetY(150)); // ������
      end;

    9:
      begin
        DrawLine(GetX(90), GetY(180), GetX(40), GetY(260)); // ��������
        DrawLine(GetX(75), GetY(200), GetX(130), GetY(250)); // ���� �����
        DrawLine(GetX(75), GetY(200), GetX(110), GetY(230)); // ���� ������
        DrawLine(GetX(40), GetY(260), GetX(75), GetY(300));
        DrawLine(GetX(75), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(40), GetY(260), GetX(95), GetY(280));
        DrawLine(GetX(95), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(100), GetY(160)); // ������
      end;

    10:
      begin
        DrawLine(GetX(90), GetY(190), GetX(40), GetY(270)); // ��������
        DrawLine(GetX(75), GetY(210), GetX(110), GetY(270)); // ���� �����
        DrawLine(GetX(75), GetY(210), GetX(90), GetY(250)); // ���� ������
        DrawLine(GetX(40), GetY(270), GetX(80), GetY(300));
        DrawLine(GetX(80), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(40), GetY(270), GetX(100), GetY(280));
        DrawLine(GetX(100), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(100), GetY(170)); // ������
      end;

    11:
      begin
        DrawLine(GetX(90), GetY(190), GetX(40), GetY(270)); // ��������
        DrawLine(GetX(75), GetY(210), GetX(70), GetY(260)); // ���� �����
        DrawLine(GetX(75), GetY(210), GetX(65), GetY(240)); // ���� ������
        DrawLine(GetX(40), GetY(270), GetX(80), GetY(300));
        DrawLine(GetX(80), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(40), GetY(270), GetX(100), GetY(280));
        DrawLine(GetX(100), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(100), GetY(170)); // ������
      end;

    12:
      begin
        DrawLine(GetX(90), GetY(190), GetX(40), GetY(270)); // ��������
        DrawLine(GetX(77), GetY(210), GetX(40), GetY(255)); // ���� �����
        DrawLine(GetX(77), GetY(210), GetX(60), GetY(240)); // ���� ������
        DrawLine(GetX(40), GetY(270), GetX(80), GetY(300));
        DrawLine(GetX(80), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(40), GetY(270), GetX(100), GetY(280));
        DrawLine(GetX(100), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(100), GetY(170)); // ������
      end;

    13:
      begin
        DrawLine(GetX(100), GetY(185), GetX(50), GetY(265)); // ��������
        DrawLine(GetX(85), GetY(205), GetX(60), GetY(255)); // ���� �����
        DrawLine(GetX(85), GetY(205), GetX(70), GetY(240)); // ���� ������
        DrawLine(GetX(50), GetY(265), GetX(70), GetY(300));
        DrawLine(GetX(70), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(50), GetY(265), GetX(90), GetY(280));
        DrawLine(GetX(90), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(110), GetY(165)); // ������
      end;

    14:
      begin
        DrawLine(GetX(110), GetY(180), GetX(60), GetY(260)); // ��������
        DrawLine(GetX(97), GetY(200), GetX(90), GetY(245)); // ���� �����
        DrawLine(GetX(97), GetY(200), GetX(85), GetY(230)); // ���� ������
        DrawLine(GetX(60), GetY(260), GetX(65), GetY(300));
        DrawLine(GetX(65), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(60), GetY(260), GetX(85), GetY(280));
        DrawLine(GetX(85), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(120), GetY(160)); // ������
      end;

    15:
      begin
        DrawLine(GetX(125), GetY(170), GetX(75), GetY(250)); // ��������
        DrawLine(GetX(112), GetY(190), GetX(155), GetY(225)); // ���� �����
        DrawLine(GetX(112), GetY(190), GetX(145), GetY(215)); // ���� ������
        DrawLine(GetX(75), GetY(250), GetX(62), GetY(300));
        DrawLine(GetX(62), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(75), GetY(250), GetX(82), GetY(280));
        DrawLine(GetX(82), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(135), GetY(150)); // ������
      end;

    16:
      begin
        DrawLine(GetX(140), GetY(160), GetX(90), GetY(240)); // ��������
        DrawLine(GetX(125), GetY(180), GetX(190), GetY(215)); // ���� �����
        DrawLine(GetX(125), GetY(180), GetX(170), GetY(205)); // ���� ������
        DrawLine(GetX(90), GetY(240), GetX(62), GetY(300));
        DrawLine(GetX(62), GetY(300), GetX(40), GetY(350)); // ���� �����
        DrawLine(GetX(90), GetY(240), GetX(85), GetY(280));
        DrawLine(GetX(85), GetY(280), GetX(80), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(150), GetY(140)); // ������
      end;

    17:
      begin
        DrawLine(GetX(165), GetY(150), GetX(105), GetY(230)); // ��������
        DrawLine(GetX(151), GetY(170), GetX(210), GetY(205)); // ���� �����
        DrawLine(GetX(151), GetY(170), GetX(190), GetY(195)); // ���� ������
        DrawLine(GetX(105), GetY(230), GetX(80), GetY(290));
        DrawLine(GetX(80), GetY(290), GetX(45), GetY(330)); // ���� �����
        DrawLine(GetX(105), GetY(230), GetX(115), GetY(260));
        DrawLine(GetX(115), GetY(260), GetX(100), GetY(310)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(170), GetY(133)); // ������
      end;

    18:
      begin
        DrawLine(GetX(185), GetY(145), GetX(125), GetY(225)); // ��������
        DrawLine(GetX(171), GetY(165), GetX(230), GetY(200)); // ���� �����
        DrawLine(GetX(171), GetY(165), GetX(220), GetY(190)); // ���� ������
        DrawLine(GetX(125), GetY(225), GetX(120), GetY(280));
        DrawLine(GetX(120), GetY(280), GetX(95), GetY(320)); // ���� �����
        DrawLine(GetX(125), GetY(225), GetX(155), GetY(250));
        DrawLine(GetX(155), GetY(250), GetX(150), GetY(300)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(190), GetY(130)); // ������
      end;

    19:
      begin
        DrawLine(GetX(195), GetY(140), GetX(135), GetY(225)); // ��������
        DrawLine(GetX(175), GetY(165), GetX(235), GetY(200)); // ���� �����
        DrawLine(GetX(175), GetY(165), GetX(225), GetY(190)); // ���� ������
        DrawLine(GetX(135), GetY(225), GetX(150), GetY(275));
        DrawLine(GetX(150), GetY(275), GetX(130), GetY(315)); // ���� �����
        DrawLine(GetX(135), GetY(225), GetX(185), GetY(245));
        DrawLine(GetX(185), GetY(245), GetX(180), GetY(290)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(195), GetY(125)); // ������
      end;

    20:
      begin
        DrawLine(GetX(205), GetY(140), GetX(145), GetY(225)); // ��������
        DrawLine(GetX(185), GetY(165), GetX(245), GetY(200)); // ���� �����
        DrawLine(GetX(185), GetY(165), GetX(235), GetY(190)); // ���� ������
        DrawLine(GetX(145), GetY(225), GetX(170), GetY(260));
        DrawLine(GetX(170), GetY(260), GetX(165), GetY(300)); // ���� �����
        DrawLine(GetX(145), GetY(225), GetX(205), GetY(235));
        DrawLine(GetX(205), GetY(235), GetX(210), GetY(280)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(205), GetY(125)); // ������
      end;

    21:
      begin
        DrawLine(GetX(225), GetY(140), GetX(165), GetY(225)); // ��������
        DrawLine(GetX(207), GetY(165), GetX(265), GetY(200)); // ���� �����
        DrawLine(GetX(207), GetY(165), GetX(255), GetY(190)); // ���� ������
        DrawLine(GetX(165), GetY(225), GetX(195), GetY(258));
        DrawLine(GetX(195), GetY(258), GetX(195), GetY(290)); // ���� �����
        DrawLine(GetX(165), GetY(225), GetX(225), GetY(230));
        DrawLine(GetX(225), GetY(230), GetX(240), GetY(275)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(225), GetY(125)); // ������
      end;

    22:
      begin
        DrawLine(GetX(245), GetY(140), GetX(185), GetY(225)); // ��������
        DrawLine(GetX(227), GetY(165), GetX(285), GetY(200)); // ���� �����
        DrawLine(GetX(227), GetY(165), GetX(275), GetY(190)); // ���� ������
        DrawLine(GetX(185), GetY(225), GetX(215), GetY(258));
        DrawLine(GetX(215), GetY(258), GetX(225), GetY(290)); // ���� �����
        DrawLine(GetX(185), GetY(225), GetX(245), GetY(230));
        DrawLine(GetX(245), GetY(230), GetX(270), GetY(275)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(245), GetY(125)); // ������
      end;

    23:
      begin
        DrawLine(GetX(265), GetY(140), GetX(205), GetY(225)); // ��������
        DrawLine(GetX(247), GetY(165), GetX(305), GetY(200)); // ���� �����
        DrawLine(GetX(247), GetY(165), GetX(295), GetY(190)); // ���� ������
        DrawLine(GetX(205), GetY(225), GetX(235), GetY(258));
        DrawLine(GetX(235), GetY(258), GetX(245), GetY(290)); // ���� �����
        DrawLine(GetX(205), GetY(225), GetX(265), GetY(230));
        DrawLine(GetX(265), GetY(230), GetX(290), GetY(275)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(265), GetY(125)); // ������
      end;

    24:
      begin
        DrawLine(GetX(285), GetY(140), GetX(225), GetY(225)); // ��������
        DrawLine(GetX(267), GetY(165), GetX(325), GetY(200)); // ���� �����
        DrawLine(GetX(267), GetY(165), GetX(315), GetY(190)); // ���� ������
        DrawLine(GetX(225), GetY(225), GetX(255), GetY(258));
        DrawLine(GetX(255), GetY(258), GetX(275), GetY(290)); // ���� �����
        DrawLine(GetX(225), GetY(225), GetX(285), GetY(230));
        DrawLine(GetX(285), GetY(230), GetX(320), GetY(275)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(285), GetY(125)); // ������
      end;

    25:
      begin
        DrawLine(GetX(310), GetY(140), GetX(260), GetY(225)); // ��������
        DrawLine(GetX(297), GetY(165), GetX(355), GetY(200)); // ���� �����
        DrawLine(GetX(297), GetY(165), GetX(345), GetY(190)); // ���� ������
        DrawLine(GetX(260), GetY(225), GetX(295), GetY(245));
        DrawLine(GetX(295), GetY(245), GetX(305), GetY(290)); // ���� �����
        DrawLine(GetX(260), GetY(225), GetX(315), GetY(230));
        DrawLine(GetX(315), GetY(230), GetX(350), GetY(275)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(310), GetY(125)); // ������
      end;

    26:
      begin
        DrawLine(GetX(325), GetY(155), GetX(275), GetY(240)); // ��������
        DrawLine(GetX(310), GetY(180), GetX(370), GetY(215)); // ���� �����
        DrawLine(GetX(310), GetY(180), GetX(360), GetY(205)); // ���� ������
        DrawLine(GetX(275), GetY(240), GetX(315), GetY(260));
        DrawLine(GetX(315), GetY(260), GetX(325), GetY(305)); // ���� �����
        DrawLine(GetX(275), GetY(240), GetX(330), GetY(245));
        DrawLine(GetX(330), GetY(245), GetX(365), GetY(290)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(325), GetY(140)); // ������
      end;

    27:
      begin
        DrawLine(GetX(345), GetY(165), GetX(295), GetY(250)); // ��������
        DrawLine(GetX(330), GetY(190), GetX(390), GetY(225)); // ���� �����
        DrawLine(GetX(330), GetY(190), GetX(380), GetY(215)); // ���� ������
        DrawLine(GetX(295), GetY(250), GetX(330), GetY(275));
        DrawLine(GetX(330), GetY(275), GetX(345), GetY(320)); // ���� �����
        DrawLine(GetX(295), GetY(250), GetX(345), GetY(260));
        DrawLine(GetX(345), GetY(260), GetX(385), GetY(305)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(345), GetY(150)); // ������
      end;

    28:
      begin
        DrawLine(GetX(365), GetY(180), GetX(330), GetY(265)); // ��������
        DrawLine(GetX(355), GetY(205), GetX(410), GetY(240)); // ���� �����
        DrawLine(GetX(355), GetY(205), GetX(400), GetY(230)); // ���� ������
        DrawLine(GetX(330), GetY(265), GetX(350), GetY(295));
        DrawLine(GetX(350), GetY(295), GetX(360), GetY(340)); // ���� �����
        DrawLine(GetX(330), GetY(265), GetX(360), GetY(280));
        DrawLine(GetX(360), GetY(280), GetX(400), GetY(325)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(365), GetY(165)); // ������
      end;

    29:
      begin
        DrawLine(GetX(370), GetY(220), GetX(330), GetY(300)); // ��������
        DrawLine(GetX(362), GetY(235), GetX(420), GetY(270)); // ���� �����
        DrawLine(GetX(362), GetY(235), GetX(410), GetY(260)); // ���� ������
        DrawLine(GetX(330), GetY(300), GetX(370), GetY(315));
        DrawLine(GetX(370), GetY(315), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(330), GetY(300), GetX(380), GetY(300));
        DrawLine(GetX(380), GetY(300), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(370), GetY(210)); // ������
      end;

    30:
      begin
        DrawLine(GetX(370), GetY(210), GetX(330), GetY(310)); // ��������
        DrawLine(GetX(355), GetY(245), GetX(415), GetY(275)); // ���� �����
        DrawLine(GetX(355), GetY(245), GetX(405), GetY(265)); // ���� ������
        DrawLine(GetX(330), GetY(310), GetX(375), GetY(310));
        DrawLine(GetX(375), GetY(310), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(330), GetY(310), GetX(385), GetY(295));
        DrawLine(GetX(385), GetY(295), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(370), GetY(220)); // ������
      end;

    31:
      begin
        DrawLine(GetX(375), GetY(200), GetX(345), GetY(290)); // ��������
        DrawLine(GetX(365), GetY(235), GetX(415), GetY(280)); // ���� �����
        DrawLine(GetX(365), GetY(235), GetX(405), GetY(270)); // ���� ������
        DrawLine(GetX(345), GetY(290), GetX(375), GetY(315));
        DrawLine(GetX(375), GetY(315), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(345), GetY(290), GetX(385), GetY(300));
        DrawLine(GetX(385), GetY(300), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(370), GetY(200)); // ������
      end;

    32:
      begin
        DrawLine(GetX(380), GetY(180), GetX(363), GetY(270)); // ��������
        DrawLine(GetX(372), GetY(220), GetX(415), GetY(270)); // ���� �����
        DrawLine(GetX(372), GetY(220), GetX(405), GetY(250)); // ���� ������
        DrawLine(GetX(363), GetY(270), GetX(375), GetY(315));
        DrawLine(GetX(375), GetY(315), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(363), GetY(270), GetX(385), GetY(300));
        DrawLine(GetX(385), GetY(300), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(385), GetY(180)); // ������
      end;

    33:
      begin
        DrawLine(GetX(385), GetY(165), GetX(380), GetY(250)); // ��������
        DrawLine(GetX(384), GetY(180), GetX(410), GetY(260)); // ���� �����
        DrawLine(GetX(384), GetY(180), GetX(385), GetY(240)); // ���� ������
        DrawLine(GetX(380), GetY(250), GetX(375), GetY(315));
        DrawLine(GetX(375), GetY(315), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(380), GetY(250), GetX(395), GetY(295));
        DrawLine(GetX(395), GetY(295), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(390), GetY(155)); // ������
      end;

    34:
      begin
        DrawLine(GetX(390), GetY(150), GetX(390), GetY(230)); // ��������
        DrawLine(GetX(390), GetY(170), GetX(410), GetY(230)); // ���� �����
        DrawLine(GetX(390), GetY(170), GetX(370), GetY(250)); // ���� ������
        DrawLine(GetX(390), GetY(230), GetX(370), GetY(350)); // ���� �����
        DrawLine(GetX(390), GetY(230), GetX(410), GetY(330)); // ���� ������
        DrawCircle(Trunc(20 * Scale), GetX(390), GetY(130)); // ������
      end;

  end;
end;

procedure TJumpingMan.StartAnimation;
begin
  Self.Timer.Enabled := True;
  Self.Owner.Invalidate;
end;

procedure TJumpingMan.StopAnimation;
begin
  Self.State := 0;
  Self.Timer.Enabled := False;
end;

initialization

end.
