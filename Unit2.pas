unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Winapi.ShellAPI,
  JvExControls, JvLinkLabel;

type
  TfmAbout = class(TForm)
    Image1: TImage;
    AppTitleLabel: TLabel;
    DescLabel: TLabel;
    VersionLabel: TLabel;
    AutorLabel: TJvLinkLabel;
    procedure AutorLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.dfm}

procedure TfmAbout.AutorLabelClick(Sender: TObject);
begin
ShellExecute(0,'Open','www.ogursoft.ru','','',0);
end;

end.
