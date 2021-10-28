unit frm_supplierdetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, RzButton, StdCtrls, Mask, RzEdit, RzLabel, AdvPanel,
  ExtCtrls, RzPanel, RzCmboBx, System.Actions;

type
  Tfrm_supplier_details = class(TForm)
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
    edt_id: TRzEdit;
    edt_name: TRzEdit;
    edt_address: TRzEdit;
    edt_phone_number: TRzEdit;
    edt_city: TRzEdit;
    edt_fax_number: TRzEdit;
    edt_email: TRzEdit;
    RzLabel9: TRzLabel;
    edt_company_name: TRzEdit;
    btn_save: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_Cancel: TRzBitBtn;
    ActionList1: TActionList;
    btn_print: TRzBitBtn;
    RzLabel10: TRzLabel;
    btn_query: TRzBitBtn;
    cmb_title: TRzComboBox;
    btn_new: TRzBitBtn;
    Esc: TAction;
    delete: TAction;
    print: TAction;
    btn_position_att: TRzBitBtn;
    RzLabel13: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel17: TRzLabel;
    new: TAction;
    refresh: TAction;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_newClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure btn_saveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure printExecute(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_position_attClick(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure newExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_supplier_details: Tfrm_supplier_details;
  supp_id: integer;

implementation

uses procedures, sql_statement, variables, frm_addattribute, datamodule,
  authentication_frm, frm_control_settings, supplier_masterfile,
  Supplier_detail_report;

{$R *.dfm}

procedure Tfrm_supplier_details.EscExecute(Sender: TObject);
begin
      btn_cancel.Click;
end;

procedure Tfrm_supplier_details.btn_CancelClick(Sender: TObject);
begin
    if edt_company_name.Text = '' then
    begin
        supp_id := 0;
        btn_delete.Enabled  := false;
        close;
    end
    else
    begin
       if messagedlg('Do you want to quit?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
          supp_id := 0;
          btn_delete.Enabled  := false;
          close;
        end
        else
        begin
          edt_company_name.SetFocus;
        end;
    end;

end;

procedure Tfrm_supplier_details.btn_deleteClick(Sender: TObject);
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
        edt_company_name.SetFocus;
      end;
end;

procedure Tfrm_supplier_details.btn_newClick(Sender: TObject);
begin
    if (edt_company_name.Text <> '') then
      begin
      if messagedlg('Do you want to stop the process?', mtconfirmation, [mbYes, mbNo], 0) <> mrNo then
        begin
           supp_id := 0;
           btn_query.Click;
        end
        else
        begin
          edt_company_name.SetFocus;
        end;
      end
      else
      begin
          supp_id := 0;
          btn_query.Click;
      end;
end;

procedure Tfrm_supplier_details.btn_position_attClick(Sender: TObject);
begin
    type_temp := 'position';
    frm_addatt.ShowModal;
end;

procedure Tfrm_supplier_details.btn_printClick(Sender: TObject);
begin
      frm_supp_det_report.qr_supp_det_report.Preview;
end;

procedure Tfrm_supplier_details.btn_queryClick(Sender: TObject);
begin
    query := 'select ifnull(id,0) as id,ifnull(company_name,"NA") as company_name, ifnull(name,"NA") as name, ' +
    'ifnull(title,0) as title, ifnull(address,"NA") as address, ifnull(city,"NA") as city, ifnull(phone_number,"NA") as phone_number, ' +
    ' ifnull(fax_number,"NA") as fax_number, ifnull(email,"NA") as email, ifnull(machine_id,"NA") as machine_id, ifnull(encode_id,0) as encode_id from supplier ';
    qwhere := ' where supplier.id = ' + quotedstr(inttostr(supp_id)) ;

    sql := query + qwhere;

    procedures.select_func;
    procedures.populate(frm_supplier_details, sql, 'doh', 'supplier');
    if supp_id = 0 then
    begin
      generate_id('doh','supplier');
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
    edt_company_name.SetFocus;
end;

procedure Tfrm_supplier_details.btn_saveClick(Sender: TObject);
begin
      if supp_id = 0 then
        begin
          if edt_company_name.Text = '' then
          begin
              showmessage('Enter Company name');
              edt_company_name.SetFocus;
          end
          else
          begin
            if cmb_title.ItemIndex = 0 then
            begin
              showmessage('Select Title Description');
              cmb_title.SetFocus;
            end
            else
            begin
              procedures.save(frm_supplier_details, 'insert into' , 'doh' , 'supplier' , '');
              showmessage('Supplier Saved!');
              btn_delete.Enabled  := false;
              close;
            end;
          end;         // if edt company.text = ''
        end  // if supp id =0
      else
        begin
          procedures.save(frm_supplier_details, 'update' , 'doh' , 'supplier', ' where id = ' + quotedstr(inttostr(supp_id)));
          showmessage('Supplier Updated!');
          btn_delete.Enabled  := false;
          close;
        end;

end;

procedure Tfrm_supplier_details.btn_saveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        btn_save.Click;
end;

procedure Tfrm_supplier_details.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tfrm_supplier_details.FormActivate(Sender: TObject);
begin

      cmb_pop(cmb_title,'id, description','doh','attributes','type= "position"');
        btn_query.Click;
      if supp_id = 0 then
          btn_new.Click;
end;

procedure Tfrm_supplier_details.newExecute(Sender: TObject);
begin
    btn_new.Click;
end;

procedure Tfrm_supplier_details.printExecute(Sender: TObject);
begin
        btn_print.click;
end;

procedure Tfrm_supplier_details.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

end.
