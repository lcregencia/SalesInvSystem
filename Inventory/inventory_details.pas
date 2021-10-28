unit inventory_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, RzRadChk, RzEdit, RzButton, StdCtrls, RzCmboBx,
  Mask, RzLabel, ExtCtrls, RzPanel, RzRadGrp, System.Actions;

type
  Tinventory_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    lbl_id: TRzLabel;
    edt_barcode: TRzEdit;
    edt_description: TRzEdit;
    cmb_category: TRzComboBox;
    cmb_brand: TRzComboBox;
    nedt_cost1: TRzNumericEdit;
    nedt_cost2: TRzNumericEdit;
    nedt_cost3: TRzNumericEdit;
    nedt_cost4: TRzNumericEdit;
    nedt_cost5: TRzNumericEdit;
    nedt_price1: TRzNumericEdit;
    nedt_price2: TRzNumericEdit;
    nedt_price3: TRzNumericEdit;
    nedt_price4: TRzNumericEdit;
    nedt_price5: TRzNumericEdit;
    nedt_discount1: TRzNumericEdit;
    nedt_discount2: TRzNumericEdit;
    nedt_discount3: TRzNumericEdit;
    nedt_discount4: TRzNumericEdit;
    nedt_discount5: TRzNumericEdit;
    nedt_vat1: TRzNumericEdit;
    nedt_vat2: TRzNumericEdit;
    nedt_vat3: TRzNumericEdit;
    nedt_vat4: TRzNumericEdit;
    nedt_vat5: TRzNumericEdit;
    cb_with_vat: TRzCheckBox;
    btn_query: TRzBitBtn;
    btn_new: TRzBitBtn;
    btn_save: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_close: TRzBitBtn;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    RzLabel29: TRzLabel;
    cmb_generic: TRzComboBox;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    RzLabel42: TRzLabel;
    cmb_unit1: TRzComboBox;
    cmb_unit2: TRzComboBox;
    cmb_unit3: TRzComboBox;
    cmb_unit4: TRzComboBox;
    cmb_unit5: TRzComboBox;
    btn_category_att: TRzBitBtn;
    btn_brand_att: TRzBitBtn;
    btn_generic_att: TRzBitBtn;
    RzLabel30: TRzLabel;
    cmb_type: TRzComboBox;
    btn_type_att: TRzBitBtn;
    new: TAction;
    delete: TAction;
    refresh: TAction;
    print: TAction;
    RzLabel28: TRzLabel;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzLabel45: TRzLabel;
    RzLabel47: TRzLabel;
    rb_checked1: TRzRadioButton;
    rb_checked2: TRzRadioButton;
    rb_checked3: TRzRadioButton;
    rb_checked4: TRzRadioButton;
    rb_checked5: TRzRadioButton;
    btn_refresh_bar: TRzBitBtn;
    btn_check: TRzBitBtn;
    btn_wrong: TRzBitBtn;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_category_attClick(Sender: TObject);
    procedure btn_brand_attClick(Sender: TObject);
    procedure btn_generic_attClick(Sender: TObject);
    procedure btn_type_attClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure btn_refresh_barClick(Sender: TObject);
    procedure edt_barcodeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_descriptionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  inventory_frm: Tinventory_frm;

implementation

uses procedures, variables, sql_statement, datamodule, authentication_frm,
  frm_addattribute, frm_control_settings, inventory,
  Inventory_information_report;

{$R *.dfm}

procedure Tinventory_frm.btn_brand_attClick(Sender: TObject);
begin
    type_temp := 'brand';
    frm_addatt.ShowModal;
    cmb_pop(cmb_brand,'id, description','doh','attributes','type="brand"');
end;

procedure Tinventory_frm.btn_category_attClick(Sender: TObject);
begin
    type_temp := 'category';
    frm_addatt.ShowModal;
    cmb_pop(cmb_category,'id, description','doh','attributes','type="category"');
end;

procedure Tinventory_frm.btn_closeClick(Sender: TObject);
begin
  if (edt_description.Text = '')  or (edt_barcode.Text = '') then
  begin
    mf_mem_id := 0;
    btn_delete.Enabled  := false;
    btn_wrong.Visible := false;
    btn_check.Visible := false;
    close;
  end
  else
  begin
    if messagedlg('Do you want to quit?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
        mf_mem_id := 0;
        btn_delete.Enabled  := false;
        btn_wrong.Visible := false;
        btn_check.Visible := false;
        close;
        end
        else
        edt_barcode.SetFocus;
  end;

end;

procedure Tinventory_frm.btn_deleteClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
      begin
          confirmed  := 20;
          confirmation_frm.ShowModal;
      end
      else
      begin
         if messagedlg('Do You Want To Delete Item?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
         begin
            if mf_stock_id <> 0 then
            begin
                    query := 'delete from inventory';
                    qwhere := ' where id = ' + quotedstr(inttostr(mf_stock_id));
                    sql := query + qwhere;

                    procedures.exec_func;
                    showmessage('Item Deleted');
                    close;
                    mf_inventory_frm.btn_query.Click;
            end else
            showmessage('No Item Found');
         end
         else
         edt_barcode.SetFocus;

      end;
   // confirmed := 0;
end;

procedure Tinventory_frm.btn_generic_attClick(Sender: TObject);
begin
    type_temp := 'generic';
    frm_addatt.ShowModal;
    cmb_pop(cmb_generic,'id, description','doh','attributes','type="generic"');
end;

procedure Tinventory_frm.btn_newClick(Sender: TObject);
begin
    mf_stock_id := 0;
    btn_query.Click;
end;

procedure Tinventory_frm.btn_printClick(Sender: TObject);
begin
      frm_inv_info_report.qr_inv_info_report.Preview;
end;

procedure Tinventory_frm.btn_queryClick(Sender: TObject);
begin
   //   showmessage(inttostr(mf_stock_id));
    query := ' select ifnull(id,0) as id ' +
                ', ifnull((inventory.barcode), "NA") as barcode' +
                 ', ifnull((inventory.description), "NA") as description' +
                 ', ifnull(checked1,0) as checked1, ' +
                 ' ifnull(checked2,0) as checked2, ' +
                 ' ifnull(checked3,0) as checked3, ' +
                 ' ifnull(checked4,0) as checked4, ' +
                 ' ifnull(checked5,0) as checked5' +
                 ', ifnull((price1),0) as cost1' +
                 ', ifnull((price2),0) as cost2' +
                 ', ifnull((price3),0) as cost3' +
                 ', ifnull((price4),0) as cost4' +
                 ', ifnull((price5),0) as cost5' +
                 ', ifnull((price1),0) as price1' +
                 ', ifnull((price2),0) as price2' +
                 ', ifnull((price3),0) as price3' +
                 ', ifnull((price4),0) as price4' +
                 ', ifnull((price5),0) as price5' +
                 ', ifnull((vat1), 0) as vat1' +
                 ', ifnull((vat2), 0) as vat2' +
                 ', ifnull((vat3), 0) as vat3' +
                 ', ifnull((vat4), 0) as vat4' +
                 ', ifnull((vat5), 0) as vat5' +
                 ', ifnull((discount1), 0) as discount1' +
                 ', ifnull((discount2), 0) as discount2' +
                 ', ifnull((discount3), 0) as discount3' +
                 ', ifnull((discount4), 0) as discount4' +
                 ', ifnull((discount5), 0) as discount5' +
                 ',ifnull((unit1), "NA") as unit1' +
                 ',ifnull((unit2), "NA") as unit2' +
                 ',ifnull((unit3), "NA") as unit3' +
                 ',ifnull((unit4), "NA") as unit4' +
                 ',ifnull((unit5), "NA") as unit5' +
                 ',ifnull((inventory.category), "NA") as category' +
                 ',ifnull((inventory.type), "NA") as type' +
                 ',ifnull((inventory.brand), "NA") as brand' +
                 ',ifnull((inventory.generic), "NA") as generic' +
                 ',ifnull(with_vat,0) as with_vate ' +
                 ', ifnull(machine_id,0) as machine_id ' +
                 ', ifnull(encode_id,0) as encode_id ' +
                 ', ifnull(update_id,0) as update_id ' +
                 ', ifnull(encode_date,0) as encode_date ' +
                 ', ifnull(update_date,0) as update_date '+
                ' from inventory';

    qwhere := ' where id =' +quotedstr(inttostr(mf_stock_id));

    sql := query + qwhere;

    procedures.select_func;
    procedures.populate(inventory_frm, sql, 'doh', 'inventory');
    if mf_stock_id = 0 then
    begin
      generate_id('doh','inventory');
      if dm.qselect1.RecordCount = 0 then
      begin
        new_id := 1;
      end else
      begin
        new_id := dm.qselect1.FieldValues['max_id']+1;
      end;
      lbl_id.Caption := formatfloat('000000000',new_id);
    end
    else
    btn_delete.Enabled  := true;
   edt_barcode.SetFocus;
end;

procedure Tinventory_frm.btn_refresh_barClick(Sender: TObject);
begin

  sql := ' select barcode from inventory';
  procedures.select_func;

  if DM.qselect1.RecordCount <> 0 then
        begin
         while DM.qselect1.Eof <> true do
           begin
            if edt_barcode.Text = dm.qselect1.FieldValues['barcode'] then
             begin
             showmessage('Barcode already in use');
             edt_barcode.SetFocus;
             check  := 1;
             break;          //edt_description.SetFocus;
             end
             else
             begin
             edt_description.SetFocus;
             check  := 0;
             end;
            DM.qselect1.Next;
//
           end;
        end;

        if check = 0 then
        begin
          btn_check.Visible := true;
          btn_wrong.Visible := false;
        end
        else
        begin
        btn_check.Visible := false;
        btn_wrong.Visible := true;
        end;


end;

procedure Tinventory_frm.btn_saveClick(Sender: TObject);
begin
    if edt_description.Text = '' then
        showmessage('Description Field Missing')
    else if cmb_category.ItemIndex = 0 then
        showmessage('Select Category')
    else if cmb_brand.ItemIndex = 0 then
        showmessage('Select Brand')
    else if cmb_generic.ItemIndex = 0 then
         showmessage('Select Generic')
    else if cmb_type.ItemIndex = 0 then
        showmessage('Select Type')
    else
    begin
        if mf_stock_id = 0 then
        begin
            if check = 0 then
            begin
            procedures.save(inventory_frm, 'insert into' , 'doh' , 'inventory' , '');
            showmessage('Item Added!');
            btn_delete.Enabled  := false;
            close;
            end
            else
            if check = 1 then
            begin
            showmessage('Barcode already in use');
            edt_barcode.SetFocus;
            end;
        end else
        begin
            procedures.save(inventory_frm, 'update' , 'doh' , 'inventory', ' where id = ' + quotedstr(inttostr(mf_stock_id)));
            showmessage('Item Updated!');
            btn_delete.Enabled  := false;
            close;
        end;
        //showmessage(sql);
    end;
end;

procedure Tinventory_frm.btn_type_attClick(Sender: TObject);
begin
    type_temp := 'type';
    frm_addatt.ShowModal;
    cmb_pop(cmb_type,'id, description','doh','attributes','type="type"');
end;

procedure Tinventory_frm.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tinventory_frm.edt_barcodeKeyPress(Sender: TObject; var Key: Char);
begin
  // #8 is Backspace
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Invalid key');
    // Discard the key
    Key := #0;
  end;
end;

procedure Tinventory_frm.edt_descriptionKeyPress(Sender: TObject;
  var Key: Char);
begin

 { sql := ' select barcode from inventory';
  procedures.select_func;

  if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                    if edt_barcode.Text = dm.qselect1.FieldValues['barcode'] then
                      begin
                      btn_check.Visible := false;
                      showmessage('as');
                      btn_wrong.Visible := true;
                      break;
                      end
                    else
                      begin
                      btn_check.Visible := true;
                      btn_wrong.Visible := false;
                      break;
                      end;
                DM.qselect1.Next;
                end;
        end;  }

end;

procedure Tinventory_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tinventory_frm.FormActivate(Sender: TObject);
begin

    cmb_pop(cmb_category,'id, description','doh','attributes','type="category"');
    cmb_pop(cmb_brand,'id, description','doh','attributes','type="brand"');
    cmb_pop(cmb_generic,'id, description','doh','attributes','type="generic"');
    cmb_pop(cmb_type,'id, description','doh','attributes','type="type"');
    cmb_pop(cmb_unit1,'id, description','doh','attributes','type="unit"');
    cmb_pop(cmb_unit2,'id, description','doh','attributes','type="unit"');
    cmb_pop(cmb_unit3,'id, description','doh','attributes','type="unit"');
    cmb_pop(cmb_unit4,'id, description','doh','attributes','type="unit"');
    cmb_pop(cmb_unit5,'id, description','doh','attributes','type="unit"');
    /////////////////////////////////////////////////////////////////////////////
    btn_query.Click;
    rb_checked1.Checked := true;
end;

procedure Tinventory_frm.newExecute(Sender: TObject);
begin
    btn_new.Click;
end;

procedure Tinventory_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tinventory_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
