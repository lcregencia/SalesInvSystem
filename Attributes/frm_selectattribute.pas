unit frm_selectattribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, RzButton, Grids, AdvObj, BaseGrid, AdvGrid, ExtCtrls,
  RzPanel, ActnList, StdCtrls, Mask, RzEdit, RzLabel, System.Actions;

type
  Tfrm_selectatt = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    grd_attributes: TAdvStringGrid;
    btn_cancel: TRzBitBtn;
    btn_add: TRzBitBtn;
    btn_query: TRzBitBtn;
    AdvPanelStyler1: TAdvPanelStyler;
    btn_delete: TRzBitBtn;
    ActionList1: TActionList;
    esc: TAction;
    delete: TAction;
    btn_print: TRzBitBtn;
    print: TAction;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edt_search: TRzEdit;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    new: TAction;
    search: TAction;
    refresh: TAction;
    procedure btn_queryClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grd_attributesDblClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure grd_attributesClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure edt_searchChange(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_selectatt: Tfrm_selectatt;

implementation

uses procedures, sql_statement, variables, frm_addattribute, frm_attribute,
  datamodule;

{$R *.dfm}

procedure Tfrm_selectatt.btn_addClick(Sender: TObject);
begin
      selectatt_id := 0;
      frm_addatt.show;
end;

procedure Tfrm_selectatt.btn_cancelClick(Sender: TObject);
begin
      attribute_temp := 0;
      selectatt_id := 0;
      type_temp := '';
      Close;
end;

procedure Tfrm_selectatt.btn_deleteClick(Sender: TObject);
begin
      sql := ' delete from attributes where id = ' + quotedstr(inttostr(selectatt_id));
      if messagedlg('Are you sure you want to delete this attribute?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
        procedures.exec_func;
        showmessage('Attribute Deleted!');
        btn_query.Click;
      end;
end;

procedure Tfrm_selectatt.btn_queryClick(Sender: TObject);
begin
    procedures.grd_setup(grd_attributes);

    query := 'select id, ifnull(description,"NA") as description, ifnull(type,"NA") as type from attributes';
    qwhere := ' where 1=1';

    if attribute_temp = 1 then
    begin
         qwhere := qwhere + ' and type = "brand"';
         type_temp := 'brand';
    end else if attribute_temp = 2 then
    begin
         qwhere := qwhere + ' and type = "category"';
         type_temp := 'category';
    end else if attribute_temp = 3 then
    begin
         qwhere := qwhere + ' and type = "generic"';
         type_temp := 'generic';
    end else if attribute_temp = 4 then
    begin
         qwhere := qwhere + ' and type = "status"';
         type_temp := 'status';
    end else if attribute_temp = 5 then
    begin
         qwhere := qwhere + ' and type = "unit"';
         type_temp := 'unit';
    end else if attribute_temp = 6 then
    begin
         qwhere := qwhere + ' and type = "type"';
         type_temp := 'type';
    end else if attribute_temp = 7 then
    begin
         qwhere := qwhere + ' and type = "location"';
         type_temp := 'location';
    end else if attribute_temp = 8 then
    begin
         qwhere := qwhere + ' and type = "position"';
         type_temp := 'position';
    end else if attribute_temp = 9  then
    begin
         qwhere := qwhere + ' and type = "payment"';
         type_temp := 'payment';
    end;

    if edt_search.Text <> '' then
    begin
        qwhere := qwhere + ' and description like ' + quotedstr('%'+trim(edt_search.Text)+'%');
    end;

    sql := query + qwhere;
    procedures.select_func;

    grd_attributes.clearnormalcells;
    grd_attributes.rowcount := 2;
    grd_attributes.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
      while DM.qselect1.Eof <> true do
      begin
        id :=DM.qselect1.FieldValues['id'];

        grd_attributes.objects[0,grd_attributes.rowcount-1] := pointer(id);

        grd_attributes.cells[1,grd_attributes.rowcount-1]  := DM.qselect1.fieldvalues['description'];
        grd_attributes.cells[2,grd_attributes.rowcount-1] := DM.qselect1.fieldvalues['type'];
        grd_attributes.addrow;
        DM.qselect1.Next;

      end;
      grd_attributes.floatingfooter.visible := true;
      grd_attributes.cells[1,grd_attributes.rowcount-1]  := 'Total Attributes:   ' + inttostr(dm.qselect1.RecordCount);
    end;
end;

procedure Tfrm_selectatt.deleteExecute(Sender: TObject);
begin
      btn_delete.Click;
end;

procedure Tfrm_selectatt.escExecute(Sender: TObject);
begin
      btn_cancel.Click;
end;

procedure Tfrm_selectatt.FormActivate(Sender: TObject);
begin
      btn_query.Click;
end;

procedure Tfrm_selectatt.grd_attributesClick(Sender: TObject);
begin
  selectatt_id := integer(grd_attributes.objects[0,grd_attributes.row]);
end;

procedure Tfrm_selectatt.grd_attributesDblClick(Sender: TObject);
begin
      frm_addatt.ShowModal;
end;

procedure Tfrm_selectatt.newExecute(Sender: TObject);
begin
    btn_add.Click;
end;

procedure Tfrm_selectatt.printExecute(Sender: TObject);
begin
      btn_print.Click;
end;

procedure Tfrm_selectatt.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tfrm_selectatt.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

procedure Tfrm_selectatt.edt_searchChange(Sender: TObject);
begin
    btn_query.Click;
end;

end.
