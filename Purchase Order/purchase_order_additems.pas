unit purchase_order_additems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ActnList, AdvPanel, ExtCtrls, RzPanel, RzButton,
  Mask, RzEdit, RzCmboBx, RzLine, System.Actions;

type
  Tpurchase_order_additem = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzLabel1: TRzLabel;
    nedt_quantity_box: TRzNumericEdit;
    RzLabel2: TRzLabel;
    lbl_po_id: TRzLabel;
    RzLabel4: TRzLabel;
    lbl_barcode: TRzLabel;
    btn_query: TRzBitBtn;
    btn_ok: TRzBitBtn;
    btn_close: TRzBitBtn;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel16: TRzLabel;
    nedt_cost: TRzNumericEdit;
    nedt_total_discount: TRzNumericEdit;
    nedt_total: TRzNumericEdit;
    nedt_discount: TRzNumericEdit;
    RzLabel7: TRzLabel;
    lbl_description: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    cmb_unit_id: TRzComboBox;
    esc: TAction;
    RzLabel11: TRzLabel;
    RzLine1: TRzLine;
    edt_pieces: TRzEdit;
    RzLabel13: TRzLabel;
    edt_quantity: TRzEdit;
    btn_calculate: TRzBitBtn;
    lbl_type: TRzLabel;
    RzLabel14: TRzLabel;
    nedt_netcost: TRzNumericEdit;
    RzLabel15: TRzLabel;
    RzLabel17: TRzLabel;
    procedure nedt_quantity_boxChange(Sender: TObject);
    procedure edt_discountChange(Sender: TObject);
    procedure edt_total_discountChange(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure edt_piecesChange(Sender: TObject);
    procedure btn_calculateClick(Sender: TObject);
    procedure nedt_discountChange(Sender: TObject);
    procedure nedt_total_discountChange(Sender: TObject);
    procedure cmb_unit_idClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  purchase_order_additem: Tpurchase_order_additem;

implementation

uses datamodule, variables, procedures;

{$R *.dfm}

procedure Tpurchase_order_additem.btn_calculateClick(Sender: TObject);
begin
    if cmb_unit_id.ItemIndex = cmb_unit_id.Items.IndexOf('Box') then
    begin
        edt_pieces.Enabled := true;
    end else
    begin
        edt_pieces.Text := inttostr(1);
        edt_pieces.Enabled := false;
    end;

    edt_quantity.Text := inttostr(strtoint(nedt_quantity_box.Text) * strtoint(edt_pieces.Text));
    nedt_netcost.Text := floattostr(strtofloat(edt_quantity.Text) * strtofloat(nedt_cost.Text));

    if nedt_discount.Text <> '0' then
    begin
        nedt_total_discount.Text := floattostr((strtofloat(nedt_discount.Text) / 100) * (strtofloat(edt_quantity.Text) * strtofloat(nedt_cost.Text)));
        nedt_total_discount.Enabled := false;
    end else
        nedt_total_discount.Enabled := true;

    nedt_total.Text := inttostr((strtoint(edt_quantity.Text) * strtoint(nedt_cost.Text)) - strtoint(nedt_total_discount.Text));
end;

procedure Tpurchase_order_additem.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tpurchase_order_additem.btn_okClick(Sender: TObject);
begin
   if rr_edit_qty <> 1 then   // if purchase add item
         begin
               if cmb_unit_id.ItemIndex <> 0 then
               begin
                qwhere := '';
                if purchase_id = 0 then
                begin
                    query := ' insert into ';
                end else
                begin
                    query := ' update';
                    qwhere := ' where id =' + inttostr(order_details_id);
                end;

                query := query + ' purchase_order set po_id=' + inttostr(new_id) + ', inventory_id = ' + inttostr(temp_po_id) +
                         ', quantity = ' + edt_quantity.Text + ', type_id = ' + inttostr(temp_type) + ', inventory_cost= ' + nedt_cost.Text + ', unit_id = ' + inttostr(longint(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex])) +
                         ', discount = ' + nedt_total_discount.Text + ', cost = ' + nedt_total.Text;
                if True then

                sql := query + qwhere;
                procedures.exec_func;
                if purchase_id = 0 then
                    showmessage('Item Added')
                else
                    showmessage('Item Updated');
                btn_close.Click;
         end else
               begin
               showmessage('Choose Unit');
               cmb_unit_id.SetFocus;
               end;
         end
   else if rr_edit_qty = 1 then
        begin
            query := ' update transaction set quantity = ' + edt_quantity.Text;
            qwhere  := ' where id = ' + inttostr(order_details_id);
            sql := query + qwhere;
            procedures.exec_func;
           // showmessage(sql);
           btn_close.Click;
        end;

end;

procedure Tpurchase_order_additem.btn_queryClick(Sender: TObject);
begin
   if rr_edit_qty <> 1 then   // if purchase add item
   begin
    if order_details_id <> 0 then
    begin
        query := 'select id, (select barcode from inventory where id=purchase_order.inventory_id) as barcode, (select description from inventory where id=purchase_order.inventory_id) as description' +
                 ', (select description from attributes where id=purchase_order.type_id) as type_str, type_id as type, unit_id, cost, inventory_cost, discount' +
                 ', quantity from purchase_order';
        qwhere := ' where id=' + inttostr(order_details_id);
    end else
    begin
        query := 'select checked1, checked2, checked3, checked4, checked5 from inventory';
        qwhere :=' where id=' + inttostr(mf_stock_id);

        sql := query + qwhere;
        procedures.select_func;

        if dm.qselect1.FieldValues['checked1'] = '1' then
            check_temp := 1;
        if dm.qselect1.FieldValues['checked2'] = '1' then
            check_temp := 2;
        if dm.qselect1.FieldValues['checked3'] = '1' then
            check_temp := 3;
        if dm.qselect1.FieldValues['checked4'] = '1' then
            check_temp := 4;
        if dm.qselect1.FieldValues['checked5'] = '1' then
            check_temp := 5;

        query := 'select ifnull(id,0) as id, ifnull(barcode,"") as barcode, ifnull(description,"") as description, ifnull(cost' + inttostr(check_temp) + ',0) as cost' +  inttostr(check_temp) +
                 ', ifnull((select description from attributes where id=inventory.type)," ") as type_str, ifnull(type,0) as type from inventory';
        qwhere := ' where id=' + inttostr(mf_stock_id);
    end;

    sql := query + qwhere;
    procedures.select_func;

    temp_po_id := dm.qselect1.FieldValues['id'];
    temp_type := dm.qselect1.FieldValues['type'];
    lbl_description.Caption := dm.qselect1.FieldValues['description'];
    if order_details_id <> 0 then
    begin
        nedt_cost.Text := dm.qselect1.FieldValues['inventory_cost'];
     end else
        nedt_cost.Text := dm.qselect1.FieldValues['cost'+inttostr(check_temp)];
    lbl_po_id.Caption := formatfloat('000000000',new_id);
    lbl_barcode.Caption := formatfloat('000000000',dm.qselect1.FieldValues['barcode']);
    lbl_type.Caption := dm.qselect1.FieldValues['type_str'];

    btn_calculate.Click;
   end
   else if rr_edit_qty = 1 then      // if receiving edit item qty
        begin
        query := 'select ifnull(barcode,0) as barcode, ifnull(reference_id,0) as reference_id,ifnull(description,"") as description , ' +
                 'ifnull((select description from attributes where id=transaction.type_id)," ") as type_str from transaction' ;
        qwhere  := ' where id = ' +quotedstr(inttostr(order_details_id));
        sql := query + qwhere;
        procedures.select_func;
        //showmessage(sql);

        lbl_description.Caption := dm.qselect1.FieldValues['description'];
        lbl_barcode.Caption := formatfloat('000000000',dm.qselect1.FieldValues['barcode']);
        lbl_po_id.Caption := formatfloat('000000000',order_details_id);
        lbl_type.Caption := dm.qselect1.FieldValues['type_str'];
        end;

end;

procedure Tpurchase_order_additem.cmb_unit_idClick(Sender: TObject);
begin
    btn_calculate.Click;
end;

procedure Tpurchase_order_additem.edt_discountChange(Sender: TObject);
begin
    btn_query.Click
end;

procedure Tpurchase_order_additem.edt_piecesChange(Sender: TObject);
begin
    if edt_pieces.Text = '' then
    begin
        edt_pieces.Text := inttostr(1);
        edt_pieces.SetFocus;
    end;
    btn_calculate.Click;
end;

procedure Tpurchase_order_additem.edt_total_discountChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tpurchase_order_additem.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tpurchase_order_additem.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_unit_id,'id, description','doh','attributes','type="unit"');
    cmb_unit_id.ItemIndex  := cmb_unit_id.Items.IndexOf('Box');
    nedt_quantity_box.Text := inttostr(0);
    edt_pieces.Text := inttostr(1);
    nedt_discount.Text := inttostr(0);
    nedt_total_discount.Text := inttostr(0);
    nedt_quantity_box.SetFocus;
    btn_query.Click;
end;

procedure Tpurchase_order_additem.nedt_discountChange(Sender: TObject);
begin
    if nedt_discount.Text = '' then
    begin
        nedt_discount.Text := inttostr(0);
        nedt_discount.SetFocus;
    end;
    btn_calculate.Click;
end;

procedure Tpurchase_order_additem.nedt_quantity_boxChange(Sender: TObject);
begin
    if nedt_quantity_box.Text = '' then
    begin
        nedt_quantity_box.Text := inttostr(0);
        nedt_quantity_box.SetFocus;
    end;
    btn_calculate.Click;
end;

procedure Tpurchase_order_additem.nedt_total_discountChange(Sender: TObject);
begin
    if nedt_total_discount.Text = '' then
    begin
        nedt_total_discount.Text := inttostr(0);
        nedt_total_discount.SetFocus;
    end;
    btn_calculate.Click;
end;

end.
