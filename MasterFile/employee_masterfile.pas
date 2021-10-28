unit employee_masterfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, Grids, AdvObj,
  BaseGrid, AdvGrid, RzCmboBx, RzSplit, RzLabel, ExtCtrls, RzPanel,
  System.Actions;

type
  Tmf_employee_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    RzSplitter1: TRzSplitter;
    AdvPanel3: TAdvPanel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    cmb_position: TRzComboBox;
    AdvPanel2: TAdvPanel;
    grd_mf_employee: TAdvStringGrid;
    btn_query: TRzBitBtn;
    edt_search: TRzEdit;
    AdvPanelStyler1: TAdvPanelStyler;
    btn_new: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_close1: TRzBitBtn;
    ActionList1: TActionList;
    Action1: TAction;

    procedure btn_queryClick(Sender: TObject);
    procedure cmb_genderClick(Sender: TObject);
    procedure cmb_positionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure grd_mf_employeeDblClick(Sender: TObject);
    procedure grd_mf_employeeClick(Sender: TObject);
    procedure btn_close1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure edt_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_printClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_employee_frm: Tmf_employee_frm;

implementation

uses datamodule, procedures, sql_statement, variables, frm_employeedetails,
  authentication_frm, frm_control_settings, Employee_report;

{$R *.dfm}




procedure Tmf_employee_frm.Action1Execute(Sender: TObject);
begin
  btn_close1.Click;
end;

procedure Tmf_employee_frm.btn_close1Click(Sender: TObject);
begin
  edt_search.Clear;
  close;
end;

procedure Tmf_employee_frm.btn_deleteClick(Sender: TObject);
begin
      if frm_settings.rd_strict.Checked  = true then
      begin
          confirmed  := 8;
          confirmation_frm.ShowModal;
      end else
      begin
          sql := ' delete from employee where id = ' + quotedstr(inttostr(emp_id));
          if messagedlg('Are you sure you want to delete this Employee?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
          begin
            //showmessage(sql);
            procedures.exec_func;
            btn_query.Click;
            showmessage('Employee Deleted!');
          end;
      end;
end;

procedure Tmf_employee_frm.btn_newClick(Sender: TObject);
begin
      emp_id := 0;
      frm_employee_details.ShowModal;
end;

procedure Tmf_employee_frm.btn_printClick(Sender: TObject);
begin
  frm_emp_report.qr_emp_report.Preview;
end;

procedure Tmf_employee_frm.btn_queryClick(Sender: TObject);
begin
    procedures.grd_setup(grd_mf_employee);
    query := ' select ifnull((employee.id),0) as emp_id1' +
             ', ifnull(concat(lname,", ",fname," ",mi),"NA") as name' +
             ', ifnull((employee.gender), "NA") as gender1 ' +
             ', ifnull((employee.birthdate), "NA") as birthdate1 ' +
             ', ifnull((employee.tel_home), "NONE") as contactno1  ' +
             ', ifnull((employee.eadd), "NONE") as email1 ' +
             ', ifnull((select description from attributes where attributes.id = employee.position), "NA") as position1  ' +
             '  from employee left join attributes on employee.position = attributes.id ';

    qwhere := 'where 1 = 1';
    qorder := ' order by lname asc ';

        if edt_search.text <> '' then
            qwhere := qwhere + ' and employee.lname like ' + quotedstr('%'+trim(edt_search.Text)+'%');

  //      if cmb_position.ItemIndex <> 0 then
//            qwhere := qwhere + ' and employee.position = ' + quotedstr(inttostr(longint(cmb_position.Items.Objects[cmb_position.ItemIndex])));

        sql := query + qwhere + qorder;
        procedures.select_func;

        grd_mf_employee.clearnormalcells;
        grd_mf_employee.rowcount := 2;
        grd_mf_employee.floatingfooter.visible := false;

        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        id :=DM.qselect1.FieldValues['emp_id1'];

                        grd_mf_employee.objects[0,grd_mf_employee.rowcount-1] := pointer(id);

                        grd_mf_employee.cells[1,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['name'];
                        grd_mf_employee.cells[2,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['gender1'];
                        grd_mf_employee.cells[3,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['birthdate1'];
                        grd_mf_employee.cells[4,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['contactno1'];
                        grd_mf_employee.cells[5,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['email1'];
                        grd_mf_employee.cells[6,grd_mf_employee.rowcount-1]  := DM.qselect1.fieldvalues['position1'];

                        grd_mf_employee.addrow;
                        DM.qselect1.Next;
                end;
                grd_mf_employee.floatingfooter.visible := true;
                grd_mf_employee.cells[1,grd_mf_employee.rowcount-1]  := 'Total Employees: ' + inttostr(DM.qselect1.RecordCount);
        end;
end;

procedure Tmf_employee_frm.btn_saveClick(Sender: TObject);
begin
      emp_id := 0;
      frm_employee_details.show;
end;

procedure Tmf_employee_frm.cmb_genderClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_employee_frm.cmb_positionClick(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_employee_frm.edt_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
          grd_mf_employee.SetFocus;
end;

procedure Tmf_employee_frm.FormActivate(Sender: TObject);
begin

    cmb_pop(cmb_position,'id, description','doh','attributes','type="position"');
    btn_query.Click;
end;

procedure Tmf_employee_frm.grd_mf_employeeClick(Sender: TObject);
begin
       emp_id := integer(grd_mf_employee.objects[0,grd_mf_employee.row]);
end;

procedure Tmf_employee_frm.grd_mf_employeeDblClick(Sender: TObject);
begin
      if frm_settings.rd_strict.Checked  = true then
      begin
        confirmed := 17;
        confirmation_frm.ShowModal;
      end
      else
      begin
        frm_employee_details.btn_delete.Enabled  := false;
        frm_employee_details.ShowModal;
        btn_query.Click;
      end;

end;



end.
