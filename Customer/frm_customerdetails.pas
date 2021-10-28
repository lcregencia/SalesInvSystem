unit frm_customerdetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, AdvPanel, ExtCtrls, RzPanel,
  RzCmboBx, ComCtrls, RzDTP, RzButton, ActnList, System.Actions;

type
  Tfrm_customer_details = class(TForm)
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
    edt_id: TRzEdit;
    edt_lname: TRzEdit;
    edt_fname: TRzEdit;
    edt_address: TRzEdit;
    edt_business_name: TRzEdit;
    edt_tel_number: TRzEdit;
    edt_cel_number: TRzEdit;
    edt_fax_number: TRzEdit;
    dtp_birthdate: TRzDateTimePicker;
    cmb_gender: TRzComboBox;
    cmb_mi: TRzComboBox;
    btn_save: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_cancel: TRzBitBtn;
    btn_query: TRzBitBtn;
    edt_email: TRzEdit;
    RzLabel13: TRzLabel;
    ActionList1: TActionList;
    RzLabel14: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    btn_new: TRzBitBtn;
    esc: TAction;
    refresh: TAction;
    del: TAction;
    new: TAction;
    print: TAction;
    procedure btn_newClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_customer_details: Tfrm_customer_details;

implementation

uses variables, procedures, sql_statement, datamodule, frm_control_settings,
  authentication_frm, Customer_details_report;

{$R *.dfm}

procedure Tfrm_customer_details.btn_cancelClick(Sender: TObject);
begin
 if (edt_lname.Text <> '') or (edt_fname.Text <> '') then
      begin
        if messagedlg('Do you want to stop the process?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
          cust_id := 0;
          btn_delete.Enabled  := false;
          close;
        end
        else
        begin
          edt_lname.SetFocus;
        end;
      end
      else
      begin
      cust_id := 0;
      btn_delete.Enabled  := false;
      close;
      end;
end;

procedure Tfrm_customer_details.btn_deleteClick(Sender: TObject);
begin
      if frm_settings.rd_strict.Checked = true then
      begin
         confirmed  := 16;
         confirmation_frm.ShowModal;
      end
      else
      begin
      sql := ' delete from customer where id = ' + quotedstr(inttostr(cust_id));
      if messagedlg('Are you sure you want to delete this customer?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
      begin
        procedures.exec_func;
        btn_query.Click;
        showmessage('Customer Deleted!');
      end
      else
        edt_lname.SetFocus;
      end;
end;

procedure Tfrm_customer_details.btn_newClick(Sender: TObject);
begin
      if (edt_lname.Text <> '') or (edt_fname.Text <> '') then
      begin
        if messagedlg('Do you want to stop the process?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
           cust_id := 0;
           btn_query.Click;
        end
        else
        begin
          edt_fname.SetFocus;
        end;
      end
      else
      begin
        cust_id := 0;
        btn_query.Click;
      end;
end;

procedure Tfrm_customer_details.btn_printClick(Sender: TObject);
begin
  frm_cust_det_report.qr_cust_det_report.Preview;
end;

procedure Tfrm_customer_details.btn_queryClick(Sender: TObject);
begin
    query := 'select ifnull(id,0) as id, ifnull(fname,"NA") as fname, ifnull(lname,"NA") as lname, ' +
    ' ifnull(mi,"NA") as mi, ifnull(gender,"NA")as gender, birthdate, ifnull(business_name,"NA") as business_name, ' +
    ' ifnull(email,"NA") as email, ifnull(fax_number,"NA") as fax_number, ifnull(address,"NA") as address, ifnull(cel_number,"NA") as cel_number, ' +
    ' ifnull(tel_number,"NA") as tel_number, ifnull(machine_id,"NA") as machine_id from customer';
    qwhere := ' where customer.id = ' + quotedstr(inttostr(cust_id)) ;

    sql := query + qwhere;
    procedures.select_func;
    procedures.populate(frm_customer_details, sql, 'doh', 'customer');
    if cust_id = 0 then
    begin
      generate_id('doh','customer');
      if dm.qselect1.RecordCount = 0 then
      begin
        new_id := 1;
      end else
      begin
        new_id := dm.qselect1.FieldValues['max_id']+1;
      end;
      //btn_query.Click;
      edt_id.Text := formatfloat('000000000',new_id);
    end
    else
    btn_delete.Enabled  := true;
    edt_lname.SetFocus;
end;

procedure Tfrm_customer_details.btn_saveClick(Sender: TObject);
begin

      if cust_id = 0 then
        begin
          if (edt_lname.Text = '') and (edt_fname.Text = '') then
          begin
           showmessage('Enter Last name fields/First name');
           edt_lname.SetFocus;
          end;
          if (edt_lname.Text <> '') and (edt_fname.Text <> '') then
          begin
                if cmb_gender.ItemIndex = 0 then
                begin
                showmessage('Choose Gender');
                end
                else
                begin
                procedures.save(frm_customer_details, 'insert into' , 'doh' , 'customer' , '');
                showmessage('Customer Saved!');
                btn_delete.Enabled  := false;
                close;
                end;
          end;
        end
      else
        begin
          procedures.save(frm_customer_details, 'update' , 'doh' , 'customer', ' where id = ' + quotedstr(inttostr(cust_id)));
          showmessage('Customer Updated!');
          btn_delete.Enabled  := false;
          close;
        end;

end;

procedure Tfrm_customer_details.delExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tfrm_customer_details.escExecute(Sender: TObject);
begin
    btn_cancel.Click;
end;

procedure Tfrm_customer_details.FormActivate(Sender: TObject);
begin
      btn_query.Click;
end;

procedure Tfrm_customer_details.FormCreate(Sender: TObject);
begin
//btn_query.Click;
end;

procedure Tfrm_customer_details.newExecute(Sender: TObject);
begin
    btn_new.Click;
end;

procedure Tfrm_customer_details.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tfrm_customer_details.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
