unit frm_trans_history;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, Grids, AdvObj,
  BaseGrid, AdvGrid, RzCmboBx, RzSplit, RzLabel, ExtCtrls, RzPanel,
  System.Actions;

type
  Tfrm_transaction_history = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    RzSplitter1: TRzSplitter;
    AdvPanel3: TAdvPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    cmb_companyname: TRzComboBox;
    cmb_name: TRzComboBox;
    cmb_title: TRzComboBox;
    cmb_address: TRzComboBox;
    cmb_city: TRzComboBox;
    AdvPanel2: TAdvPanel;
    grd_transhistory: TAdvStringGrid;
    btn_query: TRzBitBtn;
    btn_close: TRzButton;
    edt_search: TRzEdit;
    btn_print: TRzBitBtn;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    Esc: TAction;
    new: TAction;
    delete: TAction;
    print: TAction;
    refresh: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure grd_transhistoryClick(Sender: TObject);
    procedure grd_transhistoryDblClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_transaction_history: Tfrm_transaction_history;

implementation

uses datamodule, procedures, sql_statement, variables;

{$R *.dfm}

procedure Tfrm_transaction_history.btn_closeClick(Sender: TObject);
begin
      close;
end;

procedure Tfrm_transaction_history.btn_printClick(Sender: TObject);
begin
      //dm.rvreports.ProjectFile := 'I:\Programs\DOH\Reports\Transaction_History_Report.rav';
      //dm.rvreports.Open;
      //dm.rvreports.ProjectFile := 'transaction_history_report';
      //dm.rvreports.SelectReport('rvreports', false);
      //dm.rvreports.Execute;
      //dm.rvreports.Close;
end;

procedure Tfrm_transaction_history.btn_queryClick(Sender: TObject);
begin
    query := ' select id' +
     ', ifnull((encode_date),0) as encode_date'+
     ', ifnull((batch_id), 0) as batch_id' +
     ', ifnull((machine_id), "NA") as machine '+
     ', ifnull((reference_id ), 0) as reference '+
     ',ifnull((transaction_id), 0) as transaction_id1 '+
     ', ifnull((select price * quantity), 0) as payment'+
     ', ifnull((select description from transaction_code where transaction.trans_code = transaction_code.id),"NA") as trans_code1' +
     ', ifnull((select concat(fname," ",mi, ".", lname) from customer where transaction.customer_id = customer.id),"NA") as name' +
     ', ifnull((select name from supplier where transaction.supplier_id = supplier.id),"NA") as supplier_id1' +
     ', ifnull((select description from warehouse where transaction.branch_id = warehouse.id),"NA") as branch' +
     ' from transaction';
     qwhere  :=  ' where 1 = 1';

        sql := query + qwhere;
        //showmessage(sql);
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //showmessage(sql);
        procedures.select_func;
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        grd_transhistory.clearnormalcells;
        grd_transhistory.rowcount := 2;
        grd_transhistory.floatingfooter.visible := false;
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        id :=DM.qselect1.FieldValues['id'];

                        grd_transhistory.objects[0,grd_transhistory.rowcount-1] := pointer(id);
                        grd_transhistory.cells[1,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['machine'];
                        grd_transhistory.cells[2,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['encode_date'];
                        grd_transhistory.cells[3,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['trans_code1'];
                        grd_transhistory.cells[4,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['name'];
                        grd_transhistory.cells[5,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['branch'];
                        grd_transhistory.cells[6,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['batch_id'];
                        grd_transhistory.cells[7,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['reference'];
                        grd_transhistory.cells[8,grd_transhistory.rowcount-1]  := DM.qselect1.fieldvalues['payment'];

                        grd_transhistory.CellProperties[8,grd_transhistory.rowcount-1].Alignment := taRightJustify;
                        //grd_transhistory.CellProperties[7,grd_transhistory.rowcount-1].Alignment := taRightJustify;

                        grd_transhistory.addrow;
                        DM.qselect1.Next;
                end;
                grd_transhistory.floatingfooter.visible := true;
                grd_transhistory.cells[1,grd_transhistory.rowcount-1]  := '' + inttostr(dm.qselect1.RecordCount);
        end;
end;

procedure Tfrm_transaction_history.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tfrm_transaction_history.grd_transhistoryClick(Sender: TObject);
begin
      transhist_id := integer(grd_transhistory.objects[0,grd_transhistory.row]);
end;

procedure Tfrm_transaction_history.grd_transhistoryDblClick(Sender: TObject);
begin
      {  if DM.qselect1.fieldvalues['trans_code1'] = 'Sales' then
          begin

          end
        else
        if DM.qselect1.fieldvalues['trans_code1'] = 'Purchase' then
          begin

          end
        else
        if DM.qselect1.fieldvalues['trans_code1'] = 'Sales Return' then
          begin

          end
        else
        if DM.qselect1.fieldvalues['trans_code1'] = 'Distribution' then
          begin

          end
        else
        if DM.qselect1.fieldvalues['trans_code1'] = 'Stock Out' then
          begin

          end;  }





end;

end.
