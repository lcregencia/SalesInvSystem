unit pos_salespayment_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, AdvPanel, ExtCtrls, RzButton,
  RzPanel, RzRadChk, ActnList, System.Actions;

type
  Tpos_sales_payment_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    lbl_total: TRzLabel;
    RzLabel1: TRzLabel;
    lbl_change: TRzLabel;
    btn_ok: TRzButton;
    btn_query: TRzButton;
    nedt_amount: TRzNumericEdit;
    btn_close: TRzButton;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzGroupBox1: TRzGroupBox;
    RzLabel8: TRzLabel;
    edt_checkno: TRzEdit;
    RzLabel7: TRzLabel;
    edt_bankname: TRzEdit;
    rd_cash: TRzRadioButton;
    rd_check: TRzRadioButton;
    ActionList1: TActionList;
    esc: TAction;
    procedure btn_okClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure nedt_amountChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure rd_checkClick(Sender: TObject);
    procedure rd_cashClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure nedt_amountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pos_sales_payment_frm: Tpos_sales_payment_frm;

implementation

uses datamodule, procedures, sales_frm, sql_statement, variables, sales_receipt;

{$R *.dfm}

procedure Tpos_sales_payment_frm.btn_okClick(Sender: TObject);
var amt, bal, change,tot: double;
begin
    amt := strtofloat(nedt_amount.Text);
    bal := strtofloat(lbl_total.Caption);
    change := strtofloat(lbl_change.Caption);
    tot := change * -1;

    if rd_cash.Checked = true then
    begin
    if amt < bal then
    begin
      if messagedlg('Insufficient Funds, Do you want to add amount to recievables?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
            sql  := ' insert into accounts_receivable set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
            ', transaction_value = '  + quotedstr(inttostr(-1)) +
            ', transaction_code   = "AR"' +
            ', customer_id =' + quotedstr(inttostr(sales_cus_id)) +
            ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
            ', balance =' + floattostr(tot);

              procedures.exec_func;

              total_price := 0;
              nedt_amount.Text := '0';
              pos_sales_frm.lbl_price.Caption := '0.00';
              pos_sales_frm.grd_trans.clearnormalcells;
              pos_sales_frm.edt_barcode.Clear;
              pos_sales_frm.edt_qty.Text := '1';
              pos_sales_frm.edt_name.Clear;
              pos_sales_frm.edt_address.Clear;
              pos_sales_frm.edt_contact_no.Clear;
              pos_sales_frm.split_trans.CloseHotSpot;
              pos_sales_frm.btn_new_trans.Click;
              pos_sales_frm.btn_trans_no_query.Click;
              pos_sales_frm.btn_item_query.Click;
              sales_cus_id := 0;
              close;
      end
      else
      begin
        nedt_amount.SetFocus;
      end;
    end else
    begin
       showmessage('Transaction Complete!');
       frm_receipt.qr_receipt.preview;
//       pos_sales_frm.btn_print.click;
       total_price := 0;
       nedt_amount.Text := '0';
       pos_sales_frm.lbl_price.Caption := '0.00';
       pos_sales_frm.grd_trans.clearnormalcells;
       pos_sales_frm.edt_barcode.Clear;
       pos_sales_frm.edt_qty.Text := '1';
       pos_sales_frm.edt_name.Clear;
       pos_sales_frm.edt_address.Clear;
       pos_sales_frm.edt_contact_no.Clear;
       pos_sales_frm.split_trans.CloseHotSpot;
       pos_sales_frm.btn_new_trans.Click;
       pos_sales_frm.btn_trans_no_query.Click;
       pos_sales_frm.btn_item_query.Click;
       sales_cus_id := 0;
       close;
    end;
    end; // rd_cash.check = true

    if rd_check.Checked = true then
    begin
     if amt < bal then
    begin
      if messagedlg('Insufficient Funds, Do you want to add amount to recievables?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
            sql  := ' insert into accounts_receivable set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
            ', transaction_value = '  + quotedstr(inttostr(-1)) +
            ', transaction_code   = "AR"' +
            ', customer_id =' + quotedstr(inttostr(sales_cus_id)) +
            ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
            ', balance =' + floattostr(tot);

              procedures.exec_func;

              total_price := 0;
              pos_sales_frm.lbl_price.Caption := '0.00';
              pos_sales_frm.grd_trans.clearnormalcells;
              pos_sales_frm.edt_barcode.Clear;
              pos_sales_frm.edt_qty.Text := '1';
              pos_sales_frm.edt_name.Clear;
              pos_sales_frm.edt_address.Clear;
              pos_sales_frm.edt_contact_no.Clear;
              pos_sales_frm.split_trans.CloseHotSpot;
              pos_sales_frm.btn_new_trans.Click;
              pos_sales_frm.btn_item_query.Click;
              sales_cus_id := 0;
              close;
      end
      else
      begin
        nedt_amount.SetFocus;
      end;
    end else
    begin
//        sql := ' update transaction set '+

       showmessage('Transaction Complete!');
       total_price := 0;
       pos_sales_frm.lbl_price.Caption := '0.00';
       pos_sales_frm.grd_trans.clearnormalcells;
       pos_sales_frm.edt_barcode.Clear;
       pos_sales_frm.edt_qty.Text := '1';
       pos_sales_frm.edt_name.Clear;
       pos_sales_frm.edt_address.Clear;
       pos_sales_frm.edt_contact_no.Clear;
       pos_sales_frm.split_trans.CloseHotSpot;
       pos_sales_frm.btn_new_trans.Click;
       pos_sales_frm.btn_item_query.Click;
       sales_cus_id := 0;
       frm_receipt.qr_receipt.Preview;
       close;
    end;
    end;


end;

procedure Tpos_sales_payment_frm.btn_queryClick(Sender: TObject);
begin

    lbl_total.Caption := pos_sales_frm.lbl_price.Caption;

    if nedt_amount.Text = '' then

    begin
      nedt_amount.Text := '0';
      lbl_change.Caption := '0';
    end;

    payment_amount := strtofloat(nedt_amount.Text) - strtofloat(lbl_total.Caption);
    lbl_change.Caption := formatfloat('####0.00', payment_amount);
    change := strtofloat(lbl_change.Caption);
end;

procedure Tpos_sales_payment_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tpos_sales_payment_frm.FormActivate(Sender: TObject);
begin
    btn_query.Click;
    nedt_amount.SetFocus;
    rd_cash.Checked := true;
end;

procedure Tpos_sales_payment_frm.nedt_amountChange(Sender: TObject);
begin

      btn_query.Click;

end;

procedure Tpos_sales_payment_frm.nedt_amountKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    btn_ok.Click;
  end;
end;

procedure Tpos_sales_payment_frm.rd_cashClick(Sender: TObject);
begin
  edt_checkno.Enabled := false;
  edt_bankname.Enabled  := false;
end;

procedure Tpos_sales_payment_frm.rd_checkClick(Sender: TObject);
begin
  rd_cash.Checked  := false;
  rd_check.Checked  := true;
  edt_checkno.Enabled := true;
  edt_bankname.Enabled  := true;
  edt_checkno.SetFocus;
end;

procedure Tpos_sales_payment_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

end.
