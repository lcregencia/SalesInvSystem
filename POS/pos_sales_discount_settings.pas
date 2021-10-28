unit pos_sales_discount_settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzRadChk, AdvPanel, ExtCtrls,
  RzLabel;

type
  Tsales_discount_settings = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    chk_discount1: TRzCheckBox;
    btn_save1: TRzButton;
    btn_close: TRzButton;
    btn_query: TRzButton;
    RzLabel1: TRzLabel;
    nedt_discount1: TRzNumericEdit;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_save1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chk_discount1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sales_discount_settings: Tsales_discount_settings;

implementation

uses procedures, sql_statement, variables, datamodule;

{$R *.dfm}

procedure Tsales_discount_settings.btn_closeClick(Sender: TObject);
begin
    showmessage('Discount Set!');
    close;
end;

procedure Tsales_discount_settings.btn_queryClick(Sender: TObject);
begin
    query :=    ' select sales_discount.id ' +
		            ', ifnull((s_discount1), 0) as s_discount1 ' +
                ', ifnull((s_check1), 0) as s_check1 ' +
                ' from sales_discount ';

    qwhere := ' where 1 = 1';

    sql := query + qwhere;
    procedures.select_func;

    if DM.qselect.RecordCount <> 0 then
    begin
      while DM.qselect.Eof <> true do
      begin
        id :=DM.qselect.FieldValues['id'];
        nedt_discount1.Text := DM.qselect.fieldvalues['s_discount1'];

        if dm.qselect.FieldValues['s_check1'] = 1 then
        begin
          chk_discount1.Checked := true;
        end
        else
        begin
          chk_discount1.Checked := false;
        end;

        dm.qselect.Next;
    end
      end;

end;

procedure Tsales_discount_settings.btn_save1Click(Sender: TObject);
begin
    query := ' update sales_discount set s_discount1 = ' +quotedstr(nedt_discount1.Text);
    sql := query;
    procedures.exec_func;
    showmessage('Update Successful!');
    btn_query.Click;
end;

procedure Tsales_discount_settings.chk_discount1Click(Sender: TObject);
begin
    if chk_discount1.Checked = true then
        begin

        query := ' update sales_discount set s_check1 = 1' ;

        sql := query;
        procedures.exec_func;
        btn_query.Click;
        end;
end;

procedure Tsales_discount_settings.FormActivate(Sender: TObject);
begin
    btn_query.Click;
end;

end.
