unit customer_masterfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, StdCtrls, Mask, RzEdit, RzButton, Grids, AdvObj,
  BaseGrid, AdvGrid, RzCmboBx, RzSplit, RzLabel, ExtCtrls, RzPanel,
  System.Actions;

type
  Tmf_customer_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    btn_query: TRzBitBtn;
    ActionList1: TActionList;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvPanel2: TAdvPanel;
    grd_mf_customer: TAdvStringGrid;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    btn_add: TRzBitBtn;
    btn_edit: TRzBitBtn;
    btn_delete: TRzBitBtn;
    btn_print: TRzBitBtn;
    btn_ok: TRzBitBtn;
    esc: TAction;
    add: TAction;
    search: TAction;
    refresh: TAction;
    delete: TAction;
    print: TAction;
    edt_search: TRzEdit;
    btn_close: TRzBitBtn;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grd_mf_customerClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure grd_mf_customerDblClick(Sender: TObject);
    procedure escExecute(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure searchExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure deleteExecute(Sender: TObject);
    procedure printExecute(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure grd_mf_customerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_searchChange(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mf_customer_frm: Tmf_customer_frm;

implementation

uses datamodule, procedures, sql_statement, variables, frm_customerdetails,
  authentication_frm, sales_frm, frm_control_settings, Customer_report;

{$R *.dfm}

procedure Tmf_customer_frm.addExecute(Sender: TObject);
begin
    btn_add.Click;
end;

procedure Tmf_customer_frm.btn_addClick(Sender: TObject);
begin
    cust_id := 0;
    frm_customer_details.ShowModal;
    btn_query.Click;
end;

procedure Tmf_customer_frm.btn_closeClick(Sender: TObject);
begin
  cust_id := 0;
  edt_search.Clear;
  close;
end;

procedure Tmf_customer_frm.btn_deleteClick(Sender: TObject);
begin
    if frm_settings.rd_strict.Checked = true then
    begin
       confirmed  := 10;
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
        grd_mf_customer.SetFocus;
    end;
end;

procedure Tmf_customer_frm.btn_editClick(Sender: TObject);
begin
   if frm_settings.rd_strict.Checked = true then
    begin
      confirmed := 9;
      confirmation_frm.ShowModal;
      end
      else
      begin
      frm_customer_details.btn_delete.Enabled := true;
      frm_customer_details.ShowModal;
      btn_query.Click;
      //grd_mf_customer.SetFocus;
    end;
end;

procedure Tmf_customer_frm.btn_okClick(Sender: TObject);
begin
    if cust_tag = 0 then
    begin
        btn_edit.Click;
    end;

    if cust_tag = 1 then
    begin
         sql :=  'select * from transaction where transaction_id='  + quotedstr(inttostr(sales_trans_id));
         //showmessage(sql);
         procedures.select_func;

         if DM.qselect1.RecordCount = 0 then
         begin
                        sales_cus_id := integer(grd_mf_customer.objects[0,grd_mf_customer.row]);
                        query :=  'select id, concat(lname,", ",fname," ",mi,".") as name' +
                                  ', ifnull(address,"NA") as address' +
                                  ', ifnull(tel_number,0) as tel_number from customer';

                        qwhere := ' where id =' + quotedstr(inttostr(sales_cus_id)) ;
                        sql := query+qwhere;
                        procedures.select_func;

                        sql  := ' insert into transaction set transaction_id =' + quotedstr(inttostr(sales_trans_id)) +
                                ', customer_id =' + quotedstr(inttostr(sales_cus_id));

                        //showmessage(sql);
                        procedures.exec_func;

                        close;
                        pos_sales_frm.btn_cus_query.Click;
                        pos_sales_frm.split_trans.RestoreHotSpot;
                        pos_sales_frm.grd_trans.SetFocus;
          end
          else
          begin
                        sales_cus_id := integer(grd_mf_customer.objects[0,grd_mf_customer.row]);
                        query := 'select id, concat(lname,", ",fname," ",mi,".") as name' +
                                 ', ifnull(address,"NA") as address' +
                                 ', ifnull(tel_number,0) as tel_number from customer';

                        qwhere := ' where id = ' + quotedstr(inttostr(sales_cus_id)) ;
                        sql := query + qwhere;
                        procedures.select_func;

                        query  := 'update transaction set customer_id =' +quotedstr(inttostr(sales_cus_id));
                        qwhere := ' where transaction_id =' + quotedstr(inttostr(sales_trans_id));
                        sql    :=  query + qwhere ;
                        //showmessage(sql);
                        procedures.exec_func;

                        close;
                        pos_sales_frm.btn_cus_query.Click;
                        pos_sales_frm.split_trans.RestoreHotSpot;
                        pos_sales_frm.grd_trans.SetFocus;
          end;
    end;


end;

procedure Tmf_customer_frm.btn_printClick(Sender: TObject);
begin
      frm_customer_report.qr_customer_report.Preview;
end;

procedure Tmf_customer_frm.btn_queryClick(Sender: TObject);
begin
    procedures.grd_setup(grd_mf_customer);

    query := 'select id, ifnull(concat(lname,", ",fname," ",mi,"."),"NONE") as name, ifnull(business_name,"NA") as business_name' +
             ', ifnull(email,"NA") as email, ifnull(fax_number,"NA") as fax_number, ifnull(address,"NA") as address' +
             ', ifnull(cel_number, "NA") as cel_number, ifnull(tel_number,"NA") as tel_number from customer';
    qwhere := ' where 1=1';
    qorder := ' order by lname asc';

    if edt_search.text <> '' then
    begin
        qwhere := qwhere + ' and concat(lname," ",fname," ",mi,"") like ' + quotedstr('%'+trim(edt_search.Text)+'%');
    end;

    sql := query + qwhere + qorder;
    procedures.select_func;

    grd_mf_customer.clearnormalcells;
    grd_mf_customer.rowcount := 2;
    grd_mf_customer.floatingfooter.visible := false;

    if DM.qselect1.RecordCount <> 0 then
    begin
        while DM.qselect1.Eof <> true do
        begin
            id :=DM.qselect1.FieldValues['id'];

            grd_mf_customer.objects[0,grd_mf_customer.rowcount-1] := pointer(id);

            grd_mf_customer.cells[1,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['name'];
            grd_mf_customer.cells[2,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['business_name'];
            grd_mf_customer.cells[3,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['email'];
            grd_mf_customer.cells[4,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['fax_number'];
            grd_mf_customer.cells[5,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['address'];
            if dm.qselect1.FieldValues['cel_number'] <> '' then
                grd_mf_customer.cells[6,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['cel_number']
            else
                grd_mf_customer.cells[6,grd_mf_customer.rowcount-1]  := DM.qselect1.fieldvalues['tel_number'];

            grd_mf_customer.addrow;
            DM.qselect1.Next;
        end;
        grd_mf_customer.floatingfooter.visible := true;
        grd_mf_customer.cells[1,grd_mf_customer.rowcount-1]  := 'Total Records:   ' + inttostr(dm.qselect1.RecordCount);
    end;
end;

procedure Tmf_customer_frm.deleteExecute(Sender: TObject);
begin
    btn_delete.Click;
end;

procedure Tmf_customer_frm.edt_searchChange(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_customer_frm.edt_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_return then
        grd_mf_customer.SetFocus;
end;

procedure Tmf_customer_frm.escExecute(Sender: TObject);
begin
    btn_close.Click;
end;

procedure Tmf_customer_frm.FormActivate(Sender: TObject);
begin
    btn_query.Click;
    edt_search.SetFocus;
end;

procedure Tmf_customer_frm.grd_mf_customerClick(Sender: TObject);
begin
    cust_id := integer(grd_mf_customer.objects[0,grd_mf_customer.row]);
end;

procedure Tmf_customer_frm.grd_mf_customerDblClick(Sender: TObject);
begin
    btn_ok.Click;
end;

procedure Tmf_customer_frm.grd_mf_customerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
        btn_ok.Click;
end;

procedure Tmf_customer_frm.printExecute(Sender: TObject);
begin
    btn_print.Click;
end;

procedure Tmf_customer_frm.refreshExecute(Sender: TObject);
begin
    btn_query.Click;
end;

procedure Tmf_customer_frm.searchExecute(Sender: TObject);
begin
    edt_search.SetFocus;
end;

end.
