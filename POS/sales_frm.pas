unit sales_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, Mask, RzEdit, RzButton,
  RzCmboBx, RzSplit, AdvPanel, RzLabel, ExtCtrls, RzPanel, ActnList,
  System.Actions;

type
  Tpos_sales_frm = class(TForm)
    AdvPanelStyler1: TAdvPanelStyler;
    RzPanel3: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzBitBtn3: TRzBitBtn;
    edt_qty: TRzEdit;
    RzBitBtn4: TRzBitBtn;
    lbl_price: TRzLabel;
    RzLabel1: TRzLabel;
    btn_barcode: TRzButton;
    btn_quantity: TRzButton;
    btn_price_level: TRzButton;
    btn_change_quantity: TRzButton;
    btn_sales_return: TRzButton;
    btn_price_update: TRzButton;
    btn_discount: TRzButton;
    btn_focus: TRzButton;
    btn_print: TRzButton;
    btn_tender: TRzButton;
    btn_wholesale: TRzButton;
    btn_item_query: TRzButton;
    RzLabel2: TRzLabel;
    ActionList1: TActionList;
    barcode: TAction;
    btn_trans_no_query: TRzButton;
    btn_new_trans: TRzButton;
    btn_trans_id: TRzButton;
    btn_cancel: TRzButton;
    btn_del_item: TRzButton;
    quantity: TAction;
    del: TAction;
    split_trans: TRzSplitter;
    grd_trans: TAdvStringGrid;
    AdvPanel2: TAdvPanel;
    edt_name: TRzEdit;
    edt_address: TRzEdit;
    edt_contact_no: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    btn_cus_query: TButton;
    canceltrans: TAction;
    closefrm: TAction;
    btn_close: TRzBitBtn;
    findcus: TAction;
    cmb_price_level: TRzComboBox;
    RzLabel6: TRzLabel;
    ChangeItem: TAction;
    salesreturn: TAction;
    pricelevel: TAction;
    priceupdate: TAction;
    discount: TAction;
    btn_add_item: TRzBitBtn;
    lbl_unit: TRzLabel;
    RzLabel7: TRzLabel;
    lbl_description: TRzLabel;
    lbl_category: TRzLabel;
    lbl_brand: TRzLabel;
    lbl_generic: TRzLabel;
    lbl_type: TRzLabel;
    cmb_trans_code: TRzComboBox;
    edt_description: TRzEdit;
    lbl_id: TRzLabel;
    lbl_barcode: TRzLabel;
    Enterbarcode: TAction;
    pay: TAction;
    focusbarcode: TAction;
    edt_barcode: TRzEdit;
    procedure btn_barcodeClick(Sender: TObject);
    procedure btn_item_queryClick(Sender: TObject);
    procedure barcodeExecute(Sender: TObject);
    procedure btn_trans_no_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_new_transClick(Sender: TObject);
    procedure btn_tenderClick(Sender: TObject);
    procedure btn_focusClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_quantityClick(Sender: TObject);
    procedure btn_del_itemClick(Sender: TObject);
    procedure quantityExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure grd_transClick(Sender: TObject);
    procedure btn_wholesaleClick(Sender: TObject);
    procedure btn_cus_queryClick(Sender: TObject);
    procedure canceltransExecute(Sender: TObject);
    procedure closefrmExecute(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure findcusExecute(Sender: TObject);
    procedure btn_discountClick(Sender: TObject);
    procedure btn_change_quantityClick(Sender: TObject);
    procedure btn_price_updateClick(Sender: TObject);
    procedure btn_sales_returnClick(Sender: TObject);
    procedure btn_price_levelClick(Sender: TObject);
    procedure cmb_price_levelChange(Sender: TObject);
    procedure ChangeItemExecute(Sender: TObject);
    procedure salesreturnExecute(Sender: TObject);
    procedure pricelevelExecute(Sender: TObject);
    procedure priceupdateExecute(Sender: TObject);
    procedure discountExecute(Sender: TObject);
    procedure btn_add_itemClick(Sender: TObject);
    procedure cmb_barcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_clearClick(Sender: TObject);
    procedure payExecute(Sender: TObject);
    procedure focusbarcodeExecute(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure edt_barcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_barcodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnterbarcodeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pos_sales_frm: Tpos_sales_frm;

implementation

uses datamodule, procedures, sql_statement, variables, inventory,
  pos_salespayment_frm, customer_masterfile, pos_salesdiscount_frm,
  authentication_frm, pos_sales_returns_frm, frm_control_settings,
  pos_sales_input_qty_frm, pos_sales_price, sales_receipt;

{$R *.dfm}

procedure Tpos_sales_frm.barcodeExecute(Sender: TObject);
begin
    btn_barcode.Click;
end;

procedure Tpos_sales_frm.btn_add_itemClick(Sender: TObject);
begin
if(pos_sales_frm.edt_name.Text = '') then
        begin
                query := ' select ifnull(inventory.id,0) as id ' +
                 ', ifnull(inventory.barcode, 0) as barcode ' +
                 ', ifnull(inventory.description, "NA") as description ' +
                 ', ifnull(checked1,0) as checked1 ' +
                 ', ifnull(checked2,0) as checked2 ' +
                 ', ifnull(checked3,0) as checked3 ' +
                 ', ifnull(checked4,0) as checked4 ' +
                 ', ifnull(checked5,0) as checked5' +
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


        qwhere := ' where inventory.barcode =' + quotedstr(edt_barcode.Text) ;
        qgroup := ' group by inventory.id';
        //qorder := ' order by inventory.description asc';

        sql := query + qwhere + qgroup  ;
        //showmessage(sql);

        procedures.select_func;
        //lbl_barcode.Caption := dm.qselect.FieldValues['barcode'];
        lbl_id.Caption  := dm.qselect1.FieldValues['id'];
        edt_description.Text := dm.qselect1.FieldValues['description'];
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
         query  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                   ', inventory_id   = ' + quotedstr(lbl_id.Caption)+
                   ', barcode  = ' +quotedstr(edt_barcode.Text) +
                   ', description  = '  + quotedstr(edt_description.Text) +
                   ', unit_id = '  + quotedstr(lbl_unit.Caption) +
                   ', brand  = '  + quotedstr(lbl_brand.Caption) +
                   ', generic  = '  + quotedstr(lbl_generic.Caption) +
                   ', type_id  = '  + quotedstr(lbl_generic.Caption) +
                   ', category =' + quotedstr(lbl_type.Caption) +
                   ', discount  = 0' +
                   ', quantity  = '+ quotedstr(edt_qty.Text) +
                   ', price   = '  + quotedstr(lbl_price.Caption)+
                   ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
                   ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
                   ', inventory_value = '  + quotedstr(inttostr(-1)) +
                   ', transaction_value = '  + quotedstr(inttostr(1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;

        btn_item_query.Click;
        edt_qty.Text := '1';
        edt_barcode.SetFocus;
        edt_barcode.Clear;
        end

        else

        begin
        //showmessage(inttostr(sales_trans_id));
                 query := ' select inventory.id'+
                 ', ifnull(inventory.barcode, 0) as barcode ' +
                 ', ifnull(inventory.description, "NA") as description ' +
                 ', ifnull(checked1,0) as checked1 ' +
                 ', ifnull(checked2,0) as checked2 ' +
                 ', ifnull(checked3,0) as checked3 ' +
                 ', ifnull(checked4,0) as checked4 ' +
                 ', ifnull(checked5,0) as checked5' +
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


        qwhere := ' where inventory.barcode =' +quotedstr(edt_barcode.Text) ;
        qgroup := ' group by inventory.id';
        //qorder := ' order by inventory.description asc';

        sql := query + qwhere + qgroup + qorder ;
        //showmessage(sql);
        procedures.select_func;

        edt_description.Text := dm.qselect1.FieldValues['description'];
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
                          mf_inventory_frm.grd_mf_inventory.cells[3,mf_inventory_frm.grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          mf_inventory_frm.grd_mf_inventory.cells[4,mf_inventory_frm.grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit11'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '2' then
                  begin
                          p1 := dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100)) - (( dm.qselect1.FieldValues['price2']  + (dm.qselect1.FieldValues['price2']* (dm.qselect1.FieldValues['vat2']/100))) * (dm.qselect1.FieldValues['discount2']/100));
                          mf_inventory_frm.grd_mf_inventory.cells[3,mf_inventory_frm.grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          mf_inventory_frm.grd_mf_inventory.cells[4,mf_inventory_frm.grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit22'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '3' then
                  begin
                          p1  := dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100)) - (( dm.qselect1.FieldValues['price3']  + (dm.qselect1.FieldValues['price3']* (dm.qselect1.FieldValues['vat3']/100))) * (dm.qselect1.FieldValues['discount3']/100));
                          mf_inventory_frm.grd_mf_inventory.cells[3,mf_inventory_frm.grd_mf_inventory.rowcount-1] := formatfloat('#####0.00',p1);
                          mf_inventory_frm.grd_mf_inventory.cells[4,mf_inventory_frm.grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit33'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '4' then
                  begin
                          p1 := dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100)) - (( dm.qselect1.FieldValues['price4']  + (dm.qselect1.FieldValues['price4']* (dm.qselect1.FieldValues['vat4']/100))) * (dm.qselect1.FieldValues['discount4']/100));
                          mf_inventory_frm.grd_mf_inventory.cells[3,mf_inventory_frm.grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                          mf_inventory_frm.grd_mf_inventory.cells[4,mf_inventory_frm.grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit44'];
                  end;

                  if pos_sales_frm.cmb_price_level.Text = '5' then
                  begin
                          p1  := dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100)) - (( dm.qselect1.FieldValues['price5']  + (dm.qselect1.FieldValues['price5']* (dm.qselect1.FieldValues['vat5']/100))) * (dm.qselect1.FieldValues['discount5']/100));
                          mf_inventory_frm.grd_mf_inventory.cells[3,mf_inventory_frm.grd_mf_inventory.rowcount-1] := formatfloat('######0.00',p1);
                         mf_inventory_frm.grd_mf_inventory.cells[4,mf_inventory_frm.grd_mf_inventory.rowcount-1]  := DM.qselect1.fieldvalues['unit55'];
                  end;
        end;
        query  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                   ', inventory_id   = ' + quotedstr(lbl_id.Caption) +
                   ', barcode  = '  + quotedstr(edt_barcode.Text) +
                   ', description  = '  + quotedstr(edt_description.Text) +
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

        close;
        btn_item_query.Click;
        edt_qty.Text := '1';
        edt_barcode.Clear;
        edt_barcode.SetFocus;
        end;

end;

procedure Tpos_sales_frm.btn_barcodeClick(Sender: TObject);
begin

    tag_stock := 4;
    mf_inventory_frm.Showmodal;


end;

procedure Tpos_sales_frm.btn_item_queryClick(Sender: TObject);
begin
    del_item := integer(grd_trans.objects[0,grd_trans.row]);
    query := '  select id' +
             ', ifnull((transaction_id), 0) as transaction_id' +
             ', ifnull((select barcode from inventory where inventory.id = transaction.inventory_id), 0) as barcode ' +
             ', ifnull((select description from inventory where inventory.id = transaction.inventory_id ), "NA") as description ' +
             ', ifnull((price), 0) as price ' +
             ', ifnull((discount), 0) as discount' +
             ', ifnull((quantity), 0) as quantity' +
             ', ifnull((trans_code), "NA") as trans_code' +
             ', sum((quantity * price )) as total_price' +
             ', ifnull((select description from attributes where attributes.id = transaction.unit_id), "NA") as unit from transaction ';

    qwhere := ' where transaction_id = ' +inttostr(sales_trans_id) + ' and machine_id = ' +quotedstr(result) + ' and trans_code = '+quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex])))  ;
    qgroup := ' group by id';

    sql := query + qwhere + qgroup;
    procedures.select_func;

          grd_trans.clearnormalcells;
          grd_trans.rowcount := 2;
          grd_trans.floatingfooter.visible := false;
          total_price := 0;

          if DM.qselect1.RecordCount <> 0 then
          begin
            while DM.qselect1.Eof <> true do
                begin

          id := DM.qselect1.FieldValues['id'];
          grd_trans.objects[0,grd_trans.rowcount-1] := pointer(id);

          total_price := total_price + DM.qselect1.fieldvalues['total_price']-( DM.qselect1.fieldvalues['price'] * (DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity'];
          //edt_barcode.Text := DM.qselect1.fieldvalues['barcode'];
          edt_qty.Text := DM.qselect1.FieldValues['quantity'];
          grd_trans.cells[1,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['quantity'];
          grd_trans.cells[2,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['unit'];
          grd_trans.cells[3,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['description'];
          grd_trans.cells[4,grd_trans.rowcount-1] := formatfloat('#####0.00',DM.qselect1.fieldvalues['price']);
          grd_trans.cells[5,grd_trans.rowcount-1] := formatfloat('#####0.##',DM.qselect1.fieldvalues['discount'])+ '%';
          grd_trans.cells[6,grd_trans.rowcount-1] := formatfloat('####0.00', ((DM.qselect1.fieldvalues['price'] -(DM.qselect1.fieldvalues['price'] * DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity']));

          grd_trans.CellProperties[4,grd_trans.rowcount-1].Alignment := taRightJustify;
          grd_trans.CellProperties[5,grd_trans.rowcount-1].Alignment := taRightJustify;
          grd_trans.CellProperties[6,grd_trans.rowcount-1].Alignment := taRightJustify;

          grd_trans.AddRow;
          dm.qselect1.Next;

          lbl_price.Caption :=  formatfloat('####0.00', total_price);

          end;
          end;
          grd_trans.FloatingFooter.Visible := true;
          grd_trans.cells[1,grd_trans.rowcount-1]  := 'Items:';
          grd_trans.cells[2,grd_trans.rowcount-1]  := '' + inttostr(dm.qselect1.RecordCount);

end;

procedure Tpos_sales_frm.btn_new_transClick(Sender: TObject);
begin
        sales_trans_id := 0;

end;

procedure Tpos_sales_frm.btn_trans_no_queryClick(Sender: TObject);
begin

  if sales_trans_id = 0 then
    begin
      generate_trans_id('doh','transaction');
      if dm.qselect1.RecordCount = 0 then
      begin
        sales_trans_id := 1;
      end else
      begin
        sales_trans_id := dm.qselect1.FieldValues['max_id']+1;
{        sql  := ' insert into transaction  set ' +
                         ' transaction_id     = ' + quotedstr(inttostr(sales_trans_id));
                         procedures.exec_func;
                         showmessage(sql);    }
      end;
      btn_trans_id.Caption := formatfloat('000000000', sales_trans_id);
    end;

  {  if sales_trans_id <> 0 then
                 begin
                    sql  := ' insert into transaction  set ' +
                         ' transaction_id     = ' + quotedstr(btn_trans_id.Caption);
                         procedures.exec_func;
//                         showmessage(sql);
                    // btn_trans_id.Caption := formatfloat('000000000', sales_trans_id);
                 end;     }

end;

procedure Tpos_sales_frm.canceltransExecute(Sender: TObject);
begin
    btn_cancel.Click;
end;

procedure Tpos_sales_frm.ChangeItemExecute(Sender: TObject);
begin
  btn_change_quantity.Click;
end;

procedure Tpos_sales_frm.closefrmExecute(Sender: TObject);
begin
      btn_cancel.click;
end;

procedure Tpos_sales_frm.cmb_barcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 { if key = vk_space then
  begin


  end;   }

end;

procedure Tpos_sales_frm.cmb_price_levelChange(Sender: TObject);
begin
    pos_sales_frm.cmb_price_level.Enabled := false;
end;

procedure Tpos_sales_frm.delExecute(Sender: TObject);
begin
      btn_del_item.Click;
end;

procedure Tpos_sales_frm.discountExecute(Sender: TObject);
begin
  btn_discount.Click;
end;

procedure Tpos_sales_frm.edt_barcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 {      if key = vk_return then
       begin
         edt_barcode.SetFocus;

       end;    }
end;

procedure Tpos_sales_frm.edt_barcodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then
  begin
  grd_trans.SetFocus;
  end;
end;

procedure Tpos_sales_frm.EnterbarcodeExecute(Sender: TObject);
begin
    sql := 'select barcode from inventory where barcode=' +quotedstr(edt_barcode.text);
          procedures.select_func;

          if edt_barcode.Text = dm.qselect1.FieldValues['barcode'] then
              begin
                btn_add_item.Click;
              end
          else if edt_barcode.Text = '' then
              begin
                 tag_stock := 4;
                 mf_inventory_frm.ShowModal;
              end
          else
              begin
              showmessage('Barcode item not found');
              edt_barcode.Clear;
              edt_barcode.SetFocus;
              end;
end;

procedure Tpos_sales_frm.findcusExecute(Sender: TObject);
begin
    btn_wholesale.Click;
end;

procedure Tpos_sales_frm.focusbarcodeExecute(Sender: TObject);
begin
  btn_focus.Click;
end;

procedure Tpos_sales_frm.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_trans_code,'id,description','doh','transaction_code','1=1');
    cmb_trans_code.ItemIndex  := 1;
    btn_trans_no_query.Click;
    edt_barcode.SetFocus;

end;

procedure Tpos_sales_frm.grd_transClick(Sender: TObject);
begin
    del_item := integer(grd_trans.objects[0,grd_trans.row]);
end;

procedure Tpos_sales_frm.payExecute(Sender: TObject);
begin
  btn_tender.Click;
end;

procedure Tpos_sales_frm.pricelevelExecute(Sender: TObject);
begin
  btn_price_level.Click;
end;

procedure Tpos_sales_frm.priceupdateExecute(Sender: TObject);
begin
  btn_price_update.Click;
end;

procedure Tpos_sales_frm.quantityExecute(Sender: TObject);
begin
    btn_quantity.Click;
end;

procedure Tpos_sales_frm.btn_printClick(Sender: TObject);
begin
      frm_receipt.qr_receipt.Preview;
//    frm_receipt.qr_receipt.Print;
end;

procedure Tpos_sales_frm.btn_tenderClick(Sender: TObject);
begin
    if grd_trans.RowCount > 2 then
    begin
      pos_sales_payment_frm.ShowModal;
    end
    else
    begin
      showmessage('Select Items first');
      edt_barcode.SetFocus;
    end;


end;

procedure Tpos_sales_frm.btn_del_itemClick(Sender: TObject);
begin
    pos_sales_frm.grd_trans.SetFocus;
    if messagedlg('Delete Item?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
    begin
      query := 'delete from transaction';
      qwhere := ' where transaction_id = ' +inttostr(sales_trans_id) + ' and id = ' +inttostr(del_item);
      sql := query + qwhere;
      procedures.exec_func;
      btn_item_query.Click;
      edt_qty.Text := '1';
    end;

    if (DM.qselect1.RecordCount = 0) and (edt_name.Text <> '') then
    begin

          sql  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                  ', customer_id =' + quotedstr(inttostr(sales_cus_id));

          //showmessage(sql);
          procedures.exec_func;

          //close;
          pos_sales_frm.btn_cus_query.Click;
          pos_sales_frm.btn_trans_no_query.Click;
          pos_sales_frm.grd_trans.SetFocus;
    end ;

        lbl_price.Caption := '0.00';
        btn_item_query.Click;
        pos_sales_frm.grd_trans.SetFocus;
end;

procedure Tpos_sales_frm.btn_quantityClick(Sender: TObject);
begin
    edt_qty.SetFocus;
end;

procedure Tpos_sales_frm.btn_cancelClick(Sender: TObject);
begin
     if grd_trans.RowCount > 2 then
     begin
           if messagedlg('Transaction is still going on, Do you want to delete transaction?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
           begin
           query := ' delete from transaction ';
           qwhere := ' where transaction_id = ' +inttostr(sales_trans_id) + ' and machine_id = ' + quotedstr(result);

           sql := query + qwhere;
           procedures.exec_func;

           total_price:= 0;
           sales_trans_id := 0;
           btn_trans_no_query.Click;
           btn_cus_query.Click;
           split_trans.CloseHotSpot;
           btn_new_trans.Click;
           lbl_price.Caption := '0.00';
           edt_qty.Text := '1';
           grd_trans.clearnormalcells;
           grd_trans.cells[2,grd_trans.rowcount-1]  := '0';
           grd_trans.rowcount := 2;
           edt_barcode.Clear;
           cmb_price_level.Enabled := false;
           end;
     end
     else
     begin
           total_price:= 0;
           sales_trans_id := 0;
           btn_trans_no_query.Click;
           btn_cus_query.Click;
           split_trans.CloseHotSpot;
           btn_new_trans.Click;
           lbl_price.Caption := '0.00';
           edt_qty.Text := '1';
           grd_trans.clearnormalcells;
           edt_barcode.Clear;
           cmb_price_level.Enabled := false;

     end;


end;

procedure Tpos_sales_frm.btn_change_quantityClick(Sender: TObject);
begin
    quantity_item :=   integer(grd_trans.objects[0,grd_trans.row]);

    if frm_settings.rd_strict.Checked = true then
    begin
    confirmed := 3;
    confirmation_frm.ShowModal;
    end
    else
    begin
    qty := 1;
    pos_sales_qty_frm.ShowModal;
    end;

end;

procedure Tpos_sales_frm.btn_clearClick(Sender: TObject);
begin
  edt_barcode.Clear;
end;

procedure Tpos_sales_frm.btn_closeClick(Sender: TObject);
begin
    cmb_price_level.Enabled := false;
    close;
end;

procedure Tpos_sales_frm.btn_cus_queryClick(Sender: TObject);
begin
    query := 'select customer_id,transaction_id ,ifnull((select concat(lname,", ",fname," ",mi,".") from customer where customer.id = transaction.customer_id), null) as name' +
              ',ifnull((select address from customer where customer.id = transaction.customer_id), null) as address '+
              ',ifnull((select tel_number from customer where customer.id = transaction.customer_id), null) as contact_no from transaction';

    qwhere := ' where customer_id =' + quotedstr(inttostr(sales_cus_id)) + ' and transaction_id =' + quotedstr(inttostr(sales_trans_id));

    sql := query + qwhere;
    //showmessage(sql);
    procedures.select_func;

    if(dm.qselect1.FieldValues['transaction_id']) = sales_trans_id then
    begin
            edt_name.Text := dm.qselect1.FieldValues['name'];
            edt_address.Text := dm.qselect1.FieldValues['address'];
            edt_contact_no.Text := dm.qselect1.FieldValues['contact_no'];
    end
    else
    begin
            edt_name.Text := '';
            edt_address.Text :=   '';
            edt_contact_no.Text :=  '';
    end;


end;

procedure Tpos_sales_frm.btn_wholesaleClick(Sender: TObject);
begin
    btn_item_query.Click;
    if grd_trans.RowCount > 2 then
    begin
      btn_cancel.Click;
      cust_tag := 1;
      mf_customer_frm.ShowModal;
    end
    else
    begin
      cust_tag := 1;
      mf_customer_frm.ShowModal;
    end;
end;

procedure Tpos_sales_frm.btn_price_levelClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
    begin
    confirmed := 5;
    confirmation_frm.ShowModal;
    end
    else
    begin
      pos_sales_frm.cmb_price_level.Enabled := true;
      pos_sales_frm.cmb_price_level.SetFocus;
    end;
end;

procedure Tpos_sales_frm.btn_sales_returnClick(Sender: TObject);
begin
    sales_return.ShowModal;
    sales_return.edt_search.Text := '';
    sales_return.btn_item_query.Click;
    sales_return.btn_return_query.Click;


end;

procedure Tpos_sales_frm.btn_price_updateClick(Sender: TObject);
begin
    price_item :=   integer(grd_trans.objects[0,grd_trans.row]);
    if frm_settings.rd_strict.Checked  = true then
    begin
      confirmed := 4;
      confirmation_frm.ShowModal;
    end
    else
    begin
      pos_sales_price_update_frm.ShowModal;
    end;
end;

procedure Tpos_sales_frm.btn_discountClick(Sender: TObject);
begin
    discount_item :=   integer(grd_trans.objects[0,grd_trans.row]);
    if frm_settings.rd_strict.Checked = true then
    begin
      confirmed := 2;
      confirmation_frm.ShowModal;
    end
    else
    begin
      pos_sales_discount_frm.ShowModal;
    end;
end;



procedure Tpos_sales_frm.btn_focusClick(Sender: TObject);
begin
    edt_barcode.SetFocus;
end;

procedure Tpos_sales_frm.salesreturnExecute(Sender: TObject);
begin
  btn_sales_return.Click;
end;

end.
