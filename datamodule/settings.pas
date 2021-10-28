unit settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzButton, ActnList, AdvPanel,
  ExtCtrls, RzPanel, System.Actions;

type
  Tsettings_DM = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    btn_query: TRzBitBtn;
    btn_ok: TRzBitBtn;
    btn_cancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edt_host: TRzEdit;
    RzLabel4: TRzLabel;
    edt_pass: TRzEdit;
    edt_user: TRzEdit;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  settings_DM: Tsettings_DM;

implementation

uses datamodule;

{$R *.dfm}

procedure Tsettings_DM.btn_cancelClick(Sender: TObject);
begin
    close;
end;

procedure Tsettings_DM.btn_okClick(Sender: TObject);
begin
    dm.myconnection1.Server := edt_host.Text;
    dm.myconnection1.Password := edt_pass.Text;
    dm.myconnection1.Username := edt_user.Text;

    try
        dm.myconnection1.Connect;
        if dm.myconnection1.Connected = true then
        begin
            showmessage('Connected to DataBase');
            close;
        end;
    except
      on E : Exception do
        ShowMessage('Cannot Connect to Database With Error: '+E.Message);
    end;
end;

procedure Tsettings_DM.btn_queryClick(Sender: TObject);
begin
    edt_host.Text := dm.myconnection1.Server;
    edt_pass.Text := dm.myconnection1.Password;
    edt_user.Text := dm.myconnection1.Username;
end;

procedure Tsettings_DM.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

end.
