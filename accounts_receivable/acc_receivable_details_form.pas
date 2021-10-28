unit acc_receivable_details_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, Grids, AdvObj, BaseGrid, AdvGrid, RzButton, StdCtrls,
  RzLabel, AdvPanel, ExtCtrls, ActnList, System.Actions;

type
  Tfrm_ar_details = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    lbl_po_id: TRzLabel;
    btn_cancel: TRzBitBtn;
    grd_details: TAdvStringGrid;
    btn_query: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    lbl_company_name: TRzLabel;
    lbl_address: TRzLabel;
    RzLabel5: TRzLabel;
    lbl_contact_no: TRzLabel;
    RzLabel7: TRzLabel;
    lbl_fax_no: TRzLabel;
    AdvPanelStyler1: TAdvPanelStyler;
    btn_ok: TRzButton;
    ActionList1: TActionList;
    Esc: TAction;
    Refresh: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ar_bal_amt,ar_tot_amt  : double;
  frm_ar_details: Tfrm_ar_details;

implementation

uses procedures, variables, acc_receivable_form, datamodule;

{$R *.dfm}

procedure Tfrm_ar_details.btn_cancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ar_details.btn_queryClick(Sender: TObject);
begin
  ar_bal_amt  := 0;
  ar_tot_amt  :=0;
  procedures.grd_setup(grd_details);

  query := 'select id,ifnull(transaction_id,0) as transaction_id,ifnull(balance,0) as balance,ifnull(amount_issued,0) as amount_issued,ifnull((select description from attributes where id = accounts_receivable.payment_id),"AR") as payment,'+
   '  ifnull(customer_id,0) as customer_id,ifnull((select fax_number from customer where customer.id = accounts_receivable.customer_id),"NONE") as fax_number, ifnull(encode_date,0) as encode_date  ,' +
   '  ifnull((select concat(lname,", ",fname," ",mi) from customer where id = accounts_receivable.customer_id), "N/A") as name '+
   '  ,ifnull((select address from customer where customer.id = accounts_receivable.customer_id),"NONE") as address  '+
   '  ,ifnull((select tel_number from customer where customer.id = accounts_receivable.customer_id),"NONE") as tel_number'+
   '  ,ifnull((select email from customer where customer.id = accounts_receivable.customer_id),"NONE") as email, '+
   '  ifnull(sum(amount_issued),0) as amt from accounts_receivable  ';
  qwhere  := ' where transaction_id =' + quotedstr(inttostr(ar_id));
  qgroup  := ' group  by id';

  sql   := query + qwhere + qgroup ;

  procedures.select_func;

  grd_details.ClearNormalCells;
  grd_details.RowCount := 2;
  grd_details.FloatingFooter.Visible  := false;

  ar_bal_amt  := ar_bal_amt + (dm.qselect1.FieldValues['balance'] - dm.qselect1.FieldValues['amt']);

  if DM.qselect1.RecordCount <> 0 then
        begin
          lbl_company_name.Caption  := dm.qselect1.FieldValues['name'];
          lbl_address.Caption       := dm.qselect1.Fieldvalues['address'];
          lbl_contact_no.Caption    := dm.qselect1.FieldValues['tel_number'];
          lbl_fax_no.Caption        := dm.qselect1.FieldValues['fax_number'];
          lbl_po_id.Caption         := formatfloat('00000000',dm.qselect1.FieldValues['transaction_id']);
                while DM.qselect1.Eof <> true do
                begin
                id  := dm.qselect1.FieldValues['id'];
                grd_details.Objects[0,grd_details.RowCount -1]  := pointer(id);

                grd_details.Cells[1,grd_details.RowCount -1 ] := dm.qselect1.FieldValues['encode_date'];
                grd_details.Cells[2,grd_details.RowCount -1 ] := dm.qselect1.FieldValues['payment'];
                grd_details.Cells[3,grd_details.RowCount -1 ] := formatfloat('##,###.##',dm.qselect1.FieldValues['balance']);
                grd_details.Cells[4,grd_details.RowCount -1 ] := formatfloat('##,##0.##',dm.qselect1.FieldValues['amount_issued']);
                grd_details.Cells[5,grd_details.RowCount -1 ] := formatfloat('#,##0.##',ar_bal_amt);
                ar_tot_amt  := ar_tot_amt + dm.qselect1.FieldValues['amt'];

                grd_details.CellProperties[3,grd_details.rowcount-1].Alignment := taRightJustify;
                grd_details.CellProperties[4,grd_details.rowcount-1].Alignment := taRightJustify;
                grd_details.CellProperties[5,grd_details.rowcount-1].Alignment := taRightJustify;

                grd_details.AddRow;
                dm.qselect1.Next;
                ar_bal_amt  :=  ar_bal_amt - dm.qselect1.FieldValues['amount_issued'];

                end;
          end;

          grd_details.FloatingFooter.Visible  := true;
          ar_bal_amt  :=  ar_bal_amt + dm.qselect1.FieldValues['amount_issued'];
          grd_details.Cells[4,grd_details.RowCount -1 ] := 'Total Amount Payed: '+formatfloat('#,##0.##',ar_tot_amt);
          grd_details.Cells[5,grd_details.RowCount -1 ] := 'Rem. Balance: '+formatfloat('#,##0.##',ar_bal_amt);
end;

procedure Tfrm_ar_details.EscExecute(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ar_details.FormActivate(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tfrm_ar_details.RefreshExecute(Sender: TObject);
begin
  btn_query.Click;
end;

end.
