unit purchase_order_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, StdCtrls, Mask, RzEdit, RzPanel, RzRadChk, RzCmboBx,
  Grids, AdvObj, BaseGrid, AdvGrid, RzButton, RzLabel, ActnList, AdvPanel,
  ExtCtrls, System.Actions;

type
  Tpurchase_order_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_po_id: TRzLabel;
    btn_query: TRzBitBtn;
    grd_order_details: TAdvStringGrid;
    RzGroupBox1: TRzGroupBox;
    RzLabel3: TRzLabel;
    edt_company_name: TRzEdit;
    RzLabel5: TRzLabel;
    edt_address: TRzEdit;
    RzLabel6: TRzLabel;
    edt_phone_number: TRzEdit;
    dtp_date_of_arrival: TRzDateTimePicker;
    RzLabel7: TRzLabel;
    btn_add_item: TRzBitBtn;
    btn_select_supplier: TRzBitBtn;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    edt_net_cost: TRzEdit;
    edt_total_discount: TRzEdit;
    edt_discount: TRzEdit;
    RzLabel12: TRzLabel;
    edt_freight_charges: TRzEdit;
    edt_total_payment: TRzEdit;
    RzLabel13: TRzLabel;
    btn_issue_order: TRzBitBtn;
    RzLabel14: TRzLabel;
    edt_remarks: TRzRichEdit;
    btn_delete_item: TRzBitBtn;
    btn_print_order: TRzBitBtn;
    RzLabel16: TRzLabel;
    RzLabel15: TRzLabel;
    cmb_trans_code: TRzComboBox;
    esc: TAction;
    btn_compute: TRzBitBtn;
    RzLabel4: TRzLabel;
    cmb_status: TRzComboBox;
    btn_close: TRzBitBtn;
    procedure btn_queryClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_select_supplierClick(Sender: TObject);
    procedure btn_add_itemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure btn_issue_orderClick(Sender: TObject);
    procedure btn_computeClick(Sender: TObject);
    procedure edt_discountChange(Sender: TObject);
    procedure edt_total_discountChange(Sender: TObject);
    procedure edt_freight_chargesChange(Sender: TObject);
    procedure btn_delete_itemClick(Sender: TObject);
    procedure grd_order_detailsClick(Sender: TObject);
    procedure grd_order_detailsDblClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btn_print_orderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  purchase_order_frm: Tpurchase_order_frm;

implementation

uses procedures, variables, inventory, supplier_masterfile, datamodule,
  purchase_order_additems, Purchasing_order_details_report;

{$R *.dfm}

procedure Tpurchase_order_frm.btn_add_itemClick(Sender: TObject);
begin
    tag_stock := 3;
    mf_inventory_frm.ShowModal;
    if mf_stock_id <> 0 then
    begin
        btn_delete_item.Enabled := true;
        btn_print_order.Enabled := true;
        btn_issue_order.Enabled := true;
        btn_issue_order.Default := true;
    end;
    btn_query.Click;
end;

procedure Tpurchase_order_frm.btn_closeClick(Sender: TObject);
begin
    if dm.qselect1.RecordCount <> 0 then
    begin
        if purchase_id <> 0 then
            close
        else
        if messagedlg('Do You Want To Delete Order?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
            sql := 'delete from purchase_order where po_id=' + inttostr(purchase_id);
            showmessage(sql);
            procedures.exec_func;
            showmessage('Purchase Order Cancelled');
            supp_temp := 0;
            supp_tag := 0;
            check_temp := 0;
            purchase_id := 0;
            order_details_id := 0;
            close;
        end;
    end else
      close;
end;

procedure Tpurchase_order_frm.btn_computeClick(Sender: TObject);
begin
    if edt_discount.Text = '' then
        edt_discount.Text := inttostr(0);

    if edt_discount.Text <> '0' then
    begin
        edt_total_discount.Text := floattostr((strtofloat(edt_discount.Text) / 100) * strtofloat(edt_net_cost.Text));
        edt_total_discount.Enabled := false;
    end else
        edt_total_discount.Enabled := true;

    edt_total_payment.Text := floattostr(strtofloat(edt_net_cost.Text) - strtofloat(edt_total_discount.Text) + strtofloat(edt_freight_charges.Text));
end;

procedure Tpurchase_order_frm.btn_delete_itemClick(Sender: TObject);
begin
    sql := 'delete from purchase_order where id = ' + quotedstr(inttostr(order_details_id));

    if messagedlg('Are you sure you want to delete this Item?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
    begin
        procedures.exec_func;
        btn_query.Click;
        showmessage('Item Removed');
    end;
    btn_query.Click;
end;

procedure Tpurchase_order_frm.btn_issue_orderClick(Sender: TObject);
begin
    query := 'update purchase_order set supplier_id=' + quotedstr(inttostr(supp_temp)) + ', machine_id=' + quotedstr(result) + ', transaction_code=' + quotedstr(inttostr(longint(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
             ', transaction_value="-1", inventory_value="1", po_cost=' + quotedstr(edt_total_payment.Text) + ', total_discount=' + quotedstr(edt_total_discount.Text) +
             ', freight_charges=' + quotedstr(edt_freight_charges.Text) + ', status_id=' + quotedstr(inttostr(longint(cmb_status.Items.Objects[cmb_status.ItemIndex]))) +
             ', remarks=' + quotedstr(edt_remarks.Text) + ', date_of_purchase=' + quotedstr(formatdatetime('yyyy-mm-dd',now)) + ', date_of_arrival=' + quotedstr(formatdatetime('yyyy-mm-dd',dtp_date_of_arrival.Date));

    if purchase_tag = 0 then
        query := query + ', encode_date=' + quotedstr(formatdatetime('yyyy-mm-dd',now)) + ', encode_id=' + quotedstr(inttostr(encoder))
    else
        query := query + ', update_date=' + quotedstr(formatdatetime('yyyy-mm-dd',now)) + ', update_id=' + quotedstr(inttostr(encoder));

    qwhere := ' where po_id=' + quotedstr(inttostr(new_id));

    sql := query + qwhere;
    procedures.exec_func;
    showmessage('Purchase Ordered');
    close;
end;

procedure Tpurchase_order_frm.btn_print_orderClick(Sender: TObject);
begin
      frm_po_details_report.qr_po_details_report.Preview;
end;

procedure Tpurchase_order_frm.btn_queryClick(Sender: TObject);
begin
    procedures.grd_setup(grd_order_details);
    //showmessage(inttostr(purchase_id));
    if po_counter <> 0 then
    //if purchase_id <> 0 then
    begin
    //new purchase_order
        query := 'select ifnull(company_name,"NA") as company_name, ifnull(address," ") as address, ifnull(phone_number,"NA") as phone_number from supplier';
        qwhere := ' where id=' + inttostr(supp_temp);

        sql := query + qwhere;
        procedures.select_func;

        if dm.qselect1.RecordCount <> 0 then
        begin
            edt_company_name.Text := dm.qselect1.FieldValues['company_name'];
            edt_address.Text := dm.qselect1.FieldValues['address'];
            edt_phone_number.Text := dm.qselect1.FieldValues['phone_number'];
        end;
        //purchase_id := new_id;
        //po_counter := 0;
        //cmb_status.ItemIndex := cmb_trans_code.Items.IndexOf('Ordered');   //newly added
    end else
    begin
        edt_company_name.Clear;
        edt_address.Clear;
        edt_phone_number.Clear;
        //cmb_status.ItemIndex := cmb_trans_code.Items.IndexOf('Ordered');   //newly added
    end;
    //view purchase_order
    net_cost := 0;
    //inventory
    query := 'select id, ifnull(po_id,0) as po_id, ifnull((select barcode from inventory where id=purchase_order.inventory_id),0) as barcode, ifnull((select description from inventory where id=purchase_order.inventory_id),"NA") as description' +
             ', ifnull((select description from attributes where id=purchase_order.type_id),"NA") as type, ifnull((select description from attributes where id=purchase_order.unit_id),"NA") as unit' +
             ', ifnull(quantity,0) as quantity, ifnull(inventory_cost,0) as inventory_cost, ifnull(discount,0) as discount, ifnull(cost,0) as cost' +
    //supplier
             ', ifnull(supplier_id,0) as supplier_id, ifnull((select company_name from supplier where id=purchase_order.supplier_id),"NA") as company_name' +
             ', ifnull((select address from supplier where id=purchase_order.supplier_id),"NA") as address, ifnull((select phone_number from supplier where id=purchase_order.supplier_id),0) as phone_number' +
    //status
             ', ifnull(status_id,0) as status_id from purchase_order';
    qwhere := ' where po_id=' + inttostr(new_id);

    sql := query + qwhere;
    procedures.select_func;
    //showmessage(inttostr(new_id));
    //showmessage(inttostr(dm.qselect1.FieldValues['status_id']));

    if DM.qselect1.RecordCount <> 0 then
    begin
        cmb_status.ItemIndex := cmb_status.Items.IndexOfObject(TObject(dm.qselect1.FieldByName('status_id').AsInteger));

        if cmb_status.ItemIndex = 0 then
        begin
                cmb_status.ItemIndex := cmb_status.Items.IndexOf('Ordered');
        end else
        begin
            cmb_status.ItemIndex := cmb_status.Items.IndexOfObject(TObject(dm.qselect1.FieldByName('status_id').AsInteger));
        end;

        lbl_po_id.Caption := formatfloat('000000000',dm.qselect1.FieldValues['po_id']);
        if purchase_id <> 0 then
        begin
            supp_temp := dm.qselect1.FieldValues['supplier_id'];
            edt_company_name.Text := dm.qselect1.FieldValues['company_name'];
            edt_address.Text := dm.qselect1.FieldValues['address'];
            edt_phone_number.Text := dm.qselect1.FieldValues['phone_number'];
        end;
        //btn_issue_order.Caption := 'Update';
        btn_issue_order.Enabled := true;
        btn_add_item.Enabled := true;
        btn_delete_item.Enabled := true;
        btn_print_order.Enabled := true;

        if dm.qselect1.FieldValues['status_id'] = 70 then
        begin
            btn_select_supplier.Enabled := false;
            btn_add_item.Enabled := false;
            btn_delete_item.Enabled := false;
            btn_issue_order.Enabled := false;
        end;

        while DM.qselect1.Eof <> true do
        begin
            net_cost := net_cost + dm.qselect1.FieldValues['cost'];

            id :=DM.qselect1.FieldValues['id'];
            grd_order_details.objects[0,grd_order_details.rowcount-1] := pointer(id);

            grd_order_details.cells[1,grd_order_details.rowcount-1] := formatfloat('000000000',DM.qselect1.fieldvalues['barcode']);
            grd_order_details.cells[2,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['description'];
            grd_order_details.cells[3,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['type'];
            grd_order_details.cells[4,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['unit'];
            grd_order_details.cells[5,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['quantity'];
            grd_order_details.cells[6,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['inventory_cost'];
            grd_order_details.cells[7,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['discount'];
            grd_order_details.cells[8,grd_order_details.rowcount-1] := DM.qselect1.fieldvalues['cost'];

            grd_order_details.addrow;
            DM.qselect1.Next;
        end;
    grd_order_details.floatingfooter.visible := true;
    grd_order_details.cells[2,grd_order_details.rowcount-1] := 'Total Items: ' + inttostr(dm.qselect1.RecordCount);
    grd_order_details.cells[8,grd_order_details.rowcount-1] := inttostr(net_cost);
    end else
        btn_issue_order.Caption := 'Issue Order';
    edt_net_cost.Text := inttostr(net_cost);
    btn_compute.Click;
end;

procedure Tpurchase_order_frm.btn_select_supplierClick(Sender: TObject);
begin
    supp_tag := 1;
    mf_supplier_frm.ShowModal;
    if supp_temp <> 0 then
    begin
        btn_add_item.Enabled := true;
        btn_query.Click;
    end;
end;

procedure Tpurchase_order_frm.edt_discountChange(Sender: TObject);
begin
    btn_compute.Click;
end;

procedure Tpurchase_order_frm.edt_freight_chargesChange(Sender: TObject);
begin
    if edt_freight_charges.Text = '' then
        edt_freight_charges.Text := inttostr(0);
    btn_compute.Click;
end;

procedure Tpurchase_order_frm.edt_total_discountChange(Sender: TObject);
begin
    if edt_total_discount.Text = '' then
        edt_total_discount.Text := inttostr(0);
    btn_compute.Click;
end;

procedure Tpurchase_order_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tpurchase_order_frm.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_status,'id, description','doh','attributes','type="po_status"');
    cmb_pop(cmb_trans_code,'id, code','doh','transaction_code','1=1');
    cmb_status.ItemIndex := cmb_status.Items.IndexOf('Ordered');
    cmb_trans_code.ItemIndex := cmb_trans_code.Items.IndexOf('P');
    //cmb_trans_code.Enabled := false;
////////////////////////////////////////////////////////////////////////////////
    sql := 'select ifnull(max(po_id),0) as max_id from purchase_order';
    procedures.select_func;

    if purchase_id = 0 then
    begin
        if dm.qselect1.RecordCount = 0 then
        begin
            new_id := 1;
        end else
        begin
            new_id := dm.qselect1.FieldValues['max_id']+1;
        end;
            lbl_po_id.Caption := formatfloat('000000000',new_id);
            //showmessage(inttostr(purchase_id));
        //purchase_id := new_id;
        //po_counter := 0;
        if purchase_id <> 0 then
            //new_id := purchase_id;
            purchase_id := new_id;
            po_id2 := new_id;
    end;
    //showmessage(inttostr(purchase_id));
    dtp_date_of_arrival.Date := now;
    procedures.grd_setup(grd_order_details);
    btn_add_item.Enabled := false;
    btn_delete_item.Enabled := false;
    btn_print_order.Enabled := false;
    btn_issue_order.Enabled := false;

    btn_select_supplier.Enabled := true;

    //po_counter := 1;
    btn_query.Click;
end;

procedure Tpurchase_order_frm.grd_order_detailsClick(Sender: TObject);
begin
    order_details_id := integer(grd_order_details.objects[0,grd_order_details.row]);
end;

procedure Tpurchase_order_frm.grd_order_detailsDblClick(Sender: TObject);
begin
    purchase_order_additem.ShowModal;
end;

procedure Tpurchase_order_frm.RzBitBtn1Click(Sender: TObject);
begin
    //showmessage(inttostr(purchase_id));
    if dm.qselect1.RecordCount <> 0 then
    begin
        if purchase_id <> 0 then
            close
        else
        if messagedlg('Do You Want To Delete Order?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
            sql := 'delete from purchase_order where po_id=' + inttostr(po_id2);
            procedures.exec_func;
            showmessage('Purchase Order Cancelled');
            supp_temp := 0;
            supp_tag := 0;
            check_temp := 0;
            purchase_id := 0;
            order_details_id := 0;
            po_id2 := 0;
            close;
        end;
    end else
      close;
end;

end.
