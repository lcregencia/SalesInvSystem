unit receiving_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, PlatformDefaultStyleActnCtrls,
  ActnList, ActnMan, AdvPanel, ExtCtrls, RzPanel, Buttons, RzButton, Grids,
  AdvObj, BaseGrid, AdvGrid, RzCmboBx, ComCtrls, RzDTP, System.Actions;

type
  Treceiving_report_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_rr_id: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel15: TRzLabel;
    grd_receiving_report: TAdvStringGrid;
    RzGroupBox1: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    edt_company_name: TRzEdit;
    edt_address: TRzEdit;
    edt_phone_number: TRzEdit;
    dtp_date_of_arrival: TRzDateTimePicker;
    btn_select_supplier: TRzBitBtn;
    btn_confirm: TRzBitBtn;
    btn_delete_item: TRzBitBtn;
    btn_print_order: TRzBitBtn;
    cmb_trans_code: TRzComboBox;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    RzLabel17: TRzLabel;
    nedt_po_no: TRzNumericEdit;
    btn_query: TSpeedButton;
    btn_close: TRzBitBtn;
    lbl_encoder: TRzLabel;
    RzLabel18: TRzLabel;
    btn_insert_to_transaction: TRzBitBtn;
    RzLabel4: TRzLabel;
    lbl_batch_id: TRzLabel;
    cmb_status: TRzComboBox;
    RzLabel8: TRzLabel;
    btn_edit_items: TRzBitBtn;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure btn_select_supplierClick(Sender: TObject);
    procedure nedt_po_noKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_insert_to_transactionClick(Sender: TObject);
    procedure btn_confirmClick(Sender: TObject);
    procedure btn_print_orderClick(Sender: TObject);
    procedure grd_receiving_reportDblClick(Sender: TObject);
    procedure btn_delete_itemClick(Sender: TObject);
    procedure grd_receiving_reportClick(Sender: TObject);
    procedure btn_edit_itemsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  receiving_report_frm: Treceiving_report_frm;

implementation

uses procedures, variables, datamodule, purchase_order, authentication_frm,
  purchase_order_additems;

{$R *.dfm}

procedure Treceiving_report_frm.btn_closeClick(Sender: TObject);
begin
   close;
end;

procedure Treceiving_report_frm.btn_confirmClick(Sender: TObject);
begin
    //finish
    query := 'update transaction set batch_id=' + inttostr(rr_batch_id) + ', machine_id=' + quotedstr(result) + ', branch_id=' + inttostr(branch_id) +
             ', rr_id=' + inttostr(new_id) + ', trans_code=2, status_id=' + quotedstr(inttostr(longint(cmb_status.Items.Objects[cmb_status.ItemIndex]))) +', transaction_value=-1, inventory_value=1, encode_id=' + inttostr(encoder) +
             ', encode_date=' + quotedstr(formatdatetime('yyyy-mm-dd',now));
    qwhere := ' where reference_id=' + inttostr(purchase_id);

    sql := query + qwhere;
    //showmessage(inttostr(rr_id));
    procedures.exec_func;

   sql := ' insert into accounts_payable set po_id  = ' +quotedstr(inttostr(purchase_id))+
              ', machine_id=' + quotedstr(result) +
              ', supplier_id =' +quotedstr(inttostr(supp_temp)) +
              ', transaction_value =-1' +
              ', transaction_code = "P" ' +
              ', encode_date = ' +  quotedstr(formatdatetime('yyyy-mm-dd',(now)));;

              procedures.exec_func;
              //showmessage(sql);

    confirmed  := 19;
    if longint(cmb_status.Items.Objects[cmb_status.ItemIndex]) = 70 then
    begin
        if messagedlg('Closed PO Cannot Be Edited. Do You Want To Proceed?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin

            confirmation_frm.ShowModal;
           { if confirmed = 19 then
            begin

                showmessage('Items Received');
                purchase_id := 0;

                query := 'update purchase_order set status_id=' + quotedstr(inttostr(longint(cmb_status.Items.Objects[cmb_status.ItemIndex])));
                qwhere := ' where po_id=' + inttostr(rr_id);

                sql := query + qwhere;
                procedures.exec_func;

                btn_close.Click;
            end;   }
        end;
    end else
    begin
        confirmation_frm.ShowModal;
       { if confirmed = 19 then
        begin
            showmessage('Items Received');
            purchase_id := 0;

            query := 'update purchase_order set status_id=' + quotedstr(inttostr(longint(cmb_status.Items.Objects[cmb_status.ItemIndex])));
            qwhere := ' where po_id=' + inttostr(rr_id);

            sql := query + qwhere;
            procedures.exec_func;

            btn_close.Click;
        end;  }
    end;
end;

procedure Treceiving_report_frm.btn_delete_itemClick(Sender: TObject);
begin
    sql := 'delete from transaction where id = ' + quotedstr(inttostr(order_details_id));

    if messagedlg('Are you sure you want to delete this Item?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
    begin
        procedures.exec_func;
        btn_query.Click;
        showmessage('Item Removed');
    end;
    btn_query.Click;
end;

procedure Treceiving_report_frm.btn_edit_itemsClick(Sender: TObject);
begin
  rr_edit_qty := 1;
  purchase_order_additem.ShowModal;
  btn_query.Click;
end;

procedure Treceiving_report_frm.btn_insert_to_transactionClick(Sender: TObject);
begin
    query := 'insert into transaction(reference_id, supplier_id, inventory_id, quantity, type_id, cost, cost_sub_total, unit_id, discount, status_id) select po_id' +
             ', supplier_id, inventory_id, quantity, type_id, inventory_cost, cost, unit_id, discount, status_id from purchase_order';
    qwhere := ' where po_id=' + inttostr(purchase_id);

    sql := query + qwhere;
    //showmessage(sql);
    procedures.exec_func;
    //showmessage(inttostr(supp_temp));

   // showmessage(sql);
    //btn_query.Click;
end;

procedure Treceiving_report_frm.btn_print_orderClick(Sender: TObject);
begin
    {query := 'select id, rr_id, reference_id, cost_sub_total, (select company_name from supplier where id=transaction.supplier_id) as supp_company_name' +
             ', (select address from supplier where id=transaction.supplier_id) as supp_address' +
             ', (select description from transaction_code where id=transaction.trans_code) as trans_code' +
             ', (select phone_number from supplier where id=transaction.supplier_id) as supp_contact_no' +
             ', (select barcode from inventory where id=transaction.inventory_id) as barcode' +
             ', (select description from inventory where id=transaction.inventory_id) as description' +
             ', (select description from attributes where id=transaction.type_id) as type' +
             ', (select description from attributes where id=transaction.unit_id) as unit, quantity, cost, discount, status_id, encode_date, encode_id from transaction';
    qwhere := ' where reference_id=' + inttostr(purchase_id);

    sql := query + qwhere;
    procedures.select_func;}

    //dm.rvreports.ProjectFile := 'I:\Programs\DOH\Reports\po_receiving_report.rav';
    //dm.rvreports.Open;
    //dm.rvreports.SelectReport('po_receiving_report', false);
    //dm.rvreports.Execute;
    //dm.rvreports.Close;
end;

procedure Treceiving_report_frm.btn_queryClick(Sender: TObject);
begin
   dtp_date_of_arrival.Date := now;
end;

procedure Treceiving_report_frm.btn_select_supplierClick(Sender: TObject);
begin

    if purchase_id <> 0 then
    begin
        if status_tag <> 1 then
        begin
            if messagedlg('Do You Want to Cancel Current Receiving Report?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
                sql := 'delete from transaction where reference_id=' + inttostr(purchase_id);
                procedures.exec_func;
            end;
        end;
    end;

    status_tag := 0;
    rr_tag := 1;
    mf_po_frm.ShowModal;
    if purchase_id <> 0 then
        btn_confirm.Enabled := true;
    rr_tag := 0;

    query := 'select * from purchase_order';
    qwhere := ' where po_id=' + inttostr(purchase_id);
    sql := query + qwhere;
    procedures.select_func;

    if dm.qselect1.RecordCount <> 0 then
    begin
        if strtoint(dm.qselect1.FieldValues['status_id']) <> 70 then
            btn_insert_to_transaction.Click;
    end;
    btn_query.Click;
end;

procedure Treceiving_report_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Treceiving_report_frm.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_trans_code,'id, code','doh','transaction_code','1=1');
    cmb_pop(cmb_status,'id, description','doh','attributes','type="po_status"');
    cmb_trans_code.ItemIndex := cmb_trans_code.Items.IndexOf('P');
    ///////////////////////////////////////////////////
    sql := 'select ifnull(max(rr_id),0) as max_id, ifnull(max(batch_id),0) + 1 as batch_id from transaction';
    procedures.select_func;

    if purchase_id = 0 then
    begin
        if dm.qselect1.RecordCount = 0 then
        begin
            new_id := 1;
        end else
        begin
            new_id := dm.qselect1.FieldValues['max_id']+1;
            rr_id := new_id;
        end;
        lbl_rr_id.Caption := formatfloat('000000000',new_id);
        lbl_batch_id.Caption := formatfloat('000000000',dm.qselect1.fieldvalues['batch_id']);
        rr_batch_id := dm.qselect1.fieldvalues['batch_id'];
        lbl_encoder.Caption := encoder_name;
            //purchase_id := new_id;
            //po_counter := 0;
        if purchase_id <> 0 then
            purchase_id := new_id;
    end;
    dtp_date_of_arrival.Date := now;
    nedt_po_no.SetFocus;
   // purchase_id := 0;
    btn_confirm.Enabled := true;
    nedt_po_no.Clear;

    btn_query.Click;
    //showmessage(inttostr(purchase_id));
end;

procedure Treceiving_report_frm.grd_receiving_reportClick(Sender: TObject);
begin
  order_details_id := integer(grd_receiving_report.objects[0,grd_receiving_report.row]);
end;

procedure Treceiving_report_frm.grd_receiving_reportDblClick(Sender: TObject);
begin
  btn_edit_items.Click;
end;

procedure Treceiving_report_frm.nedt_po_noKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
      purchase_id := strtoint(nedt_po_no.Text);
      btn_query.Click;
  end;
end;

procedure Treceiving_report_frm.RzBitBtn1Click(Sender: TObject);
begin
    if purchase_id <> 0 then
    begin
        if status_tag <> 1 then
        begin
            if messagedlg('Do You Want to Cancel Current Receiving Report?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
                sql := 'delete from transaction where reference_id=' + inttostr(purchase_id);
                procedures.exec_func;
                receiving_report_frm.btn_query.Click;
                showmessage('Receiving Report Cancelled');
                status_tag := 0;
                close;
            end;
        end else
            close;
    end else
        close;
end;

procedure Treceiving_report_frm.SpeedButton1Click(Sender: TObject);
begin
    procedures.grd_setup(grd_receiving_report);
    net_cost := 0;

    query := 'select ifnull(id,0) as id, ifnull(rr_id,0) as rr_id, ifnull(reference_id,0) as reference_id, ifnull(cost_sub_total,0) as cost_sub_total, ifnull((select company_name from supplier where id=transaction.supplier_id),0) as supp_company_name' +
             ', ifnull((select address from supplier where id=transaction.supplier_id),0) as supp_address' +
             ', ifnull((select description from transaction_code where id=transaction.trans_code),0) as trans_code' +
             ', ifnull((select phone_number from supplier where id=transaction.supplier_id),0) as supp_contact_no' +
             ', ifnull((select barcode from inventory where id=transaction.inventory_id),0) as barcode' +
             ', ifnull((select description from inventory where id=transaction.inventory_id),0) as description' +
             ', ifnull((select description from attributes where id=transaction.type_id),0) as type' +
             ', ifnull((select description from attributes where id=transaction.unit_id),0) as unit, ifnull(quantity,0) as quantity, ' +
             ' ifnull(cost,0) as cost, ifnull(discount,0) as discount, ifnull(status_id,0) as status_id, ifnull(encode_date,0) as  encode_date, ifnull(encode_id,0) as encode_id from transaction';
    qwhere := ' where reference_id=' + inttostr(purchase_id);

    sql := query + qwhere;
    procedures.select_func;
    //showmessage(sql);
    grd_receiving_report.clearnormalcells;
    grd_receiving_report.rowcount := 2;
    grd_receiving_report.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
        cmb_status.ItemIndex := cmb_status.Items.IndexOfObject(TObject(dm.qselect1.FieldByName('status_id').AsInteger));
        rr_status := dm.qselect1.FieldValues['status_id'];
        if dm.qselect1.FieldValues['status_id'] = 70 then
        begin
            //showmessage(inttostr(dm.qselect1.FieldValues['status_id']));
            btn_confirm.Enabled := false;
            //cmb_status.Enabled := false;
            status_tag := 1;
        end;
        //rr_id := dm.qselect1.FieldValues['rr_id'];
        nedt_po_no.Text := formatfloat('000000000', dm.qselect1.FieldValues['reference_id']);
        if dm.qselect1.FieldValues['rr_id'] <> NULL then
        begin
            rr_id := dm.qselect1.FieldValues['rr_id'];
            lbl_rr_id.Caption := formatfloat('000000000',dm.qselect1.FieldValues['rr_id']);
        end;
        edt_company_name.Text := dm.qselect1.FieldValues['supp_company_name'];
        edt_address.Text := dm.qselect1.FieldValues['supp_address'];
        edt_phone_number.Text := dm.qselect1.FieldValues['supp_contact_no'];
        while DM.qselect1.Eof <> true do
        begin
            id :=DM.qselect1.FieldValues['id'];
            po_qty  := dm.qselect1.FieldValues['quantity'];

            grd_receiving_report.objects[0,grd_receiving_report.rowcount-1] := pointer(id);
            grd_receiving_report.objects[1,grd_receiving_report.rowcount-1] := pointer(po_qty);

            grd_receiving_report.cells[1,grd_receiving_report.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['barcode']);
            grd_receiving_report.cells[2,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['description'];
            grd_receiving_report.cells[3,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['type'];
            grd_receiving_report.cells[4,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['unit'];
            grd_receiving_report.cells[5,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['quantity'];
            grd_receiving_report.cells[6,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['cost'];
            grd_receiving_report.cells[7,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['discount'];
            grd_receiving_report.cells[8,grd_receiving_report.rowcount-1]  := dm.qselect1.FieldValues['cost_sub_total'];

            grd_receiving_report.CellProperties[6,grd_receiving_report.rowcount-1].Alignment := taRightJustify;
            grd_receiving_report.CellProperties[7,grd_receiving_report.rowcount-1].Alignment := taRightJustify;
            grd_receiving_report.CellProperties[8,grd_receiving_report.rowcount-1].Alignment := taRightJustify;

            grd_receiving_report.addrow;
            DM.qselect1.Next;
        end;
        grd_receiving_report.floatingfooter.visible := true;
        grd_receiving_report.cells[2,grd_receiving_report.rowcount-1] := 'Total Items: ' + inttostr(dm.qselect1.RecordCount);
    end;
end;

end.
