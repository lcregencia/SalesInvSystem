unit stock_card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Grids, AdvObj, BaseGrid, AdvGrid,
  ActnList, AdvPanel, ExtCtrls, RzPanel, ComCtrls, RzDTP, RzRadChk,
  System.Actions;

type
  Tstock_card_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    grd_stock_card: TAdvStringGrid;
    btn_query: TRzBitBtn;
    btn_select_inventory: TRzBitBtn;
    btn_close: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_description: TRzLabel;
    RzLabel3: TRzLabel;
    lbl_id: TRzLabel;
    esc: TAction;
    cb_date: TRzCheckBox;
    dtp_from: TRzDateTimePicker;
    dtp_to: TRzDateTimePicker;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    btn_print: TRzBitBtn;
    RzLabel6: TRzLabel;
    refresh: TAction;
    print: TAction;
    select_item: TAction;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_select_inventoryClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure cb_dateClick(Sender: TObject);
    procedure dtp_fromChange(Sender: TObject);
    procedure dtp_toChange(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure select_itemExecute(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  stock_card_frm: Tstock_card_frm;

implementation

uses procedures, variables, datamodule, inventory, Stock_card_report;

{$R *.dfm}

procedure Tstock_card_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tstock_card_frm.btn_printClick(Sender: TObject);
begin
      frm_stock_card_report.qr_stock_card_report.Preview;
end;

procedure Tstock_card_frm.btn_queryClick(Sender: TObject);
begin
    balance := 0;
    procedures.grd_setup(grd_stock_card);

    query := 'select id, ifnull((select description from inventory where id=transaction.inventory_id),0) as description, ifnull(encode_date,0) as encode_date, ifnull(reference_id, 0) as reference, ifnull(transaction_id, 0) as transaction_id' +
             ', ifnull((select description from transaction_code where trans_code=transaction_code.id),0) as trans_code' +
             ', ifnull((select concat(fname," ",lname," ") from customer where customer_id=customer.id),"NA") as customer' +
             ', ifnull((select concat(fname," ",lname," ") from employee where id=transaction.encode_id),"NONE") as employee' +
             ', ifnull((select description from attributes where id=unit_id),"NA") as unit' +
             ', ifnull(inventory_value,0) as inventory_value,ifnull(quantity,0) as quantity from transaction';
    qwhere := ' where inventory_id = ' + inttostr(mf_stock_id);
    qorder := ' order by encode_date';

    if cb_date.Checked = true then
    begin
        qwhere := qwhere + ' and encode_date between ' + quotedstr(formatdatetime('yyyy-mm-dd',dtp_from.Date)) + ' and ' + quotedstr(formatdatetime('yyyy-mm-dd',dtp_to.Date));
    end;

    sql := query + qwhere + qorder;
    procedures.select_func;

    grd_stock_card.clearnormalcells;
    grd_stock_card.rowcount := 2;
    grd_stock_card.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
        lbl_description.Caption := dm.qselect1.FieldValues['description'];
        lbl_id.Caption := formatfloat('000000000',dm.qselect1.FieldValues['id']);
        while DM.qselect1.Eof <> true do
        begin
            balance := balance + dm.qselect1.FieldValues['quantity'] * dm.qselect1.FieldValues['inventory_value'];
            id :=DM.qselect1.FieldValues['id'];

            grd_stock_card.objects[0,grd_stock_card.rowcount-1] := pointer(id);

            grd_stock_card.cells[1,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['encode_date'];

            if dm.qselect1.FieldValues['transaction_id'] = 0 then
                grd_stock_card.cells[2,grd_stock_card.rowcount-1] := formatfloat('000000000',DM.qselect1.fieldvalues['reference'])
            else
                grd_stock_card.cells[2,grd_stock_card.rowcount-1] := formatfloat('000000000',DM.qselect1.fieldvalues['transaction_id']);

            grd_stock_card.cells[3,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['trans_code'];
            grd_stock_card.cells[4,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['customer'];
            grd_stock_card.cells[5,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['employee'];
            grd_stock_card.cells[6,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['unit'];
            grd_stock_card.cells[7,grd_stock_card.rowcount-1] := dm.qselect1.FieldValues['quantity'];
            grd_stock_card.cells[8,grd_stock_card.rowcount-1] := inttostr(balance);

            grd_stock_card.addrow;
            DM.qselect1.Next;
        end;
    end;
    grd_stock_card.floatingfooter.visible := true;
    grd_stock_card.cells[2,grd_stock_card.rowcount-1]  := 'Total Records:   ' + inttostr(dm.qselect1.RecordCount);
    grd_stock_card.cells[8,grd_stock_card.rowcount-1]  := 'Total Balance:   ' + inttostr(balance);
end;

procedure Tstock_card_frm.btn_select_inventoryClick(Sender: TObject);
begin
    tag_stock := 2;
    mf_inventory_frm.ShowModal;
    btn_query.Click;
end;

procedure Tstock_card_frm.cb_dateClick(Sender: TObject);
begin
    if cb_date.Checked = true then
    begin
        dtp_from.Enabled := true;
        dtp_to.Enabled := true;
    end else
    begin
        dtp_from.Enabled := false;
        dtp_to.Enabled := false;
    end;
    btn_query.Click;
end;

procedure Tstock_card_frm.dtp_fromChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tstock_card_frm.dtp_toChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tstock_card_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tstock_card_frm.FormActivate(Sender: TObject);
begin
    dtp_from.Date := now;
    dtp_to.Date := now;
    btn_query.Click;
    grd_stock_card.SetFocus;
end;

procedure Tstock_card_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tstock_card_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tstock_card_frm.select_itemExecute(Sender: TObject);
begin
    btn_select_inventory.Click;
end;

end.
