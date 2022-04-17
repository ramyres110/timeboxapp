unit UDatabaseMigration;

interface

type

TDatabaseMigration = class(TObject)
  private
    FMigrationsFolder: string;
  public
    constructor Create(pMigrationsFolder:string = '');
    procedure LoadMigrations;
    procedure RunMigration(pFilepath:String);
    procedure ExecuteQuery(pSQL:string);
    procedure RunAll;
  protected
end;

var
  DatabaseMigration: TDatabaseMigration;

implementation

uses
  System.SysUtils, System.IOUtils, Vcl.Forms, UDmMain;

{ TDatabaseMigration }

constructor TDatabaseMigration.Create(pMigrationsFolder: string);
begin
  if(pMigrationsFolder <> EmptyStr)then
  begin
    FMigrationsFolder := pMigrationsFolder;
  end
  else
  begin
    FMigrationsFolder := ExtractFilePath(Application.ExeName)+'migrations';
  end;
end;

procedure TDatabaseMigration.ExecuteQuery(pSQL: string);
begin
  try
    DmMain.FDConn.ExecSQL(pSQL);
  except on E:Exception do
    Writeln(E.Message);
  end;
end;

procedure TDatabaseMigration.LoadMigrations;
var
  lFileList: TArray<string>;
  lFileName: string;
begin
  if not DirectoryExists(FMigrationsFolder) then
  begin
    Exit;
  end;

  lFileList := TDirectory.GetFiles(FMigrationsFolder);
  for lFileName in  lFileList do
  begin
    RunMigration(lFileName);
  end;
end;

procedure TDatabaseMigration.RunAll;
begin
  LoadMigrations;
end;

procedure TDatabaseMigration.RunMigration(pFilepath: String);
var
  lFile: TextFile;
  lLine, lText: string;
begin
  lText := '';
  Assign(lFile,pFilepath);
  Reset(lFile);
  while not Eof(lFile) do
  begin
    Readln(lFile,lLine);
    lText := lText + lLine;
  end;
  CloseFile(lFile);

  if(lText <> EmptyStr)then
  begin
    ExecuteQuery(lText);
  end;
end;

end.
