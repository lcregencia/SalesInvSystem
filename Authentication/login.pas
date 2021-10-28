unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ActnList, StdCtrls, RzLabel, Mask, RzEdit, pngimage,
  ExtCtrls, AdvPanel, System.Actions;

type
  Tlogin_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    Image1: TImage;
    edt_username: TRzEdit;
    Image2: TImage;
    edt_password: TRzEdit;
    ActionList1: TActionList;
    btn_login: TRzBitBtn;
    btn_exit: TRzBitBtn;
    btn_query: TRzBitBtn;
    esc: TAction;
    refresh: TAction;
    btn_settings: TRzBitBtn;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure btn_settingsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login_frm: Tlogin_frm;

implementation

uses main, procedures, variables, datamodule, settings;

{$R *.dfm}

procedure Tlogin_frm.btn_exitClick(Sender: TObject);
begin
  //main_frm.Close;
  close;

end;

procedure Tlogin_frm.btn_loginClick(Sender: TObject);
begin
  //try
      dm.myconnection1.Connect;

      query := 'select id, fname, lname, password, (select description from attributes where id = employee.position) as position from employee';
      sql := query;

      procedures.select_func;

      if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                      //showmessage('Logged in as '+ DM.qselect1.fieldvalues['position']);
                      encoder := dm.qselect1.FieldValues['id'];
                      encoder_name := concat(dm.qselect1.FieldValues['fname'],' ',dm.qselect1.FieldValues['lname']);
                      branch_id := 1;
                      main_frm.ShowModal;
                      self.Visible := false;
                  end else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;;
          end;
      end  else
              begin
                  showmessage('Password/Username not found');
              end;
    //except
    //on E : Exception do
      //ShowMessage('Cannot Connect to Database With Error: '+E.Message);
  //end;
end;

procedure Tlogin_frm.btn_queryClick(Sender: TObject);
begin
  edt_username.SetFocus;
end;

procedure Tlogin_frm.btn_settingsClick(Sender: TObject);
begin
    settings_dm.ShowModal;
end;

procedure Tlogin_frm.escExecute(Sender: TObject);
begin
  btn_exit.Click;
end;

procedure Tlogin_frm.FormActivate(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tlogin_frm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure Tlogin_frm.refreshExecute(Sender: TObject);
begin
  btn_query.Click;
end;

end.
