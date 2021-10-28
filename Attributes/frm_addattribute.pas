unit frm_addattribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, RzLabel, ExtCtrls,
  RzPanel, ActnList;

type
  Tfrm_addatt = class(TForm)
    RzPanel2: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btn_query: TRzBitBtn;
    btn_save: TRzButton;
    btn_cancel: TRzButton;
    edt_type: TRzEdit;
    edt_description: TRzEdit;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    RzLabel3: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel12: TRzLabel;
    refresh: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_addatt: Tfrm_addatt;

implementation

uses procedures, sql_statement, variables, frm_attribute, frm_selectattribute;

{$R *.dfm}

procedure Tfrm_addatt.escExecute(Sender: TObject);
begin
      btn_cancel.Click;
end;

procedure Tfrm_addatt.btn_cancelClick(Sender: TObject);
begin
      selectatt_id := 0;
      type_temp := '';
      close;
end;

procedure Tfrm_addatt.btn_newClick(Sender: TObject);
begin
      //selectatt_id := 0;
      //btn_query.Click;
end;

procedure Tfrm_addatt.btn_queryClick(Sender: TObject);
begin
    query := 'select id, description, type from attributes';
    qwhere := ' where id = ' + quotedstr(inttostr(selectatt_id));

    sql := query + qwhere;
    procedures.select_func;

    procedures.populate(frm_addatt, sql, 'doh', 'attributes');

    if selectatt_id = 0 then
        edt_type.Text := type_temp;
end;

procedure Tfrm_addatt.btn_saveClick(Sender: TObject);
begin
      if selectatt_id = 0 then
      begin
          procedures.save(frm_addatt, 'insert into' , 'doh' , 'attributes' , '');
          frm_selectatt.btn_query.Click;
          showmessage('Attribute Saved!');
      end else
      begin
          procedures.save(frm_addatt, 'update' , 'doh' , 'attributes', ' where id = ' + quotedstr(inttostr(selectatt_id)));
          frm_selectatt.btn_query.Click;
          showmessage('Attribute Updated!');
      end;
      close;
      frm_selectatt.btn_query.Click;
end;

procedure Tfrm_addatt.FormActivate(Sender: TObject);
begin
      btn_query.Click;
end;

procedure Tfrm_addatt.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
