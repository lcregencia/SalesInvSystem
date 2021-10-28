unit add_stocks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, RzLabel,
  ExtCtrls, RzPanel, RzCmboBx, ComCtrls, RzDTP, RzLine, System.Actions;

type
  Tadd_stocks_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_batch_id: TRzLabel;
    btn_close: TRzBitBtn;
    btn_ok: TRzBitBtn;
    edt_quantity_box: TRzNumericEdit;
    btn_query: TRzBitBtn;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    RzLabel3: TRzLabel;
    dtp_expiration_date: TRzDateTimePicker;
    RzLabel4: TRzLabel;
    cmb_branch_id: TRzComboBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    cmb_supplier_id: TRzComboBox;
    RzLabel7: TRzLabel;
    cmb_status_id: TRzComboBox;
    RzBitBtn1: TRzBitBtn;
    btn_status_att: TRzBitBtn;
    cmb_trans_code: TRzComboBox;
    RzLabel8: TRzLabel;
    cmb_unit_id: TRzComboBox;
    edt_quantity: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    lbl_inventory_id: TRzLabel;
    lbl_transaction_value: TRzLabel;
    lbl_inventory_value: TRzLabel;
    lbl_brand: TRzLabel;
    lbl_category: TRzLabel;
    lbl_generic: TRzLabel;
    lbl_type_id: TRzLabel;
    RzLabel11: TRzLabel;
    edt_pieces: TRzEdit;
    RzLine1: TRzLine;
    btn_calculate: TRzBitBtn;
    RzLabel15: TRzLabel;
    RzLabel18: TRzLabel;
    refresh: TAction;
    procedure btn_closeClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure edt_quantity_boxChange(Sender: TObject);
    procedure edt_piecesChange(Sender: TObject);
    procedure btn_calculateClick(Sender: TObject);
    procedure cmb_unit_idClick(Sender: TObject);
    procedure btn_status_attClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  add_stocks_frm: Tadd_stocks_frm;

implementation

uses procedures, variables, datamodule, frm_addattribute, frm_supplierdetails,
  inventory;

{$R *.dfm}

procedure Tadd_stocks_frm.btn_calculateClick(Sender: TObject);
begin
    if cmb_unit_id.ItemIndex = cmb_unit_id.Items.IndexOf('Box') then
    begin
        edt_pieces.Enabled := true;
    end else
    begin
        edt_pieces.Text := inttostr(1);
        edt_pieces.Enabled := false;
    end;
    edt_quantity.Text := inttostr(strtoint(edt_quantity_box.Text) * strtoint(edt_pieces.Text));
end;

procedure Tadd_stocks_frm.btn_closeClick(Sender: TObject);
begin
  stockin_id := 0;
  close;
end;

procedure Tadd_stocks_frm.btn_okClick(Sender: TObject);
begin
    procedures.save(add_stocks_frm, 'insert into' , 'doh', 'transaction', '');
    showmessage('Stock Added');
    mf_inventory_frm.btn_query.Click;
    close;
end;

procedure Tadd_stocks_frm.btn_queryClick(Sender: TObject);
begin
  query := 'select unit_id, inventory_id, trans_code, batch_id, quantity, branch_id, supplier_id, status_id' +
           ', expiration_date, transaction_value, inventory_value, brand, category, generic, type_id from transaction';
  qwhere := ' where id = ' + quotedstr(inttostr(mf_stock_id));
  sql := query + qwhere;
  procedures.select_func;
  procedures.populate(add_stocks_frm, sql, 'doh', 'transaction');
  //showmessage(inttostr(max_batch_id));
  lbl_batch_id.Caption := formatfloat('0000000',max_batch_id);
  lbl_inventory_id.Caption := formatfloat('0000000',mf_stock_id);

  if tag_stock = 1 then
  begin
    cmb_trans_code.ItemIndex := cmb_trans_code.Items.IndexOf('P');
    cmb_status_id.ItemIndex  := cmb_status_id.Items.IndexOf('Good');
    cmb_unit_id.ItemIndex  := cmb_unit_id.Items.IndexOf('Box');
  end;

  query := 'select brand, category, generic, type, (select transaction_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('P'))) +
           ') as transaction_value, (select inventory_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('P'))) +
           ') as inventory_value from inventory';
  sql := query;
  procedures.select_func;
  lbl_category.Caption := dm.qselect1.FieldValues['category'];
  lbl_generic.Caption := dm.qselect1.FieldValues['generic'];
  lbl_type_id.Caption := dm.qselect1.FieldValues['type'];
  lbl_transaction_value.Caption := dm.qselect1.FieldValues['transaction_value'];
  lbl_inventory_value.Caption := dm.qselect1.FieldValues['inventory_value'];
  lbl_brand.Caption := dm.qselect1.FieldValues['brand'];
  edt_quantity.Text := '0';
end;

procedure Tadd_stocks_frm.cmb_unit_idClick(Sender: TObject);
begin
    btn_calculate.Click;
end;

procedure Tadd_stocks_frm.edt_piecesChange(Sender: TObject);
begin
    btn_calculate.Click;
end;

procedure Tadd_stocks_frm.edt_quantity_boxChange(Sender: TObject);
begin
    btn_calculate.Click;
end;

procedure Tadd_stocks_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tadd_stocks_frm.FormActivate(Sender: TObject);
begin
  edt_pieces.Enabled := true;
  cmb_pop(cmb_branch_id,'id, description','doh','warehouse','1=1');
  cmb_pop(cmb_supplier_id,'id, company_name','doh','supplier','1=1');
  cmb_pop(cmb_status_id,'id, description','doh','attributes','type="status"');
  cmb_pop(cmb_unit_id,'id, description','doh','attributes','type="unit"');
  cmb_pop(cmb_trans_code,'id, code','doh','transaction_code','1=1');
  //////////////////////////////////////////////////////////////////
  btn_query.Click;
end;

procedure Tadd_stocks_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tadd_stocks_frm.RzBitBtn1Click(Sender: TObject);
begin
    frm_supplier_details.ShowModal;
end;

procedure Tadd_stocks_frm.btn_status_attClick(Sender: TObject);
begin
    type_temp := 'status';
    frm_addatt.ShowModal;
end;

end.
