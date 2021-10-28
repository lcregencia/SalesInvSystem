unit Details_distribution;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, RzEdit, Mask,
  RzCmboBx, ComCtrls, RzDTP, RzLabel, AdvPanel, ExtCtrls, RzPanel, RzRadChk,
  ActnList, RzSpnEdt, Buttons, RzSplit, System.Actions;

type
  Tfrm_distribution_details = class(TForm)
    RzPanel1: TRzPanel;
    dis_panel: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel7: TRzLabel;
    cmb_from: TRzComboBox;
    cmb_to: TRzComboBox;
    btn_cancel: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_query: TRzBitBtn;
    lbl_distribution_id: TRzLabel;
    RzLabel6: TRzLabel;
    edt_memo: TRzMemo;
    ActionList1: TActionList;
    esc: TAction;
    Search: TAction;
    Refresh: TAction;
    print_preview: TAction;
    grd_distribution_details: TAdvStringGrid;
    btn_item: TRzBitBtn;
    btn_new_distribution: TRzBitBtn;
    New: TAction;
    btn_save: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzLabel5: TRzLabel;
    RzRapidFireButton1: TRzRapidFireButton;
    RzRapidFireButton2: TRzRapidFireButton;
    RzSplitter1: TRzSplitter;
    grd_items: TAdvStringGrid;
    AdvPanel1: TAdvPanel;
    edt_search: TRzEdit;
    RzLabel2: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    spliter: TAction;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    lbl_brand: TRzLabel;
    lbl_category: TRzLabel;
    lbl_generic: TRzLabel;
    lbl_type_id: TRzLabel;
    lbl_transaction_value: TRzLabel;
    lbl_inventory_value: TRzLabel;
    cmb_trans_code: TRzComboBox;
    cmb_trans_code_from: TRzComboBox;
    btn_auto_query: TRzBitBtn;
    lbl_inventory_id: TRzLabel;
    cmb_unit_id: TRzComboBox;
    lbl_distribution_id1: TRzLabel;
    btn_transfer_all: TRzBitBtn;
    btn_qty: TRzBitBtn;
    RzLabel12: TRzLabel;
    cmb_status: TRzComboBox;
    btn_choose: TRzBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btn_select_itemsClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure SearchExecute(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure cmb_fromChange(Sender: TObject);
    procedure btn_itemClick(Sender: TObject);
    procedure btn_transfer_allClick(Sender: TObject);
    procedure cmb_toClick(Sender: TObject);
    procedure grd_itemsDblClick(Sender: TObject);
    procedure btn_new_distributionClick(Sender: TObject);
    procedure NewExecute(Sender: TObject);
    procedure grd_itemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_saveClick(Sender: TObject);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure RzRapidFireButton2Click(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure spliterExecute(Sender: TObject);
    procedure btn_auto_queryClick(Sender: TObject);
    procedure cmb_toKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grd_itemsClick(Sender: TObject);
    procedure btn_qtyClick(Sender: TObject);
    procedure btn_chooseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 qqty: integer;
  frm_distribution_details: Tfrm_distribution_details;


implementation

uses procedures, datamodule, variables, frm_qty, authentication_frm, main,
  frm_control_settings, inventory;

{$R *.dfm}

procedure Tfrm_distribution_details.btn_qtyClick(Sender: TObject);
begin
    if stock_qty <> 0 then
    begin
    distribution_qty_frm.ShowModal;
    end else
    begin
    showmessage('No Stocks');
    //close;

    end;
end;

procedure Tfrm_distribution_details.btn_queryClick(Sender: TObject);
begin
//destination_grid

  procedures.grd_setup(grd_distribution_details);

  query   :=  ' select id,ifnull(inventory_value,0) as inventory_value,ifnull(transaction_id,0) as transaction_id, ifnull(sum(quantity),0) as quantity,ifnull(inventory_id,0) as inventory_id,ifnull(branch_id,0) as branch_id , '+
        ' ifnull((select to_branch from distribution_order where distribution_id = transaction.transaction_id group by inventory_value),0) as to_branch,' +
        ' ifnull((select from_branch from distribution_order where distribution_id = transaction.transaction_id  group by inventory_value),0) as from_branch, '+
        ' ifnull((select description from attributes where attributes.id = transaction.unit_id),0) as unit_id, ' +
        ' ifnull((select barcode from inventory where inventory.id = transaction.inventory_id), 0 ) as barcode, ' +
        ' ifnull((select description from inventory where inventory.id = transaction.inventory_id),"NONE") as description ' +
        ' , ifnull((select id from attributes where id =transaction.status_id),0) status_id from transaction ';
    qwhere  := ' where transaction_id  = ' + quotedstr(inttostr(dis_id)) +
    ' and inventory_value = 1 ';

  qgroup  := ' group by inventory_id ' ;


  sql := query + qwhere + qgroup;

  procedures.select_func;

  grd_distribution_details.clearnormalcells;
  grd_distribution_details.rowcount := 2;
  grd_distribution_details.floatingfooter.visible := false;


        if DM.qselect1.RecordCount <> 0 then
        begin
                cmb_from.ItemIndex              := cmb_from.Items.IndexOfObject(TObject(DM.qselect1.FieldByName('from_branch').AsInteger));
                cmb_to.ItemIndex                := cmb_to.Items.IndexOfObject(TObject(DM.qselect1.FieldByName('to_branch').AsInteger));
                cmb_status.ItemIndex            := cmb_status.Items.IndexOfObject(TObject(DM.qselect1.FieldByName('status_id').AsInteger));
                lbl_distribution_id.Caption := formatfloat('000000000',dm.qselect1.FieldValues['transaction_id']);


                while DM.qselect1.Eof <> true do
                begin
                  id  := dm.qselect1.FieldValues['inventory_id'];

                  grd_distribution_details.Objects[0,grd_distribution_details.RowCount -1] := pointer(id);

                  grd_distribution_details.Cells[1,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['barcode'];
                  grd_distribution_details.Cells[2,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['description'];
                  grd_distribution_details.Cells[3,grd_distribution_details.RowCount-1]     := formatfloat('#0000',dm.qselect1.FieldValues['quantity']);
                  grd_distribution_details.Cells[4,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['unit_id'];

                  grd_distribution_details.CellProperties[1,grd_distribution_details.rowcount-1].Alignment := taRightJustify;
                  grd_distribution_details.CellProperties[3,grd_distribution_details.rowcount-1].Alignment := taRightJustify;

                  grd_distribution_details.addrow;
                  dm.qselect1.Next;
                end;
          end;

                  grd_distribution_details.FloatingFooter.Visible := true;
                  grd_distribution_details.cells[2,grd_distribution_details.rowcount-1]  := 'Total No. of Stocks:   ' + inttostr(dm.qselect1.RecordCount);

end;

procedure Tfrm_distribution_details.FormActivate(Sender: TObject);
begin
  cmb_pop(cmb_unit_id, 'id, description', 'doh','attributes','type= "unit"');
  cmb_pop(cmb_from, 'id, description', 'doh','warehouse','1=1');
  cmb_pop(cmb_to, 'id, description', 'doh','warehouse','1=1');
  cmb_pop(cmb_trans_code,'id, code','doh','transaction_code','1=1');
  cmb_pop(cmb_trans_code_from,'id, code','doh','transaction_code','1=1');
  cmb_pop(cmb_status,'id,description','doh','attributes','type="ds_status"');
  btn_item.Click;

end;

procedure Tfrm_distribution_details.grd_itemsClick(Sender: TObject);
begin
    distribute_id := integer(grd_items.objects[0,grd_items.row]);
end;

procedure Tfrm_distribution_details.grd_itemsDblClick(Sender: TObject);
begin
    distribute_id := integer(grd_items.objects[0,grd_items.row]);
    qqty  := integer(grd_items.objects[1,grd_items.row]);

    if (stock_qty <> 0) and (stock_qty > 0)then
    begin
         if cmb_from.ItemIndex = 0  then
            begin
                    showmessage('Select Source.. ');
                    cmb_from.SetFocus;
            end
         else if cmb_to.ItemIndex = 0 then
            begin
                    showmessage('Select Destination.. ');
                    cmb_to.SetFocus;
            end
            else if cmb_from.ItemIndex = cmb_to.ItemIndex then
                 begin
                    showmessage('Cannot Transfer same route');
                    cmb_from.SetFocus;
                 end
            else
                    distribution_qty_frm.ShowModal;
    end else
    begin
    showmessage('No Stocks');
    //close;
    end;

end;

procedure Tfrm_distribution_details.grd_itemsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
      if key = vk_return then
  begin
    distribute_id := integer(grd_items.objects[0,grd_items.row]);
    distribution_qty_frm.ShowModal;
  end;
end;

procedure Tfrm_distribution_details.NewExecute(Sender: TObject);
begin
  btn_new_distribution.Click;
end;

procedure Tfrm_distribution_details.RefreshExecute(Sender: TObject);
begin
  btn_item.Click;
end;

procedure Tfrm_distribution_details.RzRapidFireButton1Click(Sender: TObject);
begin
  qqty  := integer(grd_items.objects[1,grd_items.row]);
  btn_auto_query.Click;
    if qqty = 0 then
        begin
          showmessage('Cannot Transfer item, Item quantity is  0..');
        end
    else if qqty < 0 then
        begin
           showmessage('Cannot Transfer item, Item quantity is less than  0..');
        end
    else    //else if qty <> 0
        begin
        if cmb_from.ItemIndex = 0  then
            begin
                showmessage('Select Source.. ');
                cmb_from.SetFocus;
            end
        else if cmb_to.ItemIndex = 0 then
            begin
                showmessage('Select Destination.. ');
                cmb_to.SetFocus;
            end
        else
            begin
                //from
                  query := ' insert into transaction set transaction_id ='         + quotedstr(lbl_distribution_id1.Caption) +
                      ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
                      ', machine_id = '                                             + quotedstr(result) +
                      ', branch_id  = '                                            + quotedstr(inttostr(LongInt(cmb_from.Items.Objects[cmb_from.ItemIndex]))) +
                      ', trans_code = '                                            + quotedstr(inttostr(LongInt(cmb_trans_code_from.Items.Objects[cmb_trans_code_from.ItemIndex]))) +
                      ', generic = '                                               + quotedstr(lbl_generic.Caption) +
                      ', brand  = '                                                + quotedstr(lbl_brand.Caption) +
                      ', type_id = '                                               + quotedstr(lbl_type_id.Caption) +
                      ', status_id  = '                                            +quotedstr(inttostr(LongInt(cmb_status.Items.Objects[cmb_status.ItemIndex])))+
                      ', category = '                                              + quotedstr(lbl_category.Caption) +
                      ', inventory_value = '                                       + quotedstr(inttostr(-1)) +
                      ', transaction_value  = '                                    + quotedstr(inttostr(0))  +
                      ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
                      ', quantity   = '                                            + quotedstr(inttostr(1)) +
                      ', encode_id = ' + inttostr(encoder)+
                      ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

                  sql := query ;
                  procedures.exec_func;
                  //showmessage(sql);

              //destination
                  query := ' insert into transaction set transaction_id ='         + quotedstr(lbl_distribution_id1.Caption) +
                      ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
                      ', machine_id = ' + quotedstr(result) +
                      ', branch_id  = '                                            + quotedstr(inttostr(LongInt(cmb_to.Items.Objects[cmb_to.ItemIndex]))) +
                      ', trans_code = '                                            + quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
                      ', generic = '                                               + quotedstr(lbl_generic.Caption) +
                      ', brand  = '                                                + quotedstr(lbl_brand.Caption) +
                      ', type_id = '                                               + quotedstr(lbl_type_id.Caption) +
                      ', category = '                                              + quotedstr(lbl_category.Caption) +
                      ', inventory_value = '                                       + quotedstr(lbl_inventory_value.Caption) +
                      ', transaction_value  = '                                    + quotedstr(lbl_transaction_value.Caption)  +
                      ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
                      ', status_id  = '                                            +quotedstr(inttostr(LongInt(cmb_status.Items.Objects[cmb_status.ItemIndex])))+
                      ', quantity   = '                                            + quotedstr(inttostr(1)) +
                      ', encode_id = ' + inttostr(encoder)+
                      ', encode_date = '                                           + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

                  sql := query ;
                  procedures.exec_func;
                  //showmessage(sql);

              //////////////////////////////////////////////////distribution_order table/////////////////////////////////////////////
                  query := ' insert into distribution_order set distribution_id ='         + quotedstr(inttostr(dis_id)) +
                      ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
                      ', from_branch ='                                            + quotedstr(inttostr(LongInt(cmb_from.Items.Objects[cmb_from.ItemIndex]))) +
                      ', to_branch ='                                              + quotedstr(inttostr(LongInt(cmb_to.Items.Objects[cmb_to.ItemIndex]))) +
                      ', inventory_value = '                                       + quotedstr(inttostr(-1)) +
                      ', transaction_value  = '                                    + quotedstr(inttostr(0))  +
                      ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
                      ', status_id  = '                                            +quotedstr(inttostr(LongInt(cmb_status.Items.Objects[cmb_status.ItemIndex])))+
                      ', quantity   = '                                            + quotedstr(inttostr(1)) +
                      ', machine_id = ' + quotedstr(result) +
                      ', encode_id = ' + inttostr(encoder)+
                      ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

                  sql := query ;
                  procedures.exec_func;

                  showmessage('Stocks Added from Distribution List');
                  btn_item.Click;
            end;
      end;
end;

procedure Tfrm_distribution_details.RzRapidFireButton2Click(Sender: TObject);
begin
        point_qty_id := integer(grd_distribution_details.objects[0,grd_distribution_details.Row]);

        query  := ' delete from transaction';
        qwhere := ' where transaction_id =' + quotedstr(inttostr(dis_id)) +
        ' and inventory_id = ' + quotedstr(inttostr(point_qty_id));

        sql := query + qwhere;

        procedures.exec_func;

        btn_item.Click;
end;

procedure Tfrm_distribution_details.btn_saveClick(Sender: TObject);
begin
if cmb_status.ItemIndex = 0 then
begin
    showmessage('Select Status');
    cmb_status.SetFocus;
end
else
begin
  if grd_distribution_details.RowCount > 2  then
  begin
        if cmb_from.Text = cmb_to.Text then
        begin
        showmessage('Same Location, Change location..');
        cmb_to.SetFocus;
        end
        else
        begin
            if frm_settings.rd_strict.Checked = true then
            begin
            confirmed := 6;
            confirmation_frm.showmodal;
            showmessage('Distribution Issued');
            close;
            end
            else
            begin
              query := ' update transaction set status_id=' + quotedstr(inttostr(longint(frm_distribution_details.cmb_status.Items.Objects[frm_distribution_details.cmb_status.ItemIndex]))) ;
              qwhere  := 'where transaction_id ='         + quotedstr(inttostr(dis_id)) ;
              sql := query + qwhere;
              procedures.exec_func;

              query := ' update distribution_order set remarks=' + quotedstr(frm_distribution_details.edt_memo.Text) + ', status_id=' + quotedstr(inttostr(longint(frm_distribution_details.cmb_status.Items.Objects[frm_distribution_details.cmb_status.ItemIndex]))) ;
              qwhere  := 'where distribution_id ='         + quotedstr(inttostr(dis_id)) ;
              sql := query + qwhere;
              procedures.exec_func;
            end;
        end;
  end
  else
  begin
    showmessage('Select items to transfer');
    cmb_from.SetFocus;
  end;
end;

end;

procedure Tfrm_distribution_details.btn_transfer_allClick(Sender: TObject);
begin
  procedures.grd_setup(grd_distribution_details);

  query   := ' select inventory.id, barcode,description,transaction.branch_id , '+
          ' ifnull((select description from attributes where attributes.id = transaction.unit_id), "NA") as stock_unit, ' +
          ' (select description from warehouse where warehouse.id = transaction.branch_id) as branch, ' +
          ' ifnull(sum(transaction.inventory_value*transaction.quantity), 0) as qty from inventory left join ' +
          ' transaction on inventory.id=transaction.inventory_id ' ;
  qwhere  := ' where (select description from warehouse where warehouse.id = transaction.branch_id) = ' +quotedstr(cmb_from.Text);

  qgroup  := ' group by inventory.id ' ;

  sql     := query  + qwhere + qgroup ;

  procedures.select_func;

  grd_distribution_details.clearnormalcells;
  grd_distribution_details.rowcount := 2;
  grd_distribution_details.floatingfooter.visible := false;

     if DM.qselect1.RecordCount <> 0 then
        begin
           while DM.qselect1.Eof <> true do
                begin
                  id  := dm.qselect1.FieldValues['id'];
                  grd_items.Objects[0,grd_distribution_details.RowCount -1] := pointer(id);

                  grd_distribution_details.Cells[1,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['barcode'];
                  grd_distribution_details.Cells[2,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['description'];
                  grd_distribution_details.Cells[3,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['qty'];
                  grd_distribution_details.Cells[4,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['stock_unit'];
                  grd_distribution_details.Cells[5,grd_distribution_details.RowCount-1]     := dm.qselect1.FieldValues['id'];

                  grd_distribution_details.addrow;
                  dm.qselect1.Next;

                end;
        end;

                grd_distribution_details.FloatingFooter.Visible := true;
                grd_distribution_details.cells[2,grd_distribution_details.rowcount-1]  := 'Total No. of Stocks:   ' + inttostr(dm.qselect1.RecordCount);



end;

procedure Tfrm_distribution_details.SearchExecute(Sender: TObject);
begin
   edt_search.SetFocus;
end;

procedure Tfrm_distribution_details.spliterExecute(Sender: TObject);
begin
if rzsplitter1.HotSpotClosed = true then
  begin
    rzsplitter1.RestoreHotSpot;
  end else
  begin
    rzsplitter1.CloseHotSpot;
  end;
end;

procedure Tfrm_distribution_details.btn_auto_queryClick(Sender: TObject);
begin
 distribute_id := integer(grd_items.objects[0,grd_items.row]);


 query := 'select unit_id, inventory_id, trans_code, batch_id, quantity, branch_id, supplier_id, status_id' +
           ', expiration_date, transaction_value, inventory_value, brand, category, generic, type_id from transaction';
  qwhere := ' where id = ' + quotedstr(inttostr(distribute_id));
  sql := query + qwhere;
  procedures.select_func;

  cmb_unit_id.ItemIndex := cmb_unit_id.Items.IndexOf('PC');
  cmb_trans_code.ItemIndex   := cmb_trans_code.Items.IndexOf('DD');
  cmb_trans_code_from.ItemIndex   := cmb_trans_code.Items.IndexOf('DI');

 query :=  'select id ,brand,category, generic, type, ifnull((select transaction_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('DD'))) +
           '), " ") as transaction_value, ifnull((select inventory_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('DD'))) +
           '), " ") as inventory_value from inventory';

  sql := query + qwhere;
  procedures.select_func;

  lbl_inventory_id.Caption    :=   formatfloat('000000000',distribute_id);
  lbl_brand.Caption           :=  dm.qselect1.FieldValues['brand'];
  lbl_category.Caption        :=  dm.qselect1.FieldValues['category'];
  lbl_generic.Caption         :=  dm.qselect1.FieldValues['generic'];
  lbl_type_id.Caption         :=  dm.qselect1.FieldValues['type'];
  lbl_inventory_value.Caption :=  dm.qselect1.FieldValues['inventory_value'];
  lbl_transaction_value.Caption := dm.qselect1.FieldValues['transaction_value'];


end;

procedure Tfrm_distribution_details.btn_cancelClick(Sender: TObject);
begin
        query  := 'delete from transaction';
        qwhere := ' where transaction_id =' + quotedstr(inttostr(dis_id));

        sql    := query + qwhere;

        if grd_distribution_details.RowCount > 2 then
        begin
           if messagedlg('Distribution is still going on, Do you want to Cancel Progress?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
                begin
                procedures.exec_func;
                query  := 'delete from distribution_order';
                qwhere := ' where distribution_id =' + quotedstr(inttostr(dis_id));
                sql    := query + qwhere;
                procedures.exec_func;
                showmessage('Stocks Distribution Cancelled');
                grd_distribution_details.ClearNormalCells;
                grd_distribution_details.RowCount := 2;
                grd_distribution_details.FloatingFooter.Visible := true;
                close;
                end;
        end else
        begin
            grd_distribution_details.ClearNormalCells;
            grd_distribution_details.RowCount := 2;
            grd_distribution_details.FloatingFooter.Visible := true;
            grd_items.Enabled := false;
            close;
        end;
end;

procedure Tfrm_distribution_details.btn_chooseClick(Sender: TObject);
begin

  mf_inventory_frm.ShowModal;
end;

procedure Tfrm_distribution_details.btn_deleteClick(Sender: TObject);
begin
        point_qty_id := integer(grd_distribution_details.objects[0,grd_distribution_details.Row]);

        query  := ' delete from transaction';
        qwhere := ' where transaction_id =' + quotedstr(inttostr(dis_id)) +
        ' and inventory_id = ' + quotedstr(inttostr(point_qty_id));

        sql := query + qwhere;

        procedures.exec_func;

        btn_item.Click;
end;

procedure Tfrm_distribution_details.btn_itemClick(Sender: TObject);
begin
  procedures.grd_setup(grd_items);

  query   := ' select inventory.id, inventory.barcode,inventory.description,transaction.branch_id, ' +
          ' ifnull((select description from attributes where attributes.id = transaction.unit_id), "NA") as stock_unit, ' +
          ' (select description from warehouse where warehouse.id = transaction.branch_id) as branch, ' +
          ' ifnull(sum(transaction.inventory_value*transaction.quantity), 0) as qty from inventory left join ' +
          ' transaction on inventory.id=transaction.inventory_id ' ;
  qwhere  := ' where 1 = 1';

  qgroup  := ' group by inventory.id ' ;

  if edt_search.Text <> '' then
  begin
  qwhere := qwhere + ' and inventory.description like ' + quotedstr('%'+trim(edt_search.text)+'%');
  end;

  if cmb_from.ItemIndex > 0 then
  begin
  qwhere  := qwhere + ' and (select description from warehouse where warehouse.id = transaction.branch_id) = ' +quotedstr(cmb_from.Text);
  end;


  sql     := query  + qwhere + qgroup ;

  procedures.select_func;

  grd_items.clearnormalcells;
  grd_items.rowcount := 2;
  grd_items.floatingfooter.visible := false;

     if DM.qselect1.RecordCount <> 0 then
        begin
           while DM.qselect1.Eof <> true do
                begin
                  id  := dm.qselect1.FieldValues['id'];
                  qqty  := dm.qselect1.FieldValues['qty'];

                  grd_items.Objects[0,grd_items.RowCount -1] := pointer(id);
                  grd_items.Objects[1,grd_items.RowCount -1] := pointer(qqty);
                  grd_items.Cells[1,grd_items.RowCount-1]     := dm.qselect1.FieldValues['barcode'];
                  grd_items.Cells[2,grd_items.RowCount-1]     := dm.qselect1.FieldValues['description'];
                  stock_qty :=   dm.qselect1.FieldValues['qty'];
                  grd_items.Cells[3,grd_items.RowCount-1]     := dm.qselect1.FieldValues['qty'];
                    if dm.qselect1.FieldValues['qty'] <= 100 then
                       begin
                         grd_items.RowColor[grd_items.rowcount-1] := clyellow;

                    if dm.qselect1.FieldValues['qty'] <= 50 then
                       begin
                              grd_items.RowColor[grd_items.rowcount-1] := clred;
                       end;
                       end;


                grd_items.Cells[4,grd_items.RowCount-1]     := dm.qselect1.FieldValues['stock_unit'];

                grd_items.addrow;
                dm.qselect1.Next;

                end;
        end;

                grd_items.FloatingFooter.Visible := true;
                grd_items.cells[2,grd_items.rowcount-1]  := 'Total No. of Stocks:   ' + inttostr(dm.qselect1.RecordCount);
//query distribution
        btn_query.Click;
end;

procedure Tfrm_distribution_details.btn_new_distributionClick(Sender: TObject);
begin
  dis_panel.Enabled := true;

  query := ' select ifnull(transaction_id, 0) as trans_id from transaction ';
  sql   := query + ' order by trans_id desc limit 1 ';

  procedures.select_func;
  if DM.qselect1.FieldValues['trans_id'] <> NULL then
        begin
               dis_id := DM.qselect1.FieldValues['trans_id'];
        end
  else
           begin
                dis_id:= 0;
           end;
              dis_id := dis_id + 1;

        lbl_distribution_id.Caption := formatfloat('000000000',dis_id);
        lbl_distribution_id1.caption  := formatfloat('000000000',dis_id);
        distribution_qty_frm.lbl_distribution_id.Caption := formatfloat('000000000',dis_id);

end;

procedure Tfrm_distribution_details.btn_okClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_distribution_details.btn_select_itemsClick(Sender: TObject);
begin
  distribute  := 1;
  //mf_inventory_frm.ShowModal;

end;

procedure Tfrm_distribution_details.cmb_fromChange(Sender: TObject);
begin
  btn_item.Click;
end;

procedure Tfrm_distribution_details.cmb_toClick(Sender: TObject);
begin
   grd_items.Enabled := true;
   btn_transfer_all.Enabled := true;
end;

procedure Tfrm_distribution_details.cmb_toKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    grd_items.SetFocus;
  end;
end;

procedure Tfrm_distribution_details.edt_searchChange(Sender: TObject);
begin
  btn_item.Click;
end;

procedure Tfrm_distribution_details.escExecute(Sender: TObject);
begin
    btn_cancel.Click;
end;

end.
