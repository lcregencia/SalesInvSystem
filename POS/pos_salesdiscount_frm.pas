unit pos_salesdiscount_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, AdvPanel, ExtCtrls,
  RzCmboBx, RzRadChk, ActnList;

type
  Tpos_sales_discount_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    btn_ok: TRzButton;
    btn_close: TRzButton;
    RzLabel1: TRzLabel;
    btn_aisdq: TRzButton;
    btn_all_items: TRzButton;
    nedt_discount: TRzNumericEdit;
    RzLabel4: TRzLabel;
    btn_sc_discount: TRzButton;
    chk_discount_sc: TRzRadioButton;
    chk_all_items_same_description: TRzRadioButton;
    chk_all_items: TRzRadioButton;
    ActionList1: TActionList;
    SeniorCitizen: TAction;
    AllItemswthSameDescription: TAction;
    AllItems: TAction;
    Exit: TAction;
    procedure btn_okClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_aisdqClick(Sender: TObject);
    procedure chk_all_items_same_description1Click(Sender: TObject);
    procedure btn_all_itemsClick(Sender: TObject);
    procedure chk_all_items1Click(Sender: TObject);
    procedure btn_change_discountClick(Sender: TObject);
    procedure btn_sc_discountClick(Sender: TObject);
    procedure chk_discount_sc1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chk_discount_scClick(Sender: TObject);
    procedure chk_all_items_same_descriptionClick(Sender: TObject);
    procedure chk_all_itemsClick(Sender: TObject);
    procedure SeniorCitizenExecute(Sender: TObject);
    procedure AllItemswthSameDescriptionExecute(Sender: TObject);
    procedure AllItemsExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pos_sales_discount_frm: Tpos_sales_discount_frm;

implementation

uses procedures, sql_statement, variables, sales_frm,
  datamodule;

{$R *.dfm}

procedure Tpos_sales_discount_frm.AllItemsExecute(Sender: TObject);
begin
  chk_all_items.Checked := true;
  nedt_discount.SetFocus;
end;

procedure Tpos_sales_discount_frm.AllItemswthSameDescriptionExecute(
  Sender: TObject);
begin
  chk_all_items_same_description.Checked  := true;
  nedt_discount.SetFocus;
end;

procedure Tpos_sales_discount_frm.btn_aisdqClick(Sender: TObject);
begin
    if chk_all_items_same_description.Checked = true then
    begin
        discount_value := 1;
    end
    else
    begin
        discount_value := 0;
    end;

end;

procedure Tpos_sales_discount_frm.btn_all_itemsClick(Sender: TObject);
begin
    if chk_all_items.Checked = true then
    begin
       discount_value := 2;
    end
    else
    begin
       discount_value := 0;
    end;

end;

procedure Tpos_sales_discount_frm.btn_change_discountClick(Sender: TObject);
begin
    //sales_discount_settings.ShowModal;
end;

procedure Tpos_sales_discount_frm.chk_all_items1Click(Sender: TObject);
begin
      btn_all_items.Click;
end;

procedure Tpos_sales_discount_frm.chk_all_items_same_description1Click(
  Sender: TObject);
begin
    btn_aisdq.Click;
end;

procedure Tpos_sales_discount_frm.chk_discount_sc1Click(Sender: TObject);
begin
      btn_sc_discount.Click;
end;

procedure Tpos_sales_discount_frm.chk_discount_scClick(Sender: TObject);
begin
        btn_sc_discount.Click;
end;

procedure Tpos_sales_discount_frm.ExitExecute(Sender: TObject);
begin
  btn_close.Click;
end;

procedure Tpos_sales_discount_frm.FormActivate(Sender: TObject);
begin
      nedt_discount.Text := '0';
      nedt_discount.SetFocus;
end;

procedure Tpos_sales_discount_frm.btn_okClick(Sender: TObject);
begin
     if discount_value = 0 then
     begin
        query := ' update transaction set discount = ' +quotedstr(nedt_discount.Text);
        qwhere := ' where id = ' +inttostr(discount_item) + ' and transaction_id = ' + quotedstr(inttostr(sales_trans_id));
        sql := query + qwhere;
        procedures.exec_func;
        btn_close.Click;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.edt_qty.SetFocus;


     end;

     if discount_value = 1 then
     begin
        query := ' update transaction set discount = ' +quotedstr(nedt_discount.Text);
        qwhere := ' where inventory_id = ' + quotedstr(inttostr(sales_stock_id)) + ' and transaction_id = ' + quotedstr(inttostr(sales_trans_id));
        sql := query + qwhere;
        procedures.exec_func;
        btn_close.Click;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.grd_trans.SetFocus;


     end;

     if discount_value = 2 then
     begin
        query := ' update transaction set discount = ' +quotedstr(nedt_discount.Text);
        qwhere := ' where transaction_id = ' + quotedstr(inttostr(sales_trans_id));
        sql := query + qwhere;
        procedures.exec_func;
        btn_close.Click;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.grd_trans.SetFocus;




     end;
end;

procedure Tpos_sales_discount_frm.btn_closeClick(Sender: TObject);
begin
    close;
end;

procedure Tpos_sales_discount_frm.SeniorCitizenExecute(Sender: TObject);
begin
  chk_discount_sc.Checked := true;
  nedt_discount.SetFocus;
end;

procedure Tpos_sales_discount_frm.chk_all_items_same_descriptionClick(Sender: TObject);
begin
  btn_aisdq.Click;
end;

procedure Tpos_sales_discount_frm.chk_all_itemsClick(Sender: TObject);
begin
   btn_all_items.Click;
end;

procedure Tpos_sales_discount_frm.btn_sc_discountClick(Sender: TObject);
begin
      if chk_discount_sc.checked = true then
      begin
          nedt_discount.Text := '20';
      end
      else
      begin
         nedt_discount.Text := '0';
      end;
end;

end.
