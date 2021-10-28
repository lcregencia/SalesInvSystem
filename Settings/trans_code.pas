unit trans_code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, ActnList, AdvPanel, ExtCtrls,
  RzPanel, RzButton, Grids, AdvObj, BaseGrid, AdvGrid, System.Actions;

type
  Ttrans_code_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edt_search: TRzEdit;
    grd_trans_code: TAdvStringGrid;
    btn_query: TRzBitBtn;
    btn_close: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_edit: TRzBitBtn;
    btn_add: TRzBitBtn;
    btn_delete: TRzBitBtn;
    esc: TAction;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    new: TAction;
    search: TAction;
    refresh: TAction;
    delete: TAction;
    print: TAction;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure grd_trans_codeClick(Sender: TObject);
    procedure grd_trans_codeDblClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  trans_code_frm: Ttrans_code_frm;

implementation

uses datamodule, procedures, variables, add_trans_code;

{$R *.dfm}

procedure Ttrans_code_frm.btn_addClick(Sender: TObject);
begin
    trans_code_id := 0;
    trans_code_add_frm.ShowModal;
end;

procedure Ttrans_code_frm.btn_closeClick(Sender: TObject);
begin
    trans_code_id := 0;
    close;
end;

procedure Ttrans_code_frm.btn_queryClick(Sender: TObject);
begin
    edt_search.SetFocus;
    procedures.grd_setup(grd_trans_code);

    query := 'select * from transaction_code';
    qwhere := ' where 1=1';
    if edt_search.text <> '' then
    begin
        qwhere := qwhere + ' and transaction_code.description like ' + quotedstr('%'+trim(edt_search.Text)+'%');
    end;
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        id :=DM.qselect1.FieldValues['id'];

                        grd_trans_code.objects[0,grd_trans_code.rowcount-1] := pointer(id);

                        grd_trans_code.cells[1,grd_trans_code.rowcount-1]  := DM.qselect1.fieldvalues['description'];
                        grd_trans_code.cells[2,grd_trans_code.rowcount-1]  := DM.qselect1.fieldvalues['code'];
                        grd_trans_code.cells[3,grd_trans_code.rowcount-1]  := DM.qselect1.fieldvalues['transaction_value'];
                        grd_trans_code.cells[4,grd_trans_code.rowcount-1]  := DM.qselect1.fieldvalues['inventory_value'];

                        grd_trans_code.CellProperties[3,grd_trans_code.rowcount-1].Alignment := taRightJustify;
                        grd_trans_code.CellProperties[4,grd_trans_code.rowcount-1].Alignment := taRightJustify;

                        grd_trans_code.addrow;
                        DM.qselect1.Next;
                end;
        end;
        grd_trans_code.floatingfooter.visible := true;
        grd_trans_code.cells[1,grd_trans_code.rowcount-1]  := 'Total No. of Stocks:   ' + inttostr(dm.qselect1.RecordCount);

end;

procedure Ttrans_code_frm.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Ttrans_code_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Ttrans_code_frm.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Ttrans_code_frm.grd_trans_codeClick(Sender: TObject);
begin
    trans_code_id := integer(grd_trans_code.objects[0,grd_trans_code.row]);
end;

procedure Ttrans_code_frm.grd_trans_codeDblClick(Sender: TObject);
begin
    trans_code_add_frm.ShowModal;
end;

procedure Ttrans_code_frm.newExecute(Sender: TObject);
begin
    btn_add.Click;
end;

procedure Ttrans_code_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Ttrans_code_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Ttrans_code_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

end.
