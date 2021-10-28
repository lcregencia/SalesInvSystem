unit purchase_order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, Grids, AdvObj,
  BaseGrid, AdvGrid, RzCmboBx, RzSplit, RzLabel, ExtCtrls, RzPanel, ComCtrls,
  RzDTP, RzRadChk, System.Actions;

type
  Tmf_po_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    po_filter: TRzSplitter;
    AdvPanel3: TAdvPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    cmb_supplier: TRzComboBox;
    AdvPanel2: TAdvPanel;
    grd_mf_po: TAdvStringGrid;
    btn_query: TRzBitBtn;
    edt_search: TRzEdit;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    chk_arrivaldate: TRzCheckBox;
    dtp_arrivaldate: TRzDateTimePicker;
    dtp_datepurchase: TRzDateTimePicker;
    chk_purchasedate: TRzCheckBox;
    cmb_status: TRzComboBox;
    RzLabel6: TRzLabel;
    btn_ok: TRzBitBtn;
    btn_add_order: TRzBitBtn;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel12: TRzLabel;
    btn_print: TRzBitBtn;
    esc: TAction;
    add_order: TAction;
    search: TAction;
    refresh: TAction;
    filter: TAction;
    print: TAction;
    btn_close: TRzBitBtn;

    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure cmb_supplierClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtp_datearrivalChange(Sender: TObject);
    procedure dtp_datearrival1Change(Sender: TObject);
    procedure dtp_arrivaldateChange(Sender: TObject);
    procedure chk_arrivaldateClick(Sender: TObject);
    procedure dtp_datepurchaseChange(Sender: TObject);
    procedure chk_purchasedateClick(Sender: TObject);
    procedure cmb_paymentClick(Sender: TObject);
    procedure cmb_statusClick(Sender: TObject);
    procedure grd_mf_poClick(Sender: TObject);
    procedure grd_mf_poDblClick(Sender: TObject);
    procedure btn_add_orderClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure add_orderExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure filterExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure edt_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_printClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_po_frm: Tmf_po_frm;

implementation

uses datamodule, procedures, sql_statement, variables, purchase_order_details,
  Purchasing_order_report;

{$R *.dfm}

procedure Tmf_po_frm.add_orderExecute(Sender: TObject);
begin
    btn_add_order.Click;
end;

procedure Tmf_po_frm.btn_add_orderClick(Sender: TObject);
begin
    purchase_id := 0;
    //po_counter := 0;
    purchase_order_frm.ShowModal;
    btn_query.Click;
end;

procedure Tmf_po_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tmf_po_frm.btn_okClick(Sender: TObject);
begin
    if rr_tag = 1 then
    begin
        //rr_close := 1;
        btn_close.Click;
    end else
    begin
      po_counter := 1;
      purchase_order_frm.ShowModal;
      btn_query.Click;
    end;
end;

procedure Tmf_po_frm.btn_printClick(Sender: TObject);
begin
    frm_po_report.qr_po_report.Preview;
end;

procedure Tmf_po_frm.btn_queryClick(Sender: TObject);
begin
    edt_search.SetFocus;
    procedures.grd_setup(grd_mf_po);

    query := ' select ifnull(purchase_order.id,0) as id, ifnull(purchase_order.po_id,0) as po_id, ifnull((date_of_arrival), "NA") as dateofarrival ' +
             ', ifnull((date_of_purchase), "NA") as dateofpurchase ' +
             ', ifnull((purchase_order.po_id), 0) as refferenceno ' +
             ', ifnull(sum(quantity), 0) as quantity ' +
             ', ifnull(sum(cost), 0) as cost ' +
             ', ifnull(sum((discount/100) * cost), 0) as discount ' +
             ', ifnull((select company_name from supplier where purchase_order.supplier_id = supplier.id), "NA") as company_name ' +
             ', ifnull((select phone_number from supplier where purchase_order.supplier_id = supplier.id), "NA") as phone_number ' +
             ', ifnull((select description from attributes where purchase_order.status_id = attributes.id), "NA") as status ' +
             '  from purchase_order left join supplier on purchase_order.supplier_id = supplier.id';

    qwhere := ' where 1=1';
    qgroup := ' group by purchase_order.po_id';
    qorder := ' order by date_of_arrival asc';

    if edt_search.text <> '' then
        qwhere := qwhere + ' and purchase_order.po_id like ' + quotedstr('%'+trim(edt_search.Text)+'%');

    if chk_arrivaldate.Checked then
    begin
        dtp_arrivaldate.Enabled := true;
        qwhere := qwhere + ' and purchase_order.date_of_arrival = ' +quotedstr(formatdatetime('dd-MM-yyyy' , dtp_arrivaldate.Date ));
    end;

    if chk_purchasedate.Checked then
    begin
        dtp_datepurchase.Enabled := true;
        qwhere := qwhere + ' and purchase_order.date_of_purchase = ' +quotedstr(formatdatetime('dd-MM-yyyy' , dtp_datepurchase.Date ));
    end;

    if cmb_supplier.ItemIndex <> 0 then
    begin
        qwhere := qwhere + ' and purchase_order.supplier_id = ' + quotedstr(inttostr(longint(cmb_supplier.Items.Objects[cmb_supplier.ItemIndex])));
    end;

    if cmb_status.ItemIndex <> 0 then
    begin
        qwhere := qwhere + ' and purchase_order.status_id = ' + quotedstr(inttostr(longint(cmb_status.Items.Objects[cmb_status.ItemIndex])));
    end;

    sql := query + qwhere + qgroup;
    procedures.select_func;

    grd_mf_po.clearnormalcells;
    grd_mf_po.rowcount := 2;
    grd_mf_po.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
        while DM.qselect1.Eof <> true do
        begin
            id :=DM.qselect1.FieldValues['po_id'];

            grd_mf_po.objects[0,grd_mf_po.rowcount-1] := pointer(id);

            grd_mf_po.cells[1,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['dateofarrival'];
            grd_mf_po.cells[2,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['dateofpurchase'];
            grd_mf_po.cells[3,grd_mf_po.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['refferenceno']);
            grd_mf_po.cells[4,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['company_name'];
            grd_mf_po.cells[5,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['phone_number'];
            grd_mf_po.cells[6,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['quantity'];
            grd_mf_po.cells[7,grd_mf_po.rowcount-1]  := formatfloat('######0.00',DM.qselect1.fieldvalues['cost']);
            grd_mf_po.cells[8,grd_mf_po.rowcount-1]  := formatfloat('######0.00',DM.qselect1.fieldvalues['discount']);
            grd_mf_po.cells[9,grd_mf_po.rowcount-1]  := DM.qselect1.fieldvalues['status'];

            grd_mf_po.CellProperties[7,grd_mf_po.rowcount-1].Alignment := taRightJustify;
            grd_mf_po.CellProperties[8,grd_mf_po.rowcount-1].Alignment := taRightJustify;

            grd_mf_po.addrow;
            DM.qselect1.Next;
        end;
        grd_mf_po.floatingfooter.visible := true;
    end;
end;

procedure Tmf_po_frm.chk_arrivaldateClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.chk_purchasedateClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.cmb_paymentClick(Sender: TObject);
begin
     btn_query.Click;
end;

procedure Tmf_po_frm.cmb_statusClick(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tmf_po_frm.cmb_supplierClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.dtp_datearrival1Change(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.dtp_datearrivalChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.dtp_datepurchaseChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.edt_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    grd_mf_po.SetFocus;
end;

procedure Tmf_po_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tmf_po_frm.filterExecute(Sender: TObject);
begin
  if po_filter.HotSpotClosed = true then
  begin
      po_filter.RestoreHotSpot;
  end else
  begin
      po_filter.CloseHotSpot;
  end;
end;

procedure Tmf_po_frm.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_supplier,'id, company_name','doh','supplier','1=1');
    cmb_pop(cmb_status,'id, description','doh','attributes','type="po_status"');

    edt_search.SetFocus;
    dtp_arrivaldate.Date := (now);
    dtp_datepurchase.Date := (now);
    purchase_id := 0;
    btn_query.Click;
end;

procedure Tmf_po_frm.grd_mf_poClick(Sender: TObject);
begin
    purchase_id := integer(grd_mf_po.objects[0,grd_mf_po.row]);
    new_id := purchase_id;
end;

procedure Tmf_po_frm.grd_mf_poDblClick(Sender: TObject);
begin
    btn_ok.Click;
end;

procedure Tmf_po_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tmf_po_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_po_frm.RzBitBtn1Click(Sender: TObject);
begin
    close;
end;

procedure Tmf_po_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

procedure Tmf_po_frm.dtp_arrivaldateChange(Sender: TObject);
begin
    btn_query.Click;
end;

end.
