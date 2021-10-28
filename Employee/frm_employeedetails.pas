unit frm_employeedetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, ComCtrls, RzDTP, Mask, RzEdit, RzLabel,
  AdvPanel, ExtCtrls, RzPanel, ActnList, System.Actions;

type
  Tfrm_employee_details = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    edt_lname: TRzEdit;
    edt_address: TRzEdit;
    edt_tel_home: TRzEdit;
    edt_eadd: TRzEdit;
    dtp_birthdate: TRzDateTimePicker;
    edt_fname: TRzEdit;
    edt_tel_alt: TRzEdit;
    edt_sss_num: TRzEdit;
    cmb_gender: TRzComboBox;
    edt_id: TRzEdit;
    edt_work_loc: TRzEdit;
    edt_tel_work: TRzEdit;
    cmb_position: TRzComboBox;
    edt_work_eadd: TRzEdit;
    edt_tel_workcel: TRzEdit;
    btn_save: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_query: TRzBitBtn;
    cmb_mi: TRzComboBox;
    RzLabel14: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel22: TRzLabel;
    btn_title_att: TRzBitBtn;
    edt_password: TRzMaskEdit;
    edt_confirmation: TRzMaskEdit;
    btn_close1: TRzBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    procedure btn_newClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_title_attClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure btn_close1Click(Sender: TObject);
    procedure CloseExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_employee_details: Tfrm_employee_details;

implementation

uses procedures, sql_statement, variables, datamodule, frm_addattribute,
  authentication_frm, frm_control_settings, employee_masterfile,
  Employee_details_report;

{$R *.dfm}

procedure Tfrm_employee_details.Action1Execute(Sender: TObject);
begin
  btn_close1.Click;
end;

procedure Tfrm_employee_details.btn_close1Click(Sender: TObject);
begin
    if (edt_lname.Text = '') and (edt_fname.Text = '') then
    begin
        emp_id := 0;
        edt_confirmation.Clear;
        btn_delete.Enabled  := false;
        close;
    end
    else
    begin
       if messagedlg('Do you want to quit?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
          emp_id := 0;
          edt_confirmation.Clear;
          btn_delete.Enabled  := false;
          close;
        end
        else
        begin
          edt_lname.SetFocus;
        end;
    end;
end;

procedure Tfrm_employee_details.btn_deleteClick(Sender: TObject);
begin
      if frm_settings.rd_strict.Checked  = true then
      begin
          confirmed  := 15;
          confirmation_frm.ShowModal;
      end else
      begin
      sql := ' delete from employee where id = ' + quotedstr(inttostr(emp_id));
      if messagedlg('Are you sure you want to delete this employee?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
        //showmessage(sql);
        procedures.exec_func;
        btn_query.Click;
        mf_employee_frm.btn_query.Click;
        close;
        showmessage('Employee Deleted!');
      end;
      end;
end;

procedure Tfrm_employee_details.btn_newClick(Sender: TObject);
begin
      emp_id := 0;
      btn_query.Click;
end;

procedure Tfrm_employee_details.btn_printClick(Sender: TObject);
begin
      frm_emp_details_report.qr_emp_details_report.Preview;
end;

procedure Tfrm_employee_details.btn_queryClick(Sender: TObject);
begin
    query := 'select ifnull(id,0) as id,ifnull(fname,"NA") as fname,ifnull(lname,"NA") as lname,' +
    ' ifnull(mi,"NA") as mi, ifnull(password,"NA") as password, ifnull(address,"NA") address,ifnull(position,0) as position, '+
    ' ifnull((select description from attributes where attributes.id = employee.position),0) as position1, '+
    ' ifnull(tel_home, "NA") as tel_home, ifnull(tel_alt,"NA") as tel_alt, ifnull(eadd,"NA") as eadd, ifnull(gender,"NA") as gender, ' +
    ' ifnull(title,"NA") as title, ifnull(work_loc,"NA") as work_loc, ifnull(work_eadd,"NA") as work_eadd,' +
    ' ifnull(tel_work,"NA") as tel_work, ifnull(tel_workcel,"NA") as tel_workcel, birthdate  from employee';
    qwhere := ' where employee.id = ' + quotedstr(inttostr(emp_id)) ;

    sql := query + qwhere;
    procedures.select_func;
    procedures.populate(frm_employee_details, sql, 'doh', 'employee');
    cmb_position.ItemIndex :=  cmb_position.Items.IndexOfObject(TObject(DM.qselect1.FieldByName('position').AsInteger));
//    edt_confirmation.Text := dm.qselect1.FieldValues['password'];
end;

procedure Tfrm_employee_details.btn_saveClick(Sender: TObject);
begin
     if emp_id = 0 then
        begin
          if (edt_fname.Text = '') and (edt_lname.Text <> '') then
              begin
                showmessage('Input First Name..');
                edt_fname.SetFocus;
              end
          else if (edt_fname.Text <> '') and (edt_lname.Text = '') then
               begin
                showmessage('Input Last Name..');
                edt_lname.SetFocus;
               end
          else if (edt_fname.Text = '') and (edt_lname.Text = '') then
               begin
                showmessage('Input fields..');
                edt_lname.SetFocus;
               end
          else if (edt_fname.Text <> '') and (edt_lname.Text <> '') then
              begin
                if cmb_gender.ItemIndex = 0 then
                  begin
                    showmessage('Select Gender');
                    cmb_gender.SetFocus;
                  end
                else if cmb_position.ItemIndex = 0 then
                  begin
                     showmessage('Select Position');
                     cmb_position.SetFocus;
                  end
                else if cmb_position.ItemIndex <> 0 then
                  begin
                     if edt_password.Text = '' then
                      begin
                         showmessage('Enter Password');
                         edt_password.SetFocus;
                      end
                      else if edt_password.Text <> '' then
                      begin
                        if edt_password.Text <> edt_confirmation.Text then
                          begin
                              showmessage('Invalid Confirmation Password');
                              edt_password.SetFocus;
                          end
                        else
                          begin
                              procedures.save(frm_employee_details, 'insert into' , 'doh' , 'employee' , '');
                              query := ' update employee set position = ' +quotedstr(inttostr(LongInt(cmb_position.Items.Objects[cmb_position.ItemIndex]))) ;
                              qwhere := ' where id = ' + quotedstr(inttostr(emp_id)) ;

                              sql := query + qwhere ;
                              procedures.exec_func;
                              btn_query.Click;
                              mf_employee_frm.btn_query.Click;
                              edt_confirmation.Clear;
                              showmessage('Employee Saved!');
                              btn_delete.Enabled  := false;
                              close;
                          end;      //end else
                      end;  //end begin if password
                  end     // if cmb_position
          end;   //else if edt_fname and edt_lname <> ''
        end
      else
        begin
          if (edt_fname.Text = '') and (edt_lname.Text <> '') then
              begin
                showmessage('Input First Name..');
                edt_fname.SetFocus;
              end
          else if (edt_fname.Text <> '') and (edt_lname.Text = '') then
               begin
                showmessage('Input Last Name..');
                edt_lname.SetFocus;
               end
          else if (edt_fname.Text = '') and (edt_lname.Text = '') then
               begin
                showmessage('Input fields..');
                edt_lname.SetFocus;
               end
          else if (edt_fname.Text <> '') and (edt_lname.Text <> '') then
              begin
                if cmb_gender.ItemIndex = 0 then
                  begin
                    showmessage('Select Gender');
                    cmb_gender.SetFocus;
                  end
                else if cmb_position.ItemIndex = 0 then
                  begin
                     showmessage('Select Position');
                     cmb_position.SetFocus;
                  end
                else if cmb_position.ItemIndex <> 0 then
                  begin
                     if edt_password.Text = '' then
                      begin
                         showmessage('Enter Password');
                         edt_password.SetFocus;
                      end
                      else if edt_password.Text <> '' then
                      begin
                        if edt_password.Text <> edt_confirmation.Text then
                          begin
                              showmessage('Invalid Confirmation Password');
                              edt_password.SetFocus;
                          end
                        else
                          begin
                              procedures.save(frm_employee_details, 'update' , 'doh' , 'employee', ' where id = ' + quotedstr(inttostr(emp_id)));
                              query := ' update employee set position = ' +quotedstr(inttostr(LongInt(cmb_position.Items.Objects[cmb_position.ItemIndex]))) ;
                              qwhere := ' where id = ' + quotedstr(inttostr(emp_id)) ;
                              sql := query + qwhere ;
                              procedures.exec_func;
                              btn_query.Click;
                              mf_employee_frm.btn_query.Click;
                              showmessage('Employee Updated!');
                              btn_delete.Enabled  := false;
                              close;
                          end;      //end else
                      end;  //end begin if password
                  end     // if cmb_position
          end;   //else if edt_fname and edt_lname <> ''
        end;

end;

procedure Tfrm_employee_details.btn_title_attClick(Sender: TObject);
begin
    type_temp := 'position';
    frm_addatt.ShowModal;
    cmb_pop(cmb_position,'id, description','doh','attributes','type= "position"');
end;

procedure Tfrm_employee_details.CloseExecute(Sender: TObject);
begin
  btn_close1.Click;
end;

procedure Tfrm_employee_details.FormActivate(Sender: TObject);
begin
      cmb_pop(cmb_position,'id, description','doh','attributes','type= "position"');
      btn_query.Click;
      //generate new ID
      if emp_id = 0 then
      begin
          generate_id('doh','employee');
      if dm.qselect1.RecordCount = 0 then
      begin
          new_id := 1;
      end else
      begin
          new_id := dm.qselect1.FieldValues['max_id']+1;
      end;
      edt_id.Text := formatfloat('000000000',new_id);
    end
    else
    btn_delete.Enabled  := true;
    edt_lname.SetFocus;
end;

end.
