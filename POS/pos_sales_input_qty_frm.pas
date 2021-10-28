unit pos_sales_input_qty_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel, AdvPanel, Mask, RzEdit,
  RzButton;

type
  Tpos_sales_qty_frm = class(TForm)
    RzLabel1: TRzLabel;
    RzPanel1: TRzPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    btn_ok: TRzButton;
    btn_cancel: TRzButton;
    btn_query: TRzButton;
    edt_quantity: TRzEdit;
    edt_quantity_re: TRzNumericEdit;
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pos_sales_qty_frm: Tpos_sales_qty_frm;

implementation

uses datamodule, inventory, procedures, sales_frm, sql_statement, variables,
  pos_sales_returns_frm;

{$R *.dfm}

procedure Tpos_sales_qty_frm.btn_cancelClick(Sender: TObject);
begin
    close;
end;

procedure Tpos_sales_qty_frm.btn_okClick(Sender: TObject);
begin

        if qqqty = 1 then
        begin
            if edt_quantity.Text = '0' then
            begin
              showmessage('Enter quantity greater than 0');
              edt_quantity.SetFocus;
            end
            else if edt_quantity.Text = '' then
            begin
              showmessage('Enter quantity');
              edt_quantity.SetFocus;
            end
            else if edt_quantity.Text <> '' then
            begin
              if   edt_quantity_re.Text  >  edt_quantity.Text then
              begin
               showmessage('Desired quantity greater than the value');
               edt_quantity.SetFocus;
              end
              else
              btn_query.Click;
            end
            else
                btn_query.Click;
        end
        else
           btn_query.Click;
end;

procedure Tpos_sales_qty_frm.btn_queryClick(Sender: TObject);
begin

        if qty = 1 then
        begin
          query := ' update transaction set quantity = ' +quotedstr(edt_quantity.Text);
          qwhere := ' where id = ' +inttostr(quantity_item) + ' and transaction_id = ' + quotedstr(inttostr(sales_trans_id));
          sql := query + qwhere;
          procedures.exec_func;
          close;
          pos_sales_frm.btn_item_query.Click;
          pos_sales_frm.edt_qty.SetFocus;
          pos_sales_frm.edt_qty.Text := '1';
        end;

        if qty = 2 then
        begin
          close;
        end;



end;

procedure Tpos_sales_qty_frm.FormActivate(Sender: TObject);
begin
    edt_quantity.Text := '0';
    edt_quantity.SetFocus;

    if qqqty = 1 then
    begin
    query := 'select id, ifnull(quantity,0) as quantity,transaction_id from transaction ';
    qwhere  := ' where quantity =' + quotedstr(inttostr(quantity_item));
    sql := query + qwhere;
    procedures.select_func;

    edt_quantity_re.Text  := inttostr(quantity_item);
    end;



end;

end.
