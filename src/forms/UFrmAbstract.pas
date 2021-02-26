unit UFrmAbstract;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmAbstract = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbstract: TFrmAbstract;

implementation

{$R *.dfm}

uses UAppUtils;

procedure TFrmAbstract.FormCreate(Sender: TObject);
begin
  Caption := GetApplicationName + ' - ' + GetVersaoArq;
end;

end.
