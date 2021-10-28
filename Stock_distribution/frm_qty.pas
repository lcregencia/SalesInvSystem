unit frm_qty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, RzLabel, Mask, RzEdit, AdvPanel,
  RzPanel, ExtCtrls, ComCtrls, RzDTP, ActnList, System.Actions;

type
  Tdistribution_qty_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    RzPanel1: TRzPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    edt_quantity: TRzNumericEdit;
    RzLabel1: TRzLabel;
    lbl_inventory_id: TRzLabel;
    RzLabel3: TRzLabel;
    cmb_unit_id: TRzComboBox;
    btn_cancel: TRzBitBtn;
    btn_ok: TRzBitBtn;
    RzLabel4: TRzLabel;
    btn_query: TRzBitBtn;
    ActionList1: TActionList;
    lbl_generic: TRzLabel;
    lbl_brand: TRzLabel;
    lbl_type_id: TRzLabel;
    lbl_category: TRzLabel;
    cmb_trans_code: TRzComboBox;
    lbl_inventory_value: TRzLabel;
    lbl_transaction_value: TRzLabel;
    Esc: TAction;
    cmb_trans_code_from: TRzComboBox;
    RzLabel5: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    RzLabel6: TRzLabel;
    lbl_barcode: TRzLabel;
    RzLabel2: TRzLabel;
    lbl_distribution_id: TRzLabel;
    edt_stocks_re: TRzEdit;
    RzLabel7: TRzLabel;
    edt_sr: TRzEdit;
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure btn_okKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_quantityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_quantityChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  distribution_qty_frm: Tdistribution_qty_frm;

implementation

uses procedures, variables, datamodule, Details_distribution;

{$R *.dfm}

procedure Tdistribution_qty_frm.btn_cancelClick(Sender: TObject);
begin
  qqty  := 0;
  close;
end;

procedure Tdistribution_qty_frm.btn_okClick(Sender: TObject);
var qty, r_qty: integer;
begin
qty := strtoint(edt_quantity.Text);
r_qty := strtoint(edt_stocks_re.Text);
if(qty > r_qty) then
begin
      showmessage('Not enough stocks');
      edt_quantity.SetFocus;
end else
begin
  if frm_distribution_details.cmb_from.ItemIndex = 0  then
        begin
                showmessage('Select Source.. ');
                frm_distribution_details.cmb_from.SetFocus;
        end
        else if frm_distribution_details.cmb_to.ItemIndex = 0 then
        begin
                showmessage('Select Destination.. ');
                frm_distribution_details.cmb_to.SetFocus;
        end
  else          //else if ok proceed distribtution
      begin
          query := ' insert into transaction set transaction_id ='         + quotedstr(inttostr(dis_id)) +
            ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
            ', branch_id  = '                                            + quotedstr(inttostr(LongInt(frm_distribution_details.cmb_from.Items.Objects[frm_distribution_details.cmb_from.ItemIndex]))) +
            ', trans_code = '                                            + quotedstr(inttostr(LongInt(cmb_trans_code_from.Items.Objects[cmb_trans_code_from.ItemIndex]))) +
            ', generic = '                                               + quotedstr(lbl_generic.Caption) +
            ', brand  = '                                                + quotedstr(lbl_brand.Caption) +
            ', status_id  = '                                            +quotedstr(inttostr(LongInt(frm_distribution_details.cmb_status.Items.Objects[frm_distribution_details.cmb_status.ItemIndex])))+
            ', type_id = '                                               + quotedstr(lbl_type_id.Caption) +
            ', category = '                                              + quotedstr(lbl_category.Caption) +
            ', inventory_value = '                                       + quotedstr(inttostr(-1)) +
            ', transaction_value  = '                                    + quotedstr(inttostr(0))  +
            ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
            ', quantity   = '                                            + quotedstr(edt_quantity.Text) +
            ', machine_id = ' + quotedstr(result) +
            ', encode_id = ' + inttostr(encoder)+
            ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

        sql := query ;
        procedures.exec_func;

    //destination
        query := ' insert into transaction set transaction_id ='         + quotedstr(inttostr(dis_id)) +
            ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
            ', branch_id  = '                                            + quotedstr(inttostr(LongInt(frm_distribution_details.cmb_to.Items.Objects[frm_distribution_details.cmb_to.ItemIndex]))) +
            ', trans_code = '                                            + quotedstr(inttostr(LongInt(cmb_trans_code.Items.Objects[cmb_trans_code.ItemIndex]))) +
            ', generic = '                                               + quotedstr(lbl_generic.Caption) +
            ', brand  = '                                                + quotedstr(lbl_brand.Caption) +
            ', status_id  = '                                           +quotedstr(inttostr(LongInt(frm_distribution_details.cmb_status.Items.Objects[frm_distribution_details.cmb_status.ItemIndex])))+
            ', type_id = '                                               + quotedstr(lbl_type_id.Caption) +
            ', category = '                                              + quotedstr(lbl_category.Caption) +
           ', inventory_value = '                                        + quotedstr(lbl_inventory_value.Caption) +
            ', transaction_value  = '                                    + quotedstr(lbl_transaction_value.Caption)  +
            ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
            ', quantity   = '                                            + quotedstr(edt_quantity.Text) +
            ', machine_id = ' + quotedstr(result) +
            ', encode_id = ' + inttostr(encoder)+
            ', encode_date = '                                           + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

        sql := query ;
        procedures.exec_func;
    //////////////////////////////////////////////////distribution_order table/////////////////////////////////////////////
        query := ' insert into distribution_order set distribution_id ='         + quotedstr(inttostr(dis_id)) +
            ', inventory_id = '                                          + quotedstr(inttostr(distribute_id)) +
            ', from_branch ='                                            + quotedstr(inttostr(LongInt(frm_distribution_details.cmb_from.Items.Objects[frm_distribution_details.cmb_from.ItemIndex]))) +
            ', to_branch ='                                              + quotedstr(inttostr(LongInt(frm_distribution_details.cmb_to.Items.Objects[frm_distribution_details.cmb_to.ItemIndex]))) +
            ', inventory_value = '                                       + quotedstr(inttostr(-1)) +
            ', transaction_value  = '                                    + quotedstr(inttostr(0))  +
            ', unit_id    = '                                            + quotedstr(inttostr(LongInt(cmb_unit_id.Items.Objects[cmb_unit_id.ItemIndex]))) +
            ', quantity   = '                                            + quotedstr(edt_quantity.Text) +
            ', machine_id = ' + quotedstr(result) +
            ', encode_id = ' + inttostr(encoder)+
            ', encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now)));

        sql := query ;
        procedures.exec_func;


        showmessage('Stocks Added from Distribution List');
        frm_distribution_details.btn_item.Click;
        close;
      end;

 end;

end;

procedure Tdistribution_qty_frm.btn_okKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      if key = vk_return then
  begin
      btn_ok.Click;
  end;
end;

procedure Tdistribution_qty_frm.btn_queryClick(Sender: TObject);
begin

     query := 'select id,unit_id, inventory_id, trans_code, batch_id, quantity, branch_id, supplier_id, status_id' +
           ', expiration_date, transaction_value, inventory_value, brand, category, generic, type_id from transaction';
     qwhere := ' where id = ' + quotedstr(inttostr(distribute_id));

   sql := query + qwhere;
   //showmessage(inttostr(distribute_id));
   procedures.select_func;

  cmb_trans_code.ItemIndex        := cmb_trans_code.Items.IndexOf('DD');
  cmb_trans_code_from.ItemIndex   := cmb_trans_code.Items.IndexOf('DI');

  query :=  'select id ,barcode,brand,category, generic, type, ifnull((select transaction_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('DD'))) +
           '), " ") as transaction_value, ifnull((select inventory_value from transaction_code where id=' + quotedstr(inttostr(cmb_trans_code.Items.IndexOf('DD'))) +
           '), " ") as inventory_value from inventory';

  sql := query + qwhere;
  procedures.select_func;

  lbl_barcode.Caption         := formatfloat('000000000',dm.qselect1.FieldValues['barcode']);
  lbl_inventory_id.Caption    :=   formatfloat('000000000',distribute_id);
  lbl_brand.Caption           :=  dm.qselect1.FieldValues['brand'];
  lbl_category.Caption        :=  dm.qselect1.FieldValues['category'];
  lbl_generic.Caption         :=  dm.qselect1.FieldValues['generic'];
  lbl_type_id.Caption         :=  dm.qselect1.FieldValues['type'];
  lbl_inventory_value.Caption :=  dm.qselect1.FieldValues['inventory_value'];
  lbl_transaction_value.Caption := dm.qselect1.FieldValues['transaction_value'];

  edt_quantity.Text := '0';

end;
procedure Tdistribution_qty_frm.edt_quantityChange(Sender: TObject);
begin

  if edt_quantity.Text = '' then
  begin
    edt_quantity.Text := '0' ;
  end;

  current_qty           := strtoint(edt_quantity.Text);
  running_qty           :=  qqty - current_qty ;
  edt_sr.Text    :=  inttostr(running_qty);

end;

procedure Tdistribution_qty_frm.edt_quantityKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    btn_ok.Click;
  end;
end;

procedure Tdistribution_qty_frm.EscExecute(Sender: TObject);
begin
  close;
end;

procedure Tdistribution_qty_frm.FormActivate(Sender: TObject);
begin
  cmb_pop(cmb_unit_id, 'id, description', 'doh','attributes','type= "unit"');
  cmb_pop(cmb_trans_code,'id, code','doh','transaction_code','1=1');
  cmb_pop(cmb_trans_code_from,'id, code','doh','transaction_code','1=1');
  edt_quantity.BlankValue := 1;
  edt_quantity.SetFocus;
  cmb_unit_id.ItemIndex := 1;
//  showmessage(inttostr(qqty));
  btn_query.Click;
  edt_stocks_re.Text  := inttostr(qqty);
end;


end.
