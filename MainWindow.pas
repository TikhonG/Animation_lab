unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, AthleticMan;

type
  TMyForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    Man: TJumpingMan;
  public
    { Public declarations }
  end;

var
  MyForm: TMyForm;

implementation

{$R *.dfm}

procedure TMyForm.FormCreate(Sender: TObject);
begin
  Man := TJumpingMan.Create(Self);
  Man.Scale := 1.9;
  Man.StartAnimation;
end;

procedure TMyForm.FormPaint(Sender: TObject);
begin
  Man.Draw(10, 10);
end;

end.
