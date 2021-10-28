unit inventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, ActnList, AdvPanel, Grids, AdvObj, BaseGrid,
  AdvGrid, RzButton, RzSplit, StdCtrls, RzLabel, Mask, RzEdit, RzCmboBx,
  System.Actions;

type
  Tmf_inventory_frm = class(TForm)
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    split_inventory: TRzSplitter;
    btn_query: TRzBitBtn;
    AdvPanel2: TAdvPanel;
    grd_mf_inventory: TAdvStringGrid;
    AdvPanel3: TAdvPanel;
    cmb_brand: TRzComboBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    cmb_category: TRzComboBox;
    RzLabel5: TRzLabel;
    cmb_type: TRzComboBox;
    RzLabel6: TRzLabel;
    cmb_generic: TRzComboBox;
    edt_search: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    btn_ok: TRzBitBtn;
    esc: TAction;
    splitter: TAction;
    btn_add: TRzBitBtn;
    btn_edit: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    search: TAction;
    refresh: TAction;
    new: TAction;
    delete: TAction;
    print: TAction;
    RzLabel12: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    btn_close: TRzBitBtn;
    lbl_barcode: TRzLabel;
    lbl_price: TRzLabel;
    lbl_description: TRzLabel;
    lbl_unit: TRzLabel;
    lbl_category: TRzLabel;
    lbl_brand: TRzLabel;
    lbl_generic: TRzLabel;
    lbl_type: TRzLabel;
    cmb_trans_code: TRzComboBox;
    RzLabel10: TRzLabel;
    cmb_branch: TRzComboBox;
    procedure btn_closClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_brandClick(Sender: TObject);
    procedure cmb_categoryClick(Sender: TObject);
    procedure cmb_typeClick(Sender: TObject);
    procedure cmb_genericClick(Sender: TObject);
    procedure cmb_locationClick(Sender: TObject);
    procedure cmb_supplierClick(Sender: TObject);
    procedure cmb_unitClick(Sender: TObject);
    procedure grd_mf_inventoryClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure grd_mf_inventoryDblClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure splitterExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure edt_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure newExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure grd_mf_inventoryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_printClick(Sender: TObject);
    procedure cmb_branchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_inventory_frm: Tmf_inventory_frm;

implementation

uses datamodule, procedures, sql_statement, variables, sales_frm,
  inventory_details, authentication_frm, add_stocks, purchase_order_additems,
  frm_control_settings, main, Inventory_report;// add_stocks,


{$R *.dfm}


procedure Tmf_inventory_frm.btn_addClick(Sender: TObject);
begin
  mf_stock_id := 0;
  inventory_frm.ShowModal;
  btn_query.Click;
end;

procedure Tmf_inventory_frm.btn_closClick(Sender: TObject);
begin
    mf_stock_id := 0;
    tag_stock := 0;
    btn_ok.Visible := false;
    close;
end;

procedure Tmf_inventory_frm.btn_closeClick(Sender: TObject);
begin
    mf_stock_id := 0;
    tag_stock := 0;
    btn_ok.Visible := false;
    edt_search.Clear;
    close;
end;

procedure Tmf_inventory_frm.btn_deleteClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
    begin
        confirmed  := 13;
        confirmation_frm.ShowModal;
    end
    else
    begin
    sql := ' delete from inventory where id = ' + quotedstr(inttostr(mf_stock_id));
      if messagedlg('Are you sure you want to delete Stock?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
        procedures.exec_func;
        btn_query.Click;
        showmessage('Item Deleted!');
        confirmed := 0;
      end
      else
      grd_mf_inventory.SetFocus;
    end;

end;

procedure Tmf_inventory_frm.btn_editClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
    begin
      confirmed := 14;
      inventory_frm.btn_delete.Enabled  := true;
      confirmation_frm.ShowModal;
    end
    else
    begin
      inventory_frm.btn_delete.Enabled  := true;
      inventory_frm.ShowModal;
      btn_query.Click;
    end;
end;

procedure Tmf_inventory_frm.btn_okClick(Sender: TObject);
begin


        if tag_stock = 0 then
        begin
            btn_edit.Click;
        end;
        if tag_stock = 1 then
            add_stocks_frm.ShowModal;
        if tag_stock = 2 then
           close;
        if tag_stock = 3 then
            purchase_order_additem.ShowModal;
        if tag_stock = 4 then
        begin

        if(pos_sales_frm.edt_name.Text = '') then
        begin
                sales_stock_id := integer(grd_mf_inventory.objects[0,grd_mf_inventory.row]);
                query := ' select inventory.id' +
                 ', ifnull((inventory.barcode), "NA") as barcode' +
                 ', ifnull((inventory.description), "NA") as description' +
                 ', ifnull(checked1,0) as checked1, ' +
                 ' ifnull(checked2,0) as checked2, ' +
                 ' ifnull(checked3,0) as checked3, ' +
                 ' ifnull(checked4,0) as checked4, ' +
                 ' ifnull(checked5,0) as checked5' +
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
                 ', ifnull((unit1), "NA") as unit11' +
                 ', ifnull((unit2), "NA") as unit22' +
                 ', ifnull((unit3), "NA") as unit33' +
                 ', ifnull((unit4), "NA") as unit44' +
                 ', ifnull((unit5), "NA") as unit55' +
                 ', ifnull((inventory.category), "NA") as category1' +
                 ', ifnull((inventory.type), "NA") as type1' +
                 ', ifnull((inventory.brand), "NA") as brand1' +
                 ', ifnull((inventory.generic), "NA") as generic1' +
                 ', ifnull(sum(transaction.inventory_value*transaction.quantity), 0) as qty from inventory left join transaction on inventory.id=transaction.inventory_id';


        qwhere := ' where inventory.id =' + quotedstr(inttostr(sales_stock_id)) ;
        qgroup := ' group by inventory.id';
        //qorder := ' order by inventory.description asc';

        sql := query + qwhere + qgroup + qorder ;
        //showmessage(sql);
        procedures.select_func;

        lbl_barcode.Caption := dm.qselect1.FieldValues['barcode'];
        lbl_description.Caption := dm.qselect1.FieldValues['description'];
        lbl_brand.Caption := dm.qselect1.FieldValues['brand1'];
        lbl_category.Caption := dm.qselect1.FieldValues['category1'];
        lbl_generic.Caption := dm.qselect1.FieldValues['generic1'];
        lbl_type.caption := dm.qselect1.FieldValues['type1'];

        if pos_sales_frm.cmb_price_level.Text = '0' then
        begin
          if dm.qselect1.FieldValues['checked1'] = 1 then
          begin
            lbl_price.Caption :=dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
            lbl_unit.Caption  := DM.qselect1.fieldvalues['unit11'];
          end;

          if dm.qselect1.FieldValues['checked2'] = 1 then
          begin
            lbl_price.Caption := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
            lbl_unit.Caption  := DM.qselect1.fieldvalues['unit22'];
          end;

          if dm.qselect1.FieldValues['checked3'] = 1 then
          begin
            lbl_price.Caption := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
           lbl_unit.Caption  := DM.qselect1.fieldvalues['unit33'];
         end;

         if dm.qselect1.FieldValues['checked4'] = 1 then
          begin
            lbl_price.Caption := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
            lbl_unit.Caption  := DM.qselect1.fieldvalues['unit44'];
         end;

         if dm.qselect1.FieldValues['checked5'] = 1 then
          begin
            lbl_price.Caption  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
            lbl_unit.Caption  := DM.qselect1.fieldvalues['unit55'];
          end;

        end
        else
        begin
                        if pos_sales_frm.cmb_price_level.Text = '1' then
                        begin
                          lbl_price.Caption :=dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
                          lbl_unit.Caption  := DM.qselect1.fieldvalues['unit11'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '2' then
                        begin
                          lbl_price.Caption := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                          lbl_unit.Caption  := DM.qselect1.fieldvalues['unit22'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '3' then
                        begin
                          lbl_price.Caption := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                          lbl_unit.Caption  := DM.qselect1.fieldvalues['unit33'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '4' then
                        begin
                          lbl_price.Caption := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                          lbl_unit.Caption  := DM.qselect1.fieldvalues['unit44'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '5' then
                        begin
                          lbl_price.Caption  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                          lbl_unit.Caption  := DM.qselect1.fieldvalues['unit55'];
                        end;

        end;
        if pos_sales_frm.edt_qty.Text = '' then
                   begin
                        pos_sales_frm.edt_qty.Text  := '1';
                   end;
         query  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                   ', machine_id = ' + quotedstr(result) +
                   ', inventory_id   = ' + quotedstr(inttostr(sales_stock_id)) +
                   ', encode_id = ' + inttostr(encoder)+
                   ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
                   ', description  = '  + quotedstr(lbl_description.Caption) +
                   ', unit_id = '  + quotedstr(lbl_unit.Caption) +
                   ', brand  = '  + quotedstr(lbl_brand.Caption) +
                   ', generic  = '  + quotedstr(lbl_generic.Caption) +
                   ', type_id  = '  + quotedstr(lbl_generic.Caption) +
                   ', category =' + quotedstr(lbl_type.Caption) +
                   ', discount  = 0' +
                   ', quantity  = '+ quotedstr(pos_sales_frm.edt_qty.Text) +
                   ', price   = '  + quotedstr(lbl_price.Caption)+
                   ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
                   ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
                   ', inventory_value = '  + quotedstr(inttostr(-1)) +
                   ', transaction_value = '  + quotedstr(inttostr(1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;
        edt_search.Clear;
        close;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.edt_qty.Text := '1';
        pos_sales_frm.grd_trans.SetFocus;
        end

        else

        begin
                 sales_stock_id := integer(grd_mf_inventory.objects[0,grd_mf_inventory.row]);
                 query := ' select inventory.id' + // ifnull((inventory.barcode), "NA") as barcode' +
                 ', ifnull((inventory.barcode), "NA") as barcode' +
                 ', ifnull((inventory.description), "NA") as description' +
                 ', ifnull(checked1,0) as checked1, ' +
                 ' ifnull(checked2,0) as checked2, ' +
                 ' ifnull(checked3,0) as checked3, ' +
                 ' ifnull(checked4,0) as checked4, ' +
                 ' ifnull(checked5,0) as checked5' +
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
                 ',ifnull((unit1), "NA") as unit11' +
                 ',ifnull((unit2), "NA") as unit22' +
                 ',ifnull((unit3), "NA") as unit33' +
                 ',ifnull((unit4), "NA") as unit44' +
                 ',ifnull((unit5), "NA") as unit55' +
                 ',ifnull((inventory.category), "NA") as category1' +
                 ',ifnull((inventory.type), "NA") as type1' +
                 ',ifnull((inventory.brand), "NA") as brand1' +
                 ',ifnull((inventory.generic), "NA") as generic1' +
                 ',ifnull(sum(transaction.inventory_value*transaction.quantity), 0) as qty from inventory left join transaction on inventory.id=transaction.inventory_id';


        qwhere := ' where inventory.id =' + quotedstr(inttostr(sales_stock_id)) ;
        qgroup := ' group by inventory.id';
        //qorder := ' order by inventory.description asc';

        sql := query + qwhere + qgroup + qorder ;
        //showmessage(sql);
        procedures.select_func;

        //lbl_barcode.Caption := dm.qselect1.FieldValues['barcode'];
        //lbl_description.Caption := dm.qselect1.FieldValues['description'];
        lbl_brand.Caption := dm.qselect1.FieldValues['brand1'];
        lbl_category.Caption := dm.qselect1.FieldValues['category1'];
        lbl_generic.Caption := dm.qselect1.FieldValues['generic1'];
        lbl_type.caption := dm.qselect1.FieldValues['type1'];

        if pos_sales_frm.cmb_price_level.Text = '0' then
        begin
                  if dm.qselect1.FieldValues['checked1'] = 1 then
                  begin
                    lbl_price.Caption :=dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
                    lbl_unit.Caption  := DM.qselect1.fieldvalues['unit11'];
                  end;

                  if dm.qselect1.FieldValues['checked2'] = 1 then
                  begin
                    lbl_price.Caption := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                   lbl_unit.Caption  := DM.qselect1.fieldvalues['unit22'];
                 end;

                  if dm.qselect1.FieldValues['checked3'] = 1 then
                  begin
                    lbl_price.Caption := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                    lbl_unit.Caption  := DM.qselect1.fieldvalues['unit33'];
                 end;

                 if dm.qselect1.FieldValues['checked4'] = 1 then
                 begin
                      lbl_price.Caption := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                      lbl_unit.Caption  := DM.qselect1.fieldvalues['unit44'];
                  end;

                  if dm.qselect1.FieldValues['checked5'] = 1 then
                  begin
                    lbl_price.Caption  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                    lbl_unit.Caption  := DM.qselect1.fieldvalues['unit55'];
                  end;

        end
        else
        begin

                  if pos_sales_frm.cmb_price_level.Text = '1' then
                  begin
                          p1 := dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit11'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '2' then
                  begin
                          p1 := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit22'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '3' then
                  begin
                          p1  := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('#####0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit33'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '4' then
                  begin
                          p1 := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit44'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '5' then
                  begin
                          p1  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit55'];
                  end;
        end;

       if pos_sales_frm.edt_qty.Text = '' then
                   begin
                        pos_sales_frm.edt_qty.Text  := '1';
                   end;

        query  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                   ', machine_id = ' + quotedstr(result) +
                   ', encode_id = ' + inttostr(encoder)+
                   ', inventory_id   = ' + quotedstr(inttostr(sales_stock_id)) +
                   ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
                   ', description  = '  + quotedstr(lbl_description.Caption) +
                   ', customer_id =' + quotedstr(inttostr(sales_cus_id)) +
                   ', unit_id = '  + quotedstr(lbl_unit.Caption) +
                   ', brand  = '  + quotedstr(lbl_brand.Caption) +
                   ', generic  = '  + quotedstr(lbl_generic.Caption) +
                   ', type_id  = '  + quotedstr(lbl_generic.Caption) +
                   ', category =' + quotedstr(lbl_type.Caption) +
                   ', discount  = 0' +
                   ', quantity  = '+ quotedstr(pos_sales_frm.edt_qty.Text) +
                   ', price   = '  + quotedstr(lbl_price.Caption)+
                   ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
                   ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
                   ', inventory_value = '  + quotedstr(inttostr(-1)) +
                   ', transaction_value = '  + quotedstr(inttostr(1));

        //qwhere := 'where transaction_id =' + quotedstr(inttostr(sales_trans_id));

        sql    :=  query;// + qwhere ;
        //showmessage(sql);
        procedures.exec_func;
        edt_search.Clear;
        close;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.edt_qty.Text := '1';
        pos_sales_frm.grd_trans.SetFocus;
        end;

        end;

end;

procedure Tmf_inventory_frm.btn_printClick(Sender: TObject);
begin
  frm_inv_report.qr_inv_report.Preview;
end;

procedure Tmf_inventory_frm.btn_queryClick(Sender: TObject);
begin
  procedures.grd_setup(grd_mf_inventory);

  query := ' select inventory.id, ifnull((inventory.barcode), 0) as barcode' +
                 ', ifnull((inventory.description), "NA") as description' +
                 ', checked1, checked2, checked3, checked4, checked5' +
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
                 ',ifnull((select description from attributes where attributes.id = inventory.unit1), "NA") as unit11' +
                 ',ifnull((select description from attributes where attributes.id = inventory.unit2), "NA") as unit22' +
                 ',ifnull((select description from attributes where attributes.id = inventory.unit3), "NA") as unit33' +
                 ',ifnull((select description from attributes where attributes.id = inventory.unit4), "NA") as unit44' +
                 ',ifnull((select description from attributes where attributes.id = inventory.unit5), "NA") as unit55' +
                 ',ifnull((select description from attributes where attributes.id = inventory.category), "NA") as category1' +
                 ',ifnull((select description from attributes where attributes.id = inventory.type), "NA") as type1' +
                 ',ifnull((select description from attributes where attributes.id = inventory.brand), "NA") as brand1' +
                 ',ifnull((select description from attributes where attributes.id = inventory.generic), "NA") as generic1' +
                 ', ifnull((select description from warehouse where warehouse.id = transaction.branch_id),"NA") as branch ' +
                 ',ifnull(sum(transaction.inventory_value*transaction.quantity), 0) as qty from inventory left join transaction on inventory.id=transaction.inventory_id';

                 qwhere := ' where 1=1';
                 qgroup := ' group by inventory.id';
                 qorder := ' order by inventory.description asc';

        if edt_search.text <> '' then
        begin
            qwhere := qwhere + ' and concat(inventory.description , inventory.barcode) like ' + quotedstr('%' + trim(edt_search.Text) + '%');
        end;

        if cmb_brand.ItemIndex <> 0 then
        begin
            qwhere := qwhere + ' and inventory.brand = ' + quotedstr(inttostr(longint(cmb_brand.Items.Objects[cmb_brand.ItemIndex])));
        end;

        if cmb_category.ItemIndex <> 0 then
        begin
            qwhere := qwhere + ' and inventory.category = ' + quotedstr(inttostr(longint(cmb_category.Items.Objects[cmb_category.ItemIndex])));
        end;

        if cmb_type.ItemIndex <> 0 then
        begin
            qwhere := qwhere + ' and inventory.type = ' + quotedstr(inttostr(longint(cmb_type.Items.Objects[cmb_type.ItemIndex])));
        end;

        if cmb_generic.ItemIndex <> 0 then
        begin
            qwhere := qwhere + ' and inventory.generic = ' + quotedstr(inttostr(longint(cmb_generic.Items.Objects[cmb_generic.ItemIndex])));
        end;

        if cmb_branch.ItemIndex > 0 then
        begin
        qwhere  := qwhere + ' and (select description from warehouse where warehouse.id = transaction.branch_id) = ' +quotedstr(cmb_branch.Text);
        end;

        sql := query + qwhere + qgroup + qorder;
        procedures.select_func;

        grd_mf_inventory.clearnormalcells;
        grd_mf_inventory.rowcount := 2;
        grd_mf_inventory.floatingfooter.visible := false;

        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        id :=DM.qselect1.FieldValues['id'];

                        grd_mf_inventory.objects[0,grd_mf_inventory.rowcount-1] := pointer(id);

                        grd_mf_inventory.cells[1,grd_mf_inventory.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['barcode']);
                        grd_mf_inventory.cells[2,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['description'];

                if pos_sales_frm.cmb_price_level.Text = '0' then
                begin
                        if dm.qselect1.FieldValues['checked1'] = 1 then
                        begin
                          p1 := dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit11'];
                        end;

                         if dm.qselect1.FieldValues['checked2'] = 1 then
                        begin
                          p1 := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit22'];
                        end;

                         if dm.qselect1.FieldValues['checked3'] = 1 then
                        begin
                          p1  := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('#####0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit33'];
                        end;

                         if dm.qselect1.FieldValues['checked4'] = 1 then
                        begin
                          p1 := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit44'];
                        end;

                         if dm.qselect1.FieldValues['checked5'] = 1 then
                        begin
                          p1  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit55'];
                        end;

               end
               else
               begin

                         if pos_sales_frm.cmb_price_level.Text = '1' then
                        begin
                          p1 := dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100)) - (( dm.qselect1.FieldValues['price1']  + (dm.qselect1.FieldValues['price1']* (dm.qselect1.FieldValues['vat1']/100))) * (dm.qselect1.FieldValues['discount1']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit11'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '2' then
                        begin
                          p1 := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit22'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '3' then
                        begin
                          p1  := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('#####0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit33'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '4' then
                        begin
                          p1 := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit44'];
                        end;

                         if pos_sales_frm.cmb_price_level.Text = '5' then
                        begin
                          p1  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                          grd_mf_inventory.cells[3,grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          grd_mf_inventory.cells[4,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit55'];
                        end;
                end;
                       
                                                                     
                        grd_mf_inventory.cells[5,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['qty'];

                        if dm.qselect1.FieldValues['qty'] <= 100 then
                        begin
                          grd_mf_inventory.RowColor[grd_mf_inventory.rowcount-1] := clyellow;

                            if dm.qselect1.FieldValues['qty'] <= 50 then
                            begin
                              grd_mf_inventory.RowColor[grd_mf_inventory.rowcount-1] := clred;
                            end;
                        end;

                        grd_mf_inventory.cells[6,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['generic1'];
                        grd_mf_inventory.cells[7,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['type1'];
                        grd_mf_inventory.cells[8,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['brand1'];
                        grd_mf_inventory.cells[9,grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['category1'];

                        grd_mf_inventory.CellProperties[3,grd_mf_inventory.rowcount-1].Alignment := taRightJustify;
                        grd_mf_inventory.CellProperties[5,grd_mf_inventory.rowcount-1].Alignment := taRightJustify;

                        grd_mf_inventory.addrow;
                        DM.qselect1.Next;
                end;
        end;
        grd_mf_inventory.floatingfooter.visible := true;
        grd_mf_inventory.cells[2,grd_mf_inventory.rowcount-1]  := 'Total No. of Stocks:   ' + inttostr(dm.qselect1.RecordCount);

end;

procedure Tmf_inventory_frm.cmb_branchChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_brandClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_categoryClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_genericClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_locationClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_supplierClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_typeClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.cmb_unitClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.deleteExecute(Sender: TObject);
begin
  btn_delete.Click;
end;

procedure Tmf_inventory_frm.edt_searchChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.edt_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_return then
    begin
          grd_mf_inventory.SetFocus;
    end;
end;

procedure Tmf_inventory_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tmf_inventory_frm.FormActivate(Sender: TObject);
begin

  cmb_pop(cmb_brand,'id, description','doh','attributes','type="brand"');
  cmb_pop(cmb_category,'id, description','doh','attributes','type="category"');
  cmb_pop(cmb_type,'id, description','doh','attributes','type="type"');
  cmb_pop(cmb_generic,'id, description','doh','attributes','type="generic"');
  cmb_pop(cmb_trans_code,'id ,description','doh','transaction_code','1=1');
  cmb_pop(cmb_branch,'id,description','doh','warehouse','1=1');
  //////////////////////////////////////////////////////////////////////////////
  edt_search.SetFocus;
  btn_query.Click;
  cmb_trans_code.ItemIndex := 1;
  if tag_stock = 1 then
    btn_ok.Visible := true;
  if tag_stock = 2 then
    btn_ok.Visible := true;


end;

procedure Tmf_inventory_frm.grd_mf_inventoryClick(Sender: TObject);
begin
    mf_stock_id := integer(grd_mf_inventory.objects[0,grd_mf_inventory.row]);
end;

procedure Tmf_inventory_frm.grd_mf_inventoryDblClick(Sender: TObject);
begin
    mf_stock_id := integer(grd_mf_inventory.objects[0,grd_mf_inventory.row]);
    btn_ok.Click;
end;

procedure Tmf_inventory_frm.grd_mf_inventoryKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
      begin
        mf_stock_id := integer(grd_mf_inventory.objects[0,grd_mf_inventory.row]);
        btn_ok.Click;
      end;
end;

procedure Tmf_inventory_frm.newExecute(Sender: TObject);
begin
    btn_add.Click;
end;

procedure Tmf_inventory_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tmf_inventory_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_inventory_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

procedure Tmf_inventory_frm.splitterExecute(Sender: TObject);
begin
  if split_inventory.HotSpotClosed = true then
  begin
    split_inventory.RestoreHotSpot;
  end else
  begin
    split_inventory.CloseHotSpot;
  end;
end;

end.
