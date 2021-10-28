unit pos_sales_returns_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, RzLabel, ExtCtrls, AdvPanel, Grids,
  AdvObj, BaseGrid, AdvGrid, RzPanel, RzCmboBx, ActnList, System.Actions;

type
  Tsales_return = class(TForm)
    AdvPanel1: TAdvPanel;
    RzLabel2: TRzLabel;
    edt_search: TRzEdit;
    RzPanel3: TRzPanel;
    btn_close: TRzBitBtn;
    grd_trans: TAdvStringGrid;
    btn_ok: TRzBitBtn;
    btn_item_query: TRzButton;
    grd_return: TAdvStringGrid;
    btn_return_query: TRzButton;
    lbl_discount: TRzLabel;
    lbl_quantity: TRzLabel;
    lbl_price: TRzLabel;
    lbl_brand: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    lbl_generic: TRzLabel;
    lbl_category: TRzLabel;
    lbl_type_id: TRzLabel;
    cmb_trans_code: TRzComboBox;
    edt_memo: TRzMemo;
    RzLabel4: TRzLabel;
    edt_description: TRzEdit;
    lbl_barcode: TRzLabel;
    btn_return: TRzBitBtn;
    ActionList1: TActionList;
    Esc: TAction;
    procedure btn_item_queryClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_return_queryClick(Sender: TObject);
    procedure grd_transDblClick(Sender: TObject);
    procedure grd_transClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grd_returnDblClick(Sender: TObject);
    procedure btn_returnClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sales_return: Tsales_return;

implementation

uses datamodule, procedures, sql_statement, variables, pos_sales_input_qty_frm,
  inventory;

{$R *.dfm}

procedure Tsales_return.btn_closeClick(Sender: TObject);
begin
  edt_search.Clear;
  Close;
end;

procedure Tsales_return.btn_item_queryClick(Sender: TObject);
begin

    query := '  select id' +
             ', ifnull((transaction_id), 0) as transaction_id' +
             ', ifnull((select barcode from inventory where inventory.id = transaction.inventory_id), 0) as barcode ' +
             ', ifnull((select description from inventory where inventory.id = transaction.inventory_id ), "NA") as description ' +
             ', ifnull((price), 0) as price ' +
             ', ifnull((discount), 0) as discount' +
             ', ifnull(sum(quantity*transaction_value), 0) as quantity' +
             ', ifnull(inventory_id, 0) as inventory_id' +
             ', ifnull(transaction_value, 0) as trans_val' +
             ', ifnull(inventory_value, 0) as inventory_val' +
             ', ifnull(unit_id, 0) as unit_id' +
             ', ifnull(brand, 0) as brand' +
             ', ifnull(category, 0) as category' +
             ', ifnull(generic, 0) as generic' +
             ', ifnull(type_id, 0) as type_id' +
             ', ifnull((trans_code), "NA") as trans_code' +
             ', ifnull(sum((quantity * price )),0) as total_price' +
             ', ifnull((select description from attributes where attributes.id = transaction.unit_id), "NA") as unit from transaction ';

    qwhere := ' where transaction_id = ' + quotedstr(edt_search.Text)+ ' and quantity <> 0';
    qgroup := ' group by inventory_id';


    sql := query + qwhere + qgroup;
    procedures.select_func;

    grd_trans.ClearNormalCells;
    grd_trans.rowcount := 2;
    grd_trans.floatingfooter.visible := false;

        total_price := 0;

        if DM.qselect1.RecordCount <> 0 then
        begin
            if dm.qselect1.FieldValues['quantity'] > 0 then
            begin
              lbl_barcode.Caption := dm.qselect1.FieldValues['barcode'];
              lbl_price.Caption := dm.qselect1.FieldValues['price'];
              lbl_discount.Caption := dm.qselect1.FieldValues['discount'];
              lbl_quantity.Caption := dm.qselect1.FieldValues['quantity'];
              lbl_brand.Caption := dm.qselect1.FieldValues['brand'];
              lbl_category.Caption := dm.qselect1.FieldValues['category'];
              lbl_generic.Caption := dm.qselect1.FieldValues['generic'];
              lbl_type_id.Caption := dm.qselect1.FieldValues['type_id'];

              while DM.qselect1.Eof <> true do
              begin


                      id := DM.qselect1.FieldValues['id'];
                      inven_id := DM.qselect1.FieldValues['inventory_id'];
                      units_id := DM.qselect1.FieldValues['unit_id'];
                      qty_id := DM.qselect1.FieldValues['quantity'];

                      grd_trans.objects[0,grd_trans.rowcount-1] := pointer(id);
                      grd_trans.objects[1,grd_trans.rowcount-1] := pointer(inven_id);
                      grd_trans.objects[2,grd_trans.rowcount-1] := pointer(units_id);
                      grd_trans.objects[3,grd_trans.rowcount-1] := pointer(qty_id);

                      total_price := total_price + DM.qselect1.fieldvalues['total_price']-( DM.qselect1.fieldvalues['price'] * (DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity'];

                      grd_trans.cells[1,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['quantity'];
                      grd_trans.cells[2,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['unit'];
                      grd_trans.cells[3,grd_trans.rowcount-1] := DM.qselect1.fieldvalues['description'];
                      grd_trans.cells[4,grd_trans.rowcount-1] := formatfloat('#####0.00',DM.qselect1.fieldvalues['price']);
                      grd_trans.cells[5,grd_trans.rowcount-1] := formatfloat('#####0.00',DM.qselect1.fieldvalues['discount']);
                      grd_trans.cells[6,grd_trans.rowcount-1] := formatfloat('####0.00', ((DM.qselect1.fieldvalues['price'] -(DM.qselect1.fieldvalues['price'] * DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity']));

                      grd_trans.CellProperties[4,grd_trans.rowcount-1].Alignment := taRightJustify;
                      grd_trans.CellProperties[5,grd_trans.rowcount-1].Alignment := taRightJustify;
                      grd_trans.CellProperties[6,grd_trans.rowcount-1].Alignment := taRightJustify;

                      grd_trans.AddRow;
                      dm.qselect1.Next;
                 end;

            end;
          end;
          grd_trans.FloatingFooter.Visible := true;
          grd_trans.cells[1,grd_trans.rowcount-1]  := 'Items:';
          grd_trans.cells[2,grd_trans.rowcount-1]  := '' + inttostr(dm.qselect1.RecordCount);
      //    end;
end;

procedure Tsales_return.btn_okClick(Sender: TObject);
begin
          btn_item_query.Click;
          btn_return_query.Click;
end;

procedure Tsales_return.btn_return_queryClick(Sender: TObject);
begin
    query := '  select ifnull(id,0) as id' +
             ', ifnull(remarks," ") as remarks ' +
             ', ifnull((transaction_id), 0) as transaction_id' +
             ', ifnull((select barcode from inventory where inventory.id = transaction.inventory_id), 0) as barcode ' +
             ', ifnull((select description from inventory where inventory.id = transaction.inventory_id ), "NA") as description ' +
             ', ifnull(trans_code,0) as trans_code'+
             ', ifnull((price), 0) as price ' +
             ', ifnull((discount), 0) as discount' +
             ', ifnull(sum(quantity), 0) as quantity' +
             ', ifnull(inventory_id, 0) as inventory_id' +
             ', ifnull(transaction_value, 0) as trans_val' +
             ', ifnull(inventory_value, 0) as inventory_val' +
             ', ifnull(unit_id, 0) as unit_id' +
             ', ifnull(brand, 0) as brand' +
             ', ifnull(category, 0) as category' +
             ', ifnull(generic, 0) as generic' +
             ', ifnull(type_id, 0) as type_id' +
             ', ifnull((trans_code), "NA") as trans_code' +
             ', ifnull(sum((quantity * price )),0) as total_price' +
         //    ', ifnull(encode_date,0) as encode_date ' +
             ', ifnull((select description from attributes where attributes.id = transaction.unit_id), "NA") as unit from transaction ';

    qwhere := ' where transaction_id = ' + quotedstr(edt_search.Text) + ' and trans_code =' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) ;
    qgroup := ' group by inventory_id';

    sql := query + qwhere + qgroup;
    //showmessage(sql);
    procedures.select_func;

          grd_return.ClearNormalCells;
          grd_return.rowcount := 2;
          grd_return.floatingfooter.visible := false;

          total_price := 0;

          if DM.qselect1.RecordCount <> 0 then
          begin

          lbl_price.Caption := dm.qselect1.FieldValues['price'];
          lbl_discount.Caption := dm.qselect1.FieldValues['discount'];
          lbl_quantity.Caption := dm.qselect1.FieldValues['quantity'];
          lbl_brand.Caption := dm.qselect1.FieldValues['brand'];
          lbl_category.Caption := dm.qselect1.FieldValues['category'];
          lbl_generic.Caption := dm.qselect1.FieldValues['generic'];
          lbl_type_id.Caption := dm.qselect1.FieldValues['type_id'];
          lbl_barcode.Caption := dm.qselect1.FieldValues['barcode'];

          while DM.qselect1.Eof <> true do
          begin

          id := DM.qselect1.FieldValues['id'];
          inven_id := DM.qselect1.FieldValues['inventory_id'];
          units_id := DM.qselect1.FieldValues['unit_id'];
          qty_id := DM.qselect1.FieldValues['quantity'];

          grd_return.objects[0,grd_return.rowcount-1] := pointer(id);
          grd_return.objects[1,grd_return.rowcount-1] := pointer(inven_id);
          grd_return.objects[2,grd_return.rowcount-1] := pointer(units_id);
          grd_return.objects[3,grd_return.rowcount-1] := pointer(qty_id);

          total_price := total_price + DM.qselect1.fieldvalues['total_price']-( DM.qselect1.fieldvalues['price'] * (DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity'];

          grd_return.cells[1,grd_return.rowcount-1] := DM.qselect1.fieldvalues['quantity'];
          grd_return.cells[2,grd_return.rowcount-1] := DM.qselect1.fieldvalues['unit'];
          grd_return.cells[3,grd_return.rowcount-1] := DM.qselect1.fieldvalues['description'];
          grd_return.cells[4,grd_return.rowcount-1] := formatfloat('#####0.00',DM.qselect1.fieldvalues['price']);
          grd_return.cells[5,grd_return.rowcount-1] := formatfloat('#####0.00',DM.qselect1.fieldvalues['discount']);
          grd_return.cells[6,grd_return.rowcount-1] := formatfloat('####0.00', ((DM.qselect1.fieldvalues['price'] -(DM.qselect1.fieldvalues['price'] * DM.qselect1.fieldvalues['discount']/100)) * DM.qselect1.fieldvalues['quantity']) * -1);
          grd_return.cells[7,grd_return.rowcount-1] := DM.qselect1.fieldvalues['remarks'];

          grd_return.CellProperties[4,grd_return.rowcount-1].Alignment := taRightJustify;
          grd_return.CellProperties[5,grd_return.rowcount-1].Alignment := taRightJustify;
          grd_return.CellProperties[6,grd_return.rowcount-1].Alignment := taRightJustify;

          grd_return.AddRow;
          dm.qselect1.Next;

          end;
          end;
          grd_return.FloatingFooter.Visible := true;
          grd_return.cells[1,grd_return.rowcount-1]  := 'Items:';
          grd_return.cells[2,grd_return.rowcount-1]  := '' + inttostr(dm.qselect1.RecordCount);

end;

procedure Tsales_return.EscExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tsales_return.FormActivate(Sender: TObject);
begin
    edt_search.SetFocus;
    cmb_pop(cmb_trans_code,'id,description', 'doh','transaction_code','1=1');
    cmb_trans_code.ItemIndex  := 3;
end;

procedure Tsales_return.grd_returnDblClick(Sender: TObject);
begin

    inven_id := integer(grd_return.objects[1,grd_return.row]);
    query := ' delete from transaction';
    qwhere := ' where transaction_id =' + quotedstr(edt_search.Text) + ' and inventory_id = ' + quotedstr(inttostr(inven_id)) + ' and trans_code = ' + quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) ;
    sql    :=  query + qwhere ;
    procedures.exec_func;
    btn_item_query.Click;
    btn_return_query.Click;
end;

procedure Tsales_return.grd_transClick(Sender: TObject);
begin
    return_id := integer(grd_trans.objects[0,grd_trans.row]);
    return_inven_id := integer(grd_trans.objects[1,grd_trans.row]);
    return_unit_id :=  integer(grd_trans.objects[2,grd_trans.row]);
    quantity_item :=  integer(grd_trans.objects[3,grd_trans.row]);
end;

procedure Tsales_return.grd_transDblClick(Sender: TObject);
begin

    quantity_item := integer(grd_trans.objects[3,grd_trans.row]);

    query  := ' select ifnull((transaction_id), 0) as transaction_id, ifnull(sum(quantity*transaction_value), 0) as quantity from transaction';
    qwhere := ' where id = ' + quotedstr(inttostr(quantity_item));
    sql    :=  query ;
    procedures.select_func;
    //showmessage(inttostr(quantity_item));

    if quantity_item = 0 then
    begin
         showmessage('Quantity is zero! Nothing to return!');
    end;

    if quantity_item = 1 then
    begin
    if edt_memo.Text <> '' then
    begin
    query  := ' insert into transaction set transaction_id =' + quotedstr(edt_search.Text) +
              ', inventory_id   = ' + quotedstr(inttostr(return_inven_id )) +
              ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
              ', description  = '  + quotedstr(edt_description.Text) +
              ', discount  =' + quotedstr(lbl_discount.Caption)+
              ', quantity  = 1' +// + quotedstr(pos_sales_qty_frm.edt_quantity.Text) +
              ', price   = '  + quotedstr(lbl_price.Caption)+
              ', unit_id = '  + quotedstr(inttostr(return_unit_id )) +
              ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
              ', brand   = '  + quotedstr(lbl_brand.Caption) +
              ', category   = '  + quotedstr(lbl_category.Caption) +
              ', generic   = '  + quotedstr(lbl_generic.Caption) +
              ', type_id   = '  + quotedstr(lbl_type_id.Caption) +
              ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
              ', inventory_value = '  + quotedstr(inttostr(1)) +
              ', remarks  = ' + quotedstr(edt_memo.Text)+
              ', transaction_value = '  + quotedstr(inttostr(-1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;
        btn_item_query.Click;
        btn_return_query.Click;
        edt_memo.Clear;
       // edt_search.Clear;
    end else
      begin
      showmessage('Enter Note... ');
      edt_memo.SetFocus;
      end;

    end;

    if quantity_item > 1 then
    begin
      if edt_memo.Text <> '' then
      begin
        qty := 2;
        qqqty := 1;
        pos_sales_qty_frm.ShowModal;
        query  := ' insert into transaction set transaction_id =' + quotedstr(edt_search.Text) +
              ', inventory_id   = ' + quotedstr(inttostr(return_inven_id )) +
              ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
              ', description  = '  + quotedstr(edt_description.Text) +
              ', discount  =' + quotedstr(lbl_discount.Caption)+
              ', quantity  = ' + quotedstr(pos_sales_qty_frm.edt_quantity.Text) +
              ', price   = '  + quotedstr(lbl_price.Caption)+
              ', unit_id = '  + quotedstr(inttostr(return_unit_id )) +
              ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
              ', brand   = '  + quotedstr(lbl_brand.Caption) +
              ', category   = '  + quotedstr(lbl_category.Caption) +
              ', generic   = '  + quotedstr(lbl_generic.Caption) +
              ', type_id   = '  + quotedstr(lbl_type_id.Caption) +
              ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
              ', inventory_value = '  + quotedstr(inttostr(1)) +
              ', remarks  = ' + quotedstr(edt_memo.Text)+
              ', transaction_value = '  + quotedstr(inttostr(-1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;
        btn_item_query.Click;
        btn_return_query.Click;
        edt_memo.Clear;
        //edt_search.Clear;
      end
      else
      begin
      showmessage('Enter Note... ');
      edt_memo.SetFocus;
      end;//end else
    end;
    //end;
end;

procedure Tsales_return.btn_returnClick(Sender: TObject);
begin
  if quantity_item = 0 then
    begin
         showmessage('Quantity is zero! Nothing to return!');
    end;

    if quantity_item = 1 then
    begin
    if edt_memo.Text <> '' then
    begin
    query  := ' insert into transaction set transaction_id =' + quotedstr(edt_search.Text) +
              ', inventory_id   = ' + quotedstr(inttostr(return_inven_id )) +
              ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
              ', description  = '  + quotedstr(edt_description.Text) +
              ', discount  =' + quotedstr(lbl_discount.Caption)+
              ', quantity  = 1' +// + quotedstr(pos_sales_qty_frm.edt_quantity.Text) +
              ', price   = '  + quotedstr(lbl_price.Caption)+
              ', unit_id = '  + quotedstr(inttostr(return_unit_id )) +
              ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
              ', brand   = '  + quotedstr(lbl_brand.Caption) +
              ', category   = '  + quotedstr(lbl_category.Caption) +
              ', generic   = '  + quotedstr(lbl_generic.Caption) +
              ', type_id   = '  + quotedstr(lbl_type_id.Caption) +
              ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
              ', inventory_value = '  + quotedstr(inttostr(1)) +
              ', remarks  = ' + quotedstr(edt_memo.Text)+
              ', transaction_value = '  + quotedstr(inttostr(-1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;
        btn_item_query.Click;
        btn_return_query.Click;
        edt_memo.Clear;
    end else
      begin
      showmessage('Enter Note... ');
      edt_memo.SetFocus;
      end;

    end;

    if quantity_item > 1 then
    begin
    if edt_memo.Text <> '' then
    begin
      qty := 2;
        pos_sales_qty_frm.ShowModal;
        query  := ' insert into transaction set transaction_id =' + quotedstr(edt_search.Text) +
              ', inventory_id   = ' + quotedstr(inttostr(return_inven_id )) +
              ', barcode  = '  + quotedstr(lbl_barcode.Caption) +
              ', description  = '  + quotedstr(edt_description.Text) +
              ', discount  =' + quotedstr(lbl_discount.Caption)+
              ', quantity  = ' + quotedstr(pos_sales_qty_frm.edt_quantity.Text) +
              ', price   = '  + quotedstr(lbl_price.Caption)+
              ', unit_id = '  + quotedstr(inttostr(return_unit_id )) +
              ', trans_code   = ' +quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
              ', brand   = '  + quotedstr(lbl_brand.Caption) +
              ', category   = '  + quotedstr(lbl_category.Caption) +
              ', generic   = '  + quotedstr(lbl_generic.Caption) +
              ', type_id   = '  + quotedstr(lbl_type_id.Caption) +
              ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) +
              ', inventory_value = '  + quotedstr(inttostr(1)) +
              ', remarks  = ' + quotedstr(edt_memo.Text)+
              ', transaction_value = '  + quotedstr(inttostr(-1));

        sql    :=  query ;
        //showmessage(sql);
        procedures.exec_func;
        btn_item_query.Click;
        btn_return_query.Click;
        edt_memo.Clear;
      end else
      begin
      showmessage('Enter Note... ');
      edt_memo.SetFocus;
      end;
    end;
end;

end.
