unit supplier_masterfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, Grids, AdvObj,
  BaseGrid, AdvGrid, RzCmboBx, RzSplit, RzLabel, ExtCtrls, RzPanel,
  System.Actions;

type
  Tmf_supplier_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    split_supplier: TRzSplitter;
    AdvPanel3: TAdvPanel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel10: TRzLabel;
    cmb_title: TRzComboBox;
    cmb_city: TRzComboBox;
    AdvPanel2: TAdvPanel;
    grd_mf_supplier: TAdvStringGrid;
    btn_query: TRzBitBtn;
    btn_close: TRzButton;
    edt_search: TRzEdit;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    btn_print: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_new: TRzBitBtn;
    esc: TAction;
    new: TAction;
    delete: TAction;
    print: TAction;
    refresh: TAction;
    search: TAction;
    splitter: TAction;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel12: TRzLabel;
    btn_edit: TRzBitBtn;
    btn_ok: TRzBitBtn;

    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_companynameClick(Sender: TObject);
    procedure cmb_nameClick(Sender: TObject);
    procedure cmb_titleClick(Sender: TObject);
    procedure cmb_addressClick(Sender: TObject);
    procedure cmb_cityClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure grd_mf_supplierDblClick(Sender: TObject);
    procedure grd_mf_supplierClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure splitterExecute(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure edt_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grd_mf_supplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_supplier_frm: Tmf_supplier_frm;


implementation

uses datamodule, procedures, sql_statement, variables, frm_supplierdetails,
  authentication_frm, frm_control_settings, Supplier_detail_report,
  Supplier_report;

{$R *.dfm}

procedure Tmf_supplier_frm.newExecute(Sender: TObject);
begin
      btn_new.Click;
end;

procedure Tmf_supplier_frm.printExecute(Sender: TObject);
begin
      btn_print.Click;
end;

procedure Tmf_supplier_frm.refreshExecute(Sender: TObject);
begin
      btn_query.Click;
end;

procedure Tmf_supplier_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

procedure Tmf_supplier_frm.splitterExecute(Sender: TObject);
begin
    if split_supplier.HotSpotClosed = true then
    begin
        split_supplier.RestoreHotSpot;
    end else
    begin
        split_supplier.CloseHotSpot;
    end;
end;

procedure Tmf_supplier_frm.btn_closeClick(Sender: TObject);
begin
    supp_id := 0;
    edt_search.Clear;
    //supp_temp := 0;
    close;
end;

procedure Tmf_supplier_frm.btn_deleteClick(Sender: TObject);
begin
      if frm_settings.rd_strict.Checked = true then
      begin
          confirmed  := 12;
          confirmation_frm.ShowModal;
      end
      else
      begin
      sql := ' delete from supplier where id = ' + quotedstr(inttostr(supp_id));
      if messagedlg('Are you sure you want to delete this supplier?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
        procedures.exec_func;
        btn_query.Click;
        showmessage('Supplier Deleted!');
      end
      else
        grd_mf_supplier.SetFocus;
      end;
end;

procedure Tmf_supplier_frm.btn_editClick(Sender: TObject);
begin
  if frm_settings.rd_strict.Checked = true then
    begin
      confirmed := 11;
      confirmation_frm.ShowModal;
    end
    else
    begin
    frm_supplier_details.btn_delete.Enabled  := true;
    frm_supplier_details.ShowModal;
    btn_query.Click;
    grd_mf_supplier.SetFocus;
    end;
end;

procedure Tmf_supplier_frm.btn_newClick(Sender: TObject);
begin
        supp_id := 0;
        frm_supplier_details.ShowModal;
        btn_query.Click;
end;

procedure Tmf_supplier_frm.btn_okClick(Sender: TObject);
begin
    if supp_tag = 0 then
        btn_edit.Click;
    if supp_tag = 1 then
    begin
        supp_temp := supp_id;
        po_counter := 1;
        close;
    end;
end;

procedure Tmf_supplier_frm.btn_printClick(Sender: TObject);
begin
    frm_supp_report.qr_supp_report.Preview;
end;

procedure Tmf_supplier_frm.btn_queryClick(Sender: TObject);
begin
  procedures.grd_setup(grd_mf_supplier);

  query := 'select *, ifnull((select description from attributes where supplier.title = attributes.id),"NA") as title1 from supplier';
  qwhere := ' where 1=1';

        if edt_search.text <> '' then
        begin
                qwhere := qwhere + ' and supplier.company_name like ' + quotedstr('%'+trim(edt_search.Text)+'%');
        end;

        if cmb_title.ItemIndex <> 0 then
        begin
                qwhere := qwhere + ' and supplier.title = ' + quotedstr(inttostr(longint(cmb_title.Items.Objects[cmb_title.ItemIndex])));
        end;

        if cmb_city.ItemIndex <> 0 then
        begin
                qwhere := qwhere + ' and supplier.city = ' + quotedstr(cmb_city.Text);
        end;

        sql := query + qwhere;
        procedures.select_func;

        grd_mf_supplier.clearnormalcells;
        grd_mf_supplier.rowcount := 2;
        grd_mf_supplier.floatingfooter.visible := false;

        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        id :=DM.qselect1.FieldValues['id'];

                        grd_mf_supplier.objects[0,grd_mf_supplier.rowcount-1] := pointer(id);
                        grd_mf_supplier.cells[1,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['company_name'];
                        grd_mf_supplier.cells[2,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['name'];
                        grd_mf_supplier.cells[3,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['title1'];
                        grd_mf_supplier.cells[4,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['city'];
                        grd_mf_supplier.cells[5,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['phone_number'];
                        grd_mf_supplier.cells[6,grd_mf_supplier.rowcount-1]  := DM.qselect1.fieldvalues['email'];

                        grd_mf_supplier.addrow;
                        DM.qselect1.Next;
                end;
                grd_mf_supplier.floatingfooter.visible := true;
                grd_mf_supplier.cells[1,grd_mf_supplier.rowcount-1]  := 'Total Supplier: ' + inttostr(dm.qselect1.RecordCount);
        end;
        edt_search.SetFocus;
end;

procedure Tmf_supplier_frm.btn_saveClick(Sender: TObject);
begin
      supp_id := 0;
      frm_supplier_details.show;
end;

procedure Tmf_supplier_frm.cmb_addressClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.cmb_cityClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.cmb_companynameClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.cmb_nameClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.cmb_titleClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tmf_supplier_frm.edt_searchChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_supplier_frm.edt_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = vk_return then
        grd_mf_supplier.SetFocus;;
end;

procedure Tmf_supplier_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tmf_supplier_frm.FormActivate(Sender: TObject);
begin
    cmb_pop(cmb_title,'id, description','doh','attributes','type = "position"');
    cmb_pop(cmb_city,'id, city','doh','supplier','1=1');
    //////////////////////////////////////////////
    btn_query.Click;
end;

procedure Tmf_supplier_frm.grd_mf_supplierClick(Sender: TObject);
begin
      supp_id := integer(grd_mf_supplier.objects[0,grd_mf_supplier.row]);
end;

procedure Tmf_supplier_frm.grd_mf_supplierDblClick(Sender: TObject);
begin
      btn_ok.Click;
end;

procedure Tmf_supplier_frm.grd_mf_supplierKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
        btn_ok.Click;
end;

end.
