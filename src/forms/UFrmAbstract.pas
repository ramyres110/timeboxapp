unit UFrmAbstract;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, USettings;

type
  TFrmAbstract = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSettings: TSettings;
  public
    { Public declarations }
    property Settings: TSettings read FSettings write FSettings;
  end;

var
  FrmAbstract: TFrmAbstract;

implementation

{$R *.dfm}

uses UAppUtils;

procedure TFrmAbstract.FormCreate(Sender: TObject);
begin
  Caption := GetApplicationName + ' - ' + GetVersaoArq;
  FSettings :=  TSettings.Create;
end;

procedure TFrmAbstract.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSettings);
end;

end.
