unit mf_receiving_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ActnList, AdvPanel, ExtCtrls, StdCtrls, Mask, RzEdit, Grids,
  AdvObj, BaseGrid, AdvGrid, RzCmboBx, RzLabel, RzSplit, RzButton,
  System.Actions;

type
  Tmf_receiving_report_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzPanel1: TRzPanel;
    rr_filter: TRzSplitter;
    AdvPanel3: TAdvPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel6: TRzLabel;
    cmb_supplier: TRzComboBox;
    cmb_status: TRzComboBox;
    AdvPanel2: TAdvPanel;
    grd_mf_rr: TAdvStringGrid;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    edt_search: TRzEdit;
    btn_query: TRzBitBtn;
    btn_close: TRzBitBtn;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel7: TRzLabel;
    search: TAction;
    refresh: TAction;
    filter: TAction;
    print: TAction;
    btn_print: TRzBitBtn;
    esc: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure filterExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure grd_mf_rrDblClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_receiving_report_frm: Tmf_receiving_report_frm;

implementation

uses variables, procedures, datamodule, receiving_report, RR_report;

{$R *.dfm}

procedure Tmf_receiving_report_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tmf_receiving_report_frm.btn_printClick(Sender: TObject);
begin
    frm_rr_report.qr_rr_report.Preview;
end;

procedure Tmf_receiving_report_frm.btn_queryClick(Sender: TObject);
begin
    query := 'select ifnull(encode_date,"NA") as encode_date, ifnull(reference_id,0) as reference_id, ifnull(rr_id,0) as rr_id, ifnull((select code from transaction_code where id=trans_code),0) as trans_code, ifnull(sum(inventory_id),0) as total_items ' +
             ',ifnull(sum(quantity),0) as total_quantity, ifnull((select concat(fname," ",lname) from employee where id=transaction.encode_id),"NA") as encoder' +
             ', ifnull((select concat(fname," ",lname) from employee where id=transaction.checked_by),"NA") as checked_by from transaction';
    qwhere := ' where rr_id > 0';
    qgroup := ' group by rr_id';
    qorder := ' order by encode_date asc';

    sql := query + qwhere + qgroup + qorder;
    procedures.select_func;

    grd_mf_rr.clearnormalcells;
    grd_mf_rr.rowcount := 2;
    grd_mf_rr.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
        while DM.qselect1.Eof <> true do
        begin
            id :=DM.qselect1.FieldValues['reference_id'];

            grd_mf_rr.objects[0,grd_mf_rr.rowcount-1] := pointer(id);

            grd_mf_rr.cells[1,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['encode_date'];
            grd_mf_rr.cells[2,grd_mf_rr.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['reference_id']);
            grd_mf_rr.cells[3,grd_mf_rr.rowcount-1]  := formatfloat('000000000',DM.qselect1.fieldvalues['rr_id']);
            grd_mf_rr.cells[4,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['trans_code'];
            grd_mf_rr.cells[5,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['total_items'];
            grd_mf_rr.cells[6,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['total_quantity'];
            grd_mf_rr.cells[7,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['encoder'];
            grd_mf_rr.cells[8,grd_mf_rr.rowcount-1]  := DM.qselect1.fieldvalues['checked_by'];

            grd_mf_rr.CellProperties[5,grd_mf_rr.rowcount-1].Alignment := taRightJustify;
            grd_mf_rr.CellProperties[6,grd_mf_rr.rowcount-1].Alignment := taRightJustify;

            grd_mf_rr.addrow;
            DM.qselect1.Next;
        end;
        grd_mf_rr.floatingfooter.visible := true;
        grd_mf_rr.cells[9,grd_mf_rr.rowcount-1]  := 'Total Records: ' + inttostr(DM.qselect1.RecordCount);
    end;
end;

procedure Tmf_receiving_report_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tmf_receiving_report_frm.filterExecute(Sender: TObject);
begin
  if rr_filter.HotSpotClosed = true then
  begin
      rr_filter.RestoreHotSpot;
  end else
  begin
      rr_filter.CloseHotSpot;
  end;
end;

procedure Tmf_receiving_report_frm.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_receiving_report_frm.grd_mf_rrDblClick(Sender: TObject);
begin
  purchase_id := integer(grd_mf_rr.objects[0,grd_mf_rr.row]);
  receiving_report_frm.Show;

end;

procedure Tmf_receiving_report_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tmf_receiving_report_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_receiving_report_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

end.
