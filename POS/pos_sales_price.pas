unit pos_sales_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, AdvPanel, ExtCtrls, RzLabel;

type
  Tpos_sales_price_update_frm = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    nedt_price: TRzNumericEdit;
    btn_ok: TRzButton;
    btn_cancel: TRzButton;
    RzLabel1: TRzLabel;
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pos_sales_price_update_frm: Tpos_sales_price_update_frm;

implementation

uses procedures, sql_statement, variables, sales_frm;

{$R *.dfm}

procedure Tpos_sales_price_update_frm.btn_cancelClick(Sender: TObject);
begin
    close;
end;

procedure Tpos_sales_price_update_frm.btn_okClick(Sender: TObject);
begin
        query := ' update transaction set price = ' +quotedstr(nedt_price.Text);
        qwhere := ' where id = ' +floattostr(price_item) + ' and transaction_id = ' + quotedstr(inttostr(sales_trans_id));
        sql := query + qwhere;
        procedures.exec_func;
        close;
        pos_sales_frm.btn_item_query.Click;
        pos_sales_frm.edt_qty.SetFocus;
end;

end.
