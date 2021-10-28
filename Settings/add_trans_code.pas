unit add_trans_code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, ExtCtrls, RzPanel, RzButton, StdCtrls, RzCmboBx,
  Mask, RzEdit, RzLabel, System.Actions;

type
  Ttrans_code_add_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    btn_close: TRzBitBtn;
    btn_query: TRzBitBtn;
    btn_save: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edt_description: TRzEdit;
    edt_code: TRzEdit;
    cmb_transaction_value: TRzComboBox;
    cmb_inventory_value: TRzComboBox;
    RzLabel6: TRzLabel;
    btn_new: TRzBitBtn;
    lbl_id: TRzLabel;
    esc: TAction;
    RzLabel13: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel12: TRzLabel;
    new: TAction;
    refresh: TAction;
    procedure btn_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  trans_code_add_frm: Ttrans_code_add_frm;

implementation

uses procedures, variables, datamodule, trans_code;

{$R *.dfm}

procedure Ttrans_code_add_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Ttrans_code_add_frm.btn_newClick(Sender: TObject);
begin
    trans_code_id := 0;
    btn_query.Click;
end;

procedure Ttrans_code_add_frm.btn_queryClick(Sender: TObject);
begin
    query := 'select * from transaction_code';
    qwhere := ' where id = ' + quotedstr(inttostr(trans_code_id));
    sql := query + qwhere;
    procedures.select_func;
    procedures.populate(trans_code_add_frm, sql, 'doh', 'transaction_code');
    if trans_code_id = 0 then
    begin
      generate_id('doh','transaction_code');
      if dm.qselect1.RecordCount = 0 then
      begin
        new_id := 1;
      end else
      begin
        new_id := dm.qselect1.FieldValues['max_id']+1;
      end;
      lbl_id.Caption := formatfloat('000000000',new_id);
    end;
    edt_description.SetFocus;
end;

procedure Ttrans_code_add_frm.btn_saveClick(Sender: TObject);
begin
  procedures.save(trans_code_add_frm, 'insert into' , 'doh', 'transaction_code', '');
  showmessage('Code Added');
  trans_code_frm.btn_query.Click;
end;

procedure Ttrans_code_add_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Ttrans_code_add_frm.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Ttrans_code_add_frm.newExecute(Sender: TObject);
begin
    btn_new.Click;
end;

procedure Ttrans_code_add_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
