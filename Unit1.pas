unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    labelStatus: TLabel;
    lbMessage: TLabel;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

function SecureEngineInitialize(): Boolean; stdcall;
function SecureEngineFinalize(): Boolean; stdcall;
function SecureEngineShowCustomMessageA(MsgId: Integer; pMsg:PAnsiChar):Boolean; stdcall;
function SecureEngineGetEncryptionKey(ZoneId: Integer; pOutputEncryptionKey:PAnsiChar):Boolean; stdcall;
procedure SecureEngineGetProtectedFileNameW(pName: PWideChar); stdcall;
function SecureEngineGetFingerPrintW(pName: PWideChar):Boolean; stdcall;

exports
  SecureEngineInitialize,
  SecureEngineShowCustomMessageA,
  SecureEngineGetEncryptionKey,
  SecureEngineGetProtectedFileNameW,
  SecureEngineGetFingerPrintW,
  SecureEngineFinalize;

implementation

{$R *.dfm}


function SecureEngineInitialize(): Boolean;
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'SecureEngineInitialize';

  Form1.labelStatus.Width := Form1.Width;

  Form1.ShowModal;
  Result := True;

end;

function SecureEngineFinalize(): Boolean;
begin
  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'SecureEngineFinalize';

  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;
  Result := True;
end;

procedure SecureEngineGetProtectedFileNameW(pName: PWideChar);
begin
  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'SecureEngineGetProtectedFileNameW: ' + WideString(pName);

  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;
end;


function SecureEngineGetFingerPrintW(pName: PWideChar):Boolean;
begin
  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'SecureEngineGetFingerPrintW: ' + WideString(pName);

  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;
  Result := True;
end;


function SecureEngineShowCustomMessageA(MsgId: Integer; pMsg:PAnsiChar):Boolean;
begin

  Form1 := TForm1.Create(application);
  Form1.LabelStatus.Caption := 'Calling Message (A): ' + IntToStr(MsgId);

  if pMsg <> nil then
    Form1.lbMessage.Caption := 'Original Message: ' + AnsiString(pMsg);

  Form1.labelStatus.Width := Form1.Width;
  Form1.ShowModal;

  Result := True;

end;

function SecureEngineGetEncryptionKey(ZoneId: Integer; pOutputEncryptionKey:PAnsiChar):Boolean;
begin
    StrCopy(pOutputEncryptionKey, 'My Encryption Key');
    Result := True;
end;
            
procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
