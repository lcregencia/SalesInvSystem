unit frm_control_settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, RzButton, StdCtrls, RzLabel, AdvPanel, RzPanel, ExtCtrls,
  ActnList, System.Actions;

type
  Tfrm_settings = class(TForm)
    AdvPanel1: TAdvPanel;
    RzPanel1: TRzPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    RzLabel1: TRzLabel;
    btn_ok: TRzBitBtn;
    btn_close: TRzBitBtn;
    rd_strict: TRzRadioButton;
    rd_free: TRzRadioButton;
    ActionList1: TActionList;
    closefrm: TAction;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure closefrmExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_settings: Tfrm_settings;

implementation

uses variables, authentication_frm;

{$R *.dfm}

procedure Tfrm_settings.btn_closeClick(Sender: TObject);
begin
  if rd_free.Checked = true then
  begin
    rd_free.Checked := false;
    rd_strict.Checked := true;
    close;
  end
  else
  close;
end;

procedure Tfrm_settings.btn_okClick(Sender: TObject);
begin
  confirmed := 7;
  confirmation_frm.ShowModal;
end;

procedure Tfrm_settings.closefrmExecute(Sender: TObject);
begin
  btn_close.Click;
end;

end.
