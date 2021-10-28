unit authentication_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, RzLabel,
  ExtCtrls, RzPanel, System.Actions;

type
  Tconfirmation_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    btn_ok: TRzBitBtn;
    btn_close: TRzBitBtn;
    edt_username: TRzEdit;
    edt_password: TRzEdit;
    btn_query: TRzBitBtn;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    esc: TAction;
    refresh: TAction;
    procedure escExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_okKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure refreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  confirmation_frm: Tconfirmation_frm;

implementation

uses variables, procedures, datamodule, stock_in, sales_frm,
  pos_salesdiscount_frm, pos_sales_input_qty_frm, pos_sales_price,
  Details_distribution, frm_control_settings, employee_masterfile,
  customer_masterfile, frm_customerdetails, frm_supplierdetails,
  supplier_masterfile, inventory, inventory_details, frm_employeedetails,
  add_stocks, receiving_report;

{$R *.dfm}

procedure Tconfirmation_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tconfirmation_frm.btn_okClick(Sender: TObject);
begin
    if confirmed = 0 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;
    procedures.select_func;
    //count := dm.qselect.RecordCount;


    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    {while count <> 0 do
    begin
        if dm.qselect1.FieldValues['fname'] = edt_username.Text then
        begin
            if dm.qselect1.FieldValues['password'] = edt_password.Text then
            begin
                confirmed := 1;
                confirmed_employee := dm.qselect1.FieldValues['id'];
                close;
            end;
        end;
    count := count - 1;
    end;           }
    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        sql := 'update transaction set checked_by=' + inttostr(confirmed_employee);
        procedures.exec_func;
        btn_close.Click;
    end;
    end;

    if confirmed = 2 then      //pos_sales_discount form
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        pos_sales_discount_frm.ShowModal;
    end;
    end;

    if confirmed = 3 then                       // pos qty form
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        qty := 1;
        pos_sales_qty_frm.ShowModal;
    end;
    end;

    if confirmed = 4 then              //pos sales price update form
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        pos_sales_price_update_frm.ShowModal;
    end;
    end;

    if confirmed = 5 then                      //pos sale form. cmb_price_level =ENABLED
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        pos_sales_frm.cmb_price_level.Enabled := true;
        pos_sales_frm.cmb_price_level.SetFocus;

    end;
    end;
    if confirmed = 6 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
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
    if confirmed = 7 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        frm_settings.Close;
    end;
    end;

    if confirmed = 8 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;
        sql := ' delete from employee where id = ' + quotedstr(inttostr(emp_id));
          if messagedlg('Are you sure you want to delete this employee?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
          begin
            //showmessage(sql);
            procedures.exec_func;
            mf_employee_frm.btn_query.Click;
            showmessage('Employee Deleted!');
          end;

    end;
    end;

    if confirmed = 9 then      //costumer edit
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        Close;
        frm_customer_details.ShowModal;
        mf_customer_frm.btn_query.Click;
        //mf_customer_frm.grd_mf_customer.SetFocus;
    end;
    end;

    if confirmed = 10 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;

         sql := ' delete from customer where id = ' + quotedstr(inttostr(cust_id));
        if messagedlg('Are you sure you want to delete this customer?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
          procedures.exec_func;
          mf_customer_frm.btn_query.Click;
          showmessage('Customer Deleted!');
        end;
    end;
    end;

    if confirmed = 11 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        Close;
        frm_supplier_details.Show;
        frm_supplier_details.btn_query.Click;
    end;
    end;

    if confirmed = 12 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
          showmessage('Employee Confirmed');
          sql := ' delete from supplier where id = ' + quotedstr(inttostr(supp_id));
          if messagedlg('Are you sure you want to delete this supplier?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
          begin
            procedures.exec_func;
            mf_supplier_frm.btn_query.Click;
            showmessage('Supplier Deleted!');
          end
          else
          mf_supplier_frm.grd_mf_supplier.SetFocus;
    end;
    end;

    if confirmed = 13 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
           showmessage('Employee Confirmed');
           sql := ' delete from inventory where id = ' + quotedstr(inttostr(mf_stock_id));
            if messagedlg('Are you sure you want to delete Stock?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
              procedures.exec_func;
              mf_inventory_frm.btn_query.Click;
              showmessage('Item Deleted!');
              confirmed := 0;
            end
            else
            mf_inventory_frm.grd_mf_inventory.SetFocus;
    end;
    end;

    if confirmed = 14 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
          showmessage('Employee Confirmed');
          close;
          inventory_frm.ShowModal;
          mf_inventory_frm.btn_query.Click;
    end;
    end;

    if confirmed = 15 then     //employee details delete
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        //confirmation_frm.Hide;
        Close;
        sql := ' delete from employee where id = ' + quotedstr(inttostr(emp_id));
          if messagedlg('Are you sure you want to delete this employee?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
          begin
            //showmessage(sql);
            procedures.exec_func;
            mf_employee_frm.btn_query.Click;
            frm_employee_details.Close;
            showmessage('Employee Deleted!');
          end;
         // frm_employee_details.close;

    end;
    end;

    if confirmed = 16 then
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        confirmation_frm.Hide;
        Close;

         sql := ' delete from customer where id = ' + quotedstr(inttostr(cust_id));
        if messagedlg('Are you sure you want to delete this customer?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
          procedures.exec_func;
          mf_customer_frm.btn_query.Click;
          showmessage('Customer Deleted!');
        end;
        frm_customer_details.Close;
    end;
    end;

    if confirmed = 17 then      //employee details edit
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        Close;
        frm_employee_details.ShowModal;
        mf_employee_frm.btn_query.Click;

    end;
    end;

    if confirmed = 18 then      //stock in ok
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        Close;
        showmessage('Stocks Updated');
        inventory_add_frm.btn_query.Click;
        inventory_add_frm.Close;
    end;
    end;

    if confirmed = 19 then      //receiving report confirmed
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        Close;
                showmessage('Items Received');
                purchase_id := 0;

                query := 'update purchase_order set status_id=' + quotedstr(inttostr(longint(receiving_report_frm.cmb_status.Items.Objects[receiving_report_frm.cmb_status.ItemIndex])));
                qwhere := ' where po_id=' + inttostr(rr_id);

                sql := query + qwhere;
                procedures.exec_func;

                receiving_report_frm.btn_close.Click;

    end;
    end;

    if confirmed = 20 then     //inventory_details delete button
    begin
    query := 'select id, fname, password from employee';
    qwhere  := ' where position = 58 ';
    sql := query + qwhere;

    procedures.select_func;

    if DM.qselect1.RecordCount <> 0 then
      begin
          while DM.qselect1.Eof <> true do
          begin
              if edt_username.Text = DM.qselect1.fieldvalues['fname'] then
              begin
                  if edt_password.Text = DM.qselect1.fieldvalues['password'] then
                  begin
                  confirmed := 1;
                  confirmed_employee := dm.qselect1.FieldValues['id'];
                  close;
                  end  else
                  begin
                      showmessage('Password/Username not found');
                  end;
              end;
              DM.qselect1.Next;
          end;
      end else
              begin
                  showmessage('Password/Username not found');
              end;

    if confirmed <> 1 then
    begin
        showmessage('Employee not Recognized');
        edt_username.SetFocus;
    end
    else
    begin
        showmessage('Employee Confirmed');
        close;
         if messagedlg('Do You Want To Delete Item?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
         begin
            if mf_stock_id <> 0 then
            begin
                    query := 'delete from inventory';
                    qwhere := ' where id = ' + quotedstr(inttostr(mf_stock_id));
                    sql := query + qwhere;

                    procedures.exec_func;
                    showmessage('Item Deleted');
                    inventory_frm.Close;
                    mf_inventory_frm.btn_query.Click;
            end else
            showmessage('No Item Found');
         end
         else
         inventory_frm.edt_barcode.SetFocus;

    end;
    end;

end;

procedure Tconfirmation_frm.btn_okKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = vk_return then
        btn_ok.Click;
end;

procedure Tconfirmation_frm.btn_queryClick(Sender: TObject);
begin
    sql := 'select fname, password from employee';
    procedures.select_func;
    edt_username.SetFocus;
end;

procedure Tconfirmation_frm.escExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tconfirmation_frm.FormActivate(Sender: TObject);
begin
    edt_username.Clear;
    edt_password.Clear;
    btn_query.Click;
    edt_username.SetFocus;
end;

procedure Tconfirmation_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
