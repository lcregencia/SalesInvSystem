unit stocks_distribution;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Mask, RzEdit, Grids, AdvObj, BaseGrid, AdvGrid,
  RzButton, RzSplit, RzLabel, RzPanel, AdvPanel, ExtCtrls, ComCtrls, RzCmboBx,
  RzTabs, RzDlgBtn, System.Actions;

type
  Tstock_distribution_frm = class(TForm)
    panel: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btn_cancel: TRzBitBtn;
    btn_search_item: TRzBitBtn;
    edt_search: TRzEdit;
    btn_query: TRzBitBtn;
    RzPanel1: TRzPanel;
    split_distribution: TRzSplitter;
    AdvPanel1: TAdvPanel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    dtp_from: TDateTimePicker;
    dtp_to: TDateTimePicker;
    cmb_unit: TRzComboBox;
    cmb_location: TRzComboBox;
    btn_ok: TRzBitBtn;
    ActionList1: TActionList;
    esc: TAction;
    Search: TAction;
    Refresh: TAction;
    open_splitter: TAction;
    print_preview: TAction;
    grd_distribution: TAdvStringGrid;
    RzLabel5: TRzLabel;
    cmb_to: TRzComboBox;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtp_fromChange(Sender: TObject);
    procedure dtp_toChange(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure cmb_brandChange(Sender: TObject);
    procedure cmb_genericChange(Sender: TObject);
    procedure cmb_categoryChange(Sender: TObject);
    procedure cmb_typeChange(Sender: TObject);
    procedure cmb_unitChange(Sender: TObject);
    procedure cmb_locationChange(Sender: TObject);
    procedure cmb_trans_codeChange(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_search_itemClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure SearchExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure open_splitterExecute(Sender: TObject);
    procedure grd_distributionDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  stock_distribution_frm: Tstock_distribution_frm;

implementation

uses procedures, variables, datamodule, Details_distribution, frm_qty;

{$R *.dfm}

procedure Tstock_distribution_frm.btn_cancelClick(Sender: TObject);
begin
  close;
end;

procedure Tstock_distribution_frm.btn_queryClick(Sender: TObject);
begin
  procedures.grd_setup(grd_distribution);

      /////////////////////////////// populating distribution/////////////////////////
  qwhere  := ' where 1 = 1 ' ;
  query := ' select ifnull(id,0) as id,ifnull(distribution_id,0) as distribution_id, ifnull(inventory_id,0) as inventory_id,ifnull(quantity,0) as quantity,ifnull(inventory_value,0) as inventory_value, ' +
    ' ifnull((select description from attributes where attributes.id = distribution_order.unit_id),"NA") as unit_id, ' +
    ' ifnull((select description from warehouse where warehouse.id = distribution_order.from_branch), " ") as from_branch, ' +
    ' ifnull((select description from warehouse where warehouse.id = distribution_order.to_branch), " ") as to_branch, ' +
    ' ifnull((select description from attributes where attributes.id = distribution_order.status_id),"NA") as status1  ' +
    ' ,ifnull(encode_date,0) as encode_date from distribution_order ' ;
  qgroup   := ' group by distribution_id ' ;

  if edt_search.Text <> ''  then
  begin
    qwhere  := qwhere + ' and concat (distribution_id) like ' + quotedstr('%'+trim(edt_search.Text)+'%');
  end;

    if cmb_unit.ItemIndex > 0 then
  begin
    qwhere := qwhere + ' and ifnull((select description from attributes where attributes.id = inventory.unit), 0) =' +quotedstr(cmb_unit.Text);
  end;

    if cmb_location.ItemIndex > 0 then
  begin
    qwhere := qwhere + ' and  ifnull((select description from warehouse where warehouse.id = distribution_order.branch_id), " N/A")  =' +quotedstr(cmb_location.Text);
  end;

   if cmb_location.ItemIndex > 0 then
  begin
    qwhere := qwhere + ' and  ifnull((select description from warehouse where warehouse.id = distribution_order.branch_id), " N/A")  =' +quotedstr(cmb_location.Text);
  end;

  sql := query  + qwhere + qgroup ;


  procedures.select_func;

  grd_distribution.ClearNormalCells;
  grd_distribution.RowCount := 2;
  grd_distribution.FloatingFooter.Visible := false;


        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                  id  := dm.qselect1.FieldValues['distribution_id'];
                  grd_distribution.objects[0,grd_distribution.rowcount-1] := pointer(id);

                  grd_distribution.cells[1,grd_distribution.RowCount -1]  := formatfloat('00000000',dm.qselect1.FieldValues['distribution_id']);
                  grd_distribution.cells[2,grd_distribution.RowCount -1]  := dm.qselect1.FieldValues['encode_date'];
                  grd_distribution.cells[3,grd_distribution.RowCount -1]  := dm.qselect1.FieldValues['from_branch'];
                  grd_distribution.cells[4,grd_distribution.RowCount -1]  := dm.qselect1.FieldValues['to_branch'];
                  grd_distribution.cells[5,grd_distribution.RowCount -1]  := dm.qselect1.FieldValues['status1'];

                  grd_distribution.CellProperties[1,grd_distribution.rowcount-1].Alignment := taRightJustify;


                  grd_distribution.AddRow;
                  dm.qselect1.Next;

                end;
              grd_distribution.FloatingFooter.Visible := true;

        end;

end;

procedure Tstock_distribution_frm.btn_search_itemClick(Sender: TObject);
begin
  query := ' select ifnull(distribution_id, 0) as dis_id from distribution_order ';
  sql   := query + ' order by distribution_id desc limit 1 ';

  procedures.select_func;
  if DM.qselect1.FieldValues['dis_id'] <> NULL then
        begin
               dis_id := DM.qselect1.FieldValues['dis_id'];
        end
  else begin
                dis_id:= 0;
        end;
              dis_id := dis_id + 1;

    frm_distribution_details.Show;

end;

procedure Tstock_distribution_frm.escExecute(Sender: TObject);
begin
  close;
end;

procedure Tstock_distribution_frm.cmb_brandChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_categoryChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_genericChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_locationChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_trans_codeChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_typeChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.cmb_unitChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.dtp_fromChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.dtp_toChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.edt_searchChange(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.FormActivate(Sender: TObject);
begin
  cmb_pop(cmb_unit,'id, description','doh','attributes','type="unit"');
  cmb_pop(cmb_location,'id, description','doh','warehouse','1=1');
  cmb_pop(cmb_to,'id, description','doh','warehouse','1=1');
  btn_query.Click;
end;

procedure Tstock_distribution_frm.grd_distributionDblClick(Sender: TObject);
begin
  dis_id  := integer(grd_distribution.objects[0,grd_distribution.row]);
  frm_distribution_details.Show;

end;

procedure Tstock_distribution_frm.open_splitterExecute(Sender: TObject);
begin
 if split_distribution.HotSpotClosed = true then
  begin
    split_distribution.RestoreHotSpot;
  end else
  begin
    split_distribution.CloseHotSpot;
  end;
end;

procedure Tstock_distribution_frm.RefreshExecute(Sender: TObject);
begin
  btn_query.Click;
end;

procedure Tstock_distribution_frm.SearchExecute(Sender: TObject);
begin
  edt_search.SetFocus;
end;

end.
