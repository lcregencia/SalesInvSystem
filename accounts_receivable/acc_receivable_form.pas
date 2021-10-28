unit acc_receivable_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, ExtCtrls, RzPanel, RzButton, StdCtrls, Mask, RzEdit,
  RzLabel, Grids, AdvObj, BaseGrid, AdvGrid, ActnList, System.Actions;

type
  Tfrm_accounts_receivable = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    grd_ar_home: TAdvStringGrid;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edt_search: TRzEdit;
    btn_query: TRzBitBtn;
    btn_pay_cash: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_ok: TRzBitBtn;
    btn_close: TRzBitBtn;
    ActionList1: TActionList;
    Esc: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure grd_ar_homeDblClick(Sender: TObject);
    procedure btn_pay_cashClick(Sender: TObject);
    procedure grd_ar_homeClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ar_id,ar_pay_id : integer;
  frm_accounts_receivable: Tfrm_accounts_receivable;

implementation

uses datamodule, procedures, variables, acc_receivable_details_form,
  pay_accounts, accounts_pay, Accounts_receivable_report;

  //pay_accounts;

{$R *.dfm}

procedure Tfrm_accounts_receivable.btn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_accounts_receivable.btn_pay_cashClick(Sender: TObject);
begin
  ap_pay_id := 2;
  ar_id := integer(grd_ar_home.objects[0,grd_ar_home.row]);
  payment_frm.Show;
end;

procedure Tfrm_accounts_receivable.btn_printClick(Sender: TObject);
begin
  frm_accts_receivable_report.qr_accts_receivable_report.Preview;
end;

procedure Tfrm_accounts_receivable.btn_queryClick(Sender: TObject);
var bal_rec,ar_tot_cost,ar_bal_temp : double;
begin
  ar_bal_temp :=0;
  ar_tot_cost :=0;
  procedures.grd_setup(grd_ar_home);

  query := '  select ifnull(transaction_id,0) as transaction_id,ifnull(balance,0) as balance,ifnull(sum(amount_issued*-1),0) as amt,ifnull((select concat(lname,", ",fname," ",mi) from customer where id = accounts_receivable.customer_id),"NA") as name,' +
        ' ifnull(encode_date,"NA") as encode_date from accounts_receivable';
  qwhere  := ' where 1=1' ;
  qgroup  := ' group by transaction_id';

  if edt_search.Text <> '' then
  begin
  qwhere := qwhere + ' and ifnull((select concat(lname,", ",fname," ",mi) from customer where id = accounts_receivable.customer_id), "N/A") like ' + quotedstr('%'+trim(edt_search.text)+'%');
  end;

  sql   := query + qwhere + qgroup ;

  procedures.select_func;

  grd_ar_home.ClearNormalCells;
  grd_ar_home.RowCount := 2;
  grd_ar_home.FloatingFooter.Visible  := false;

  if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                id  := dm.qselect1.FieldValues['transaction_id'];

                grd_ar_home.Objects[0,grd_ar_home.RowCount -1]  := pointer(id);

                grd_ar_home.Cells[1,grd_ar_home.RowCount -1 ] := dm.qselect1.FieldValues['encode_date'];
                grd_ar_home.Cells[2,grd_ar_home.RowCount -1 ] :=formatfloat('00000', dm.qselect1.FieldValues['transaction_id']);
                grd_ar_home.Cells[3,grd_ar_home.RowCount -1 ] := dm.qselect1.FieldValues['name'];
                grd_ar_home.Cells[4,grd_ar_home.RowCount -1 ] := formatfloat('##,##0.##',dm.qselect1.FieldValues['balance']);
                bal_rec := dm.qselect1.FieldValues['balance'] + dm.qselect1.FieldValues['amt'];
                ar_tot_cost := ar_tot_cost + dm.qselect1.FieldValues['balance'];
                ar_bal_temp := ar_bal_temp + bal_rec;
                grd_ar_home.Cells[5,grd_ar_home.RowCount -1 ] := formatfloat('##,##0.##',bal_rec);


                grd_ar_home.CellProperties[2,grd_ar_home.rowcount-1].Alignment := taRightJustify;
                grd_ar_home.CellProperties[4,grd_ar_home.rowcount-1].Alignment := taRightJustify;
                grd_ar_home.CellProperties[5,grd_ar_home.rowcount-1].Alignment := taRightJustify;
                grd_ar_home.AddRow;
                dm.qselect1.Next;

                end;
        end;
                grd_ar_home.FloatingFooter.Visible  := true;
                grd_ar_home.cells[3,grd_ar_home.rowcount-1]  := 'No of Records  : ' + inttostr(dm.qselect1.RecordCount);
                grd_ar_home.cells[4,grd_ar_home.rowcount-1]  := 'Total Cost  : '+ formatfloat('#,##0.##', ar_tot_cost) ;
                grd_ar_home.cells[5,grd_ar_home.rowcount-1]  := 'Total Bal.  : ' + formatfloat('#,##0.##', ar_bal_temp);
end;

procedure Tfrm_accounts_receivable.edt_searchChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tfrm_accounts_receivable.EscExecute(Sender: TObject);
begin
  close;
end;

procedure Tfrm_accounts_receivable.FormActivate(Sender: TObject);
begin
  btn_query.Click;
  edt_search.SetFocus;
end;

procedure Tfrm_accounts_receivable.grd_ar_homeClick(Sender: TObject);
begin
  ar_id := integer(grd_ar_home.objects[0,grd_ar_home.row]);
end;

procedure Tfrm_accounts_receivable.grd_ar_homeDblClick(Sender: TObject);
begin
  ar_id := integer(grd_ar_home.objects[0,grd_ar_home.row]);
  frm_ar_details.Show;
end;

end.
