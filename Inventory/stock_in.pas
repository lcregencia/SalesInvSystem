unit stock_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, RzPanel, Grids, AdvObj, BaseGrid, AdvGrid,
  RzButton, StdCtrls, RzLabel, ExtCtrls, System.Actions;

type
  Tinventory_add_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_batchid: TRzLabel;
    btn_query: TRzBitBtn;
    btn_close: TRzBitBtn;
    btn_ok: TRzBitBtn;
    grd_addstocks: TAdvStringGrid;
    btn_add_item: TRzBitBtn;
    btn_delete: TRzBitBtn;
    RzPanel1: TRzPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    btn_from_purchase: TRzBitBtn;
    RzLabel13: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    delete: TAction;
    reference: TAction;
    refresh: TAction;
    btn_from_distribution: TRzBitBtn;
    procedure btn_add_itemClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure grd_addstocksClick(Sender: TObject);
    procedure grd_addstocksDblClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure btn_from_distributionClick(Sender: TObject);
    procedure btn_from_purchaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  inventory_add_frm: Tinventory_add_frm;

implementation

uses variables, inventory, procedures, datamodule, add_stocks,
  authentication_frm, purchase_order, frm_control_settings;

{$R *.dfm}

procedure Tinventory_add_frm.btn_add_itemClick(Sender: TObject);
begin
    tag_stock := 1;
    mf_inventory_frm.ShowModal;
    btn_query.Click;
end;

procedure Tinventory_add_frm.btn_closeClick(Sender: TObject);
begin
  if dm.qselect1.RecordCount = 0 then
    begin
        close;
    end else
    begin
        if confirmed = 0 then
        begin
            if messagedlg('Do You Want To Cancel Stock-In?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
                query := 'delete from transaction';
                qwhere := ' where batch_id = ' + quotedstr(inttostr(max_batch_id));
                sql := query + qwhere;
                procedures.exec_func;
                btn_query.Click;
                close;
            end;
        end else
        begin
            showmessage('Stocks Updated');
            close;
        end;
    end;
    stockin_id := 0;
end;


procedure Tinventory_add_frm.btn_deleteClick(Sender: TObject);
begin
   // showmessage(inttostr(max_batch_id));
    sql := 'delete from transaction where batch_id = ' + quotedstr(inttostr(max_batch_id));
    procedures.exec_func;
    btn_query.Click;
end;

procedure Tinventory_add_frm.btn_from_distributionClick(Sender: TObject);
begin
//    mf_po_frm.ShowModal;
end;

procedure Tinventory_add_frm.btn_from_purchaseClick(Sender: TObject);
begin
    mf_po_frm.ShowModal;
end;

procedure Tinventory_add_frm.btn_okClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
      begin
      confirmed := 18;
      confirmation_frm.ShowModal;
      end
      else
      begin
      showmessage('Stocks Updated');
      btn_query.Click;
      close;
      end;
end;

procedure Tinventory_add_frm.btn_queryClick(Sender: TObject);
begin
    procedures.grd_setup(grd_addstocks);
    query := 'select id, ifnull((select barcode from inventory where inventory_id=inventory.id),0) as barcode' +
             ', ifnull((select description from inventory where inventory_id=inventory.id),"NA") as description' +
             ', ifnull((select description from attributes where transaction.category=id),"NA") as category' +
             ', ifnull((select description from attributes where transaction.brand=id),"NA") as brand' +
             ', ifnull((select description from attributes where transaction.type_id=id),"NA") as type, ifnull(quantity,0) as quantity from transaction';
    qwhere := ' where batch_id=' + quotedstr(inttostr(max_batch_id));
    qgroup := ' group by inventory_id';

    sql := query + qwhere + qgroup;

    procedures.select_func;

    grd_addstocks.clearnormalcells;
    grd_addstocks.rowcount := 2;
    grd_addstocks.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
    while DM.qselect1.Eof <> true do
    begin
        id :=DM.qselect1.FieldValues['id'];

        grd_addstocks.objects[0,grd_addstocks.rowcount-1] := pointer(id);

        grd_addstocks.cells[1,grd_addstocks.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['barcode']);
        grd_addstocks.cells[2,grd_addstocks.rowcount-1]  := DM.qselect1.fieldvalues['description'];
        grd_addstocks.cells[3,grd_addstocks.rowcount-1]  := DM.qselect1.fieldvalues['category'];
        grd_addstocks.cells[4,grd_addstocks.rowcount-1]  := DM.qselect1.fieldvalues['brand'];
        grd_addstocks.cells[5,grd_addstocks.rowcount-1]  := DM.qselect1.fieldvalues['type'];
        grd_addstocks.cells[6,grd_addstocks.rowcount-1]  := DM.qselect1.fieldvalues['quantity'];

        grd_addstocks.CellProperties[6,grd_addstocks.rowcount-1].Alignment := taRightJustify;

        grd_addstocks.addrow;
        DM.qselect1.Next;
    end;
    end;
    grd_addstocks.floatingfooter.visible := true;
    grd_addstocks.cells[2,grd_addstocks.rowcount-1]  := 'Total Items:   ' + inttostr(dm.qselect1.RecordCount);
end;

procedure Tinventory_add_frm.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tinventory_add_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tinventory_add_frm.FormActivate(Sender: TObject);
begin
    confirmed := 0;
    query := ' select ifnull(max(batch_id),0) + 1 as batch_id from transaction';
    sql := query;

    procedures.select_func;

    max_batch_id := DM.qselect1.fieldvalues['batch_id'];
    lbl_batchid.Caption := formatfloat('0000000',DM.qselect1.fieldvalues['batch_id']);

    btn_query.Click;
end;

procedure Tinventory_add_frm.grd_addstocksClick(Sender: TObject);
begin
  stockin_id := integer(grd_addstocks.objects[0,grd_addstocks.row]);
end;

procedure Tinventory_add_frm.grd_addstocksDblClick(Sender: TObject);
begin
  add_stocks_frm.ShowModal;
end;

procedure Tinventory_add_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
