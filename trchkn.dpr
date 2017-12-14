program trchkn;

uses
  Vcl.Forms,
  Vcl.Controls,
  Windows,
  SysUtils,
  SHFolder,
  Unit1 in 'Unit1.pas' {fmMain} ,
  Unit2 in 'Unit2.pas' {fmAbout};

const
  MemFileSize = 127;
  MemFileName = 'Prev_trchkn';

var
  MemHnd, Prev: HWND;

{$R *.res}

begin
  MemHnd := CreateFileMapping(HWND($FFFFFFFF), nil, PAGE_READWRITE, 0,
    MemFileSize, MemFileName);
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'TrackChecker Notifier';
    ProgPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
    AppDataPath := IncludeTrailingPathDelimiter
      (fmMain.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)) + SProgPath;
    ForceDirectories(AppDataPath);
    fmMain.ReadSettings();
    Application.CreateForm(TfmMain, fmMain);
    Application.Run;
  end
  else
  begin
    Prev := FindWindow(PChar('fmMain'), PChar(Application.Title));
    if Prev <> 0 then
    begin
      SetForegroundWindow(Prev);
      CloseHandle(MemHnd);
      Halt;
    end;
  end;

end.
