unit frm_attribute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzPanel, RzButton, RzLabel, AdvPanel,
  ExtCtrls, RzRadChk, ActnList;

type
  Tfrm_attributes = class(TForm)
    RzPanel3: TRzPanel;
    AdvPanel1: TAdvPanel;
    RzLabel1: TRzLabel;
    btn_cancel: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    btn_brand: TRzBitBtn;
    btn_category: TRzButton;
    btn_generic: TRzButton;
    btn_status: TRzButton;
    btn_type: TRzButton;
    btn_unit: TRzButton;
    RzGroupBox3: TRzGroupBox;
    btn_position: TRzButton;
    RzGroupBox2: TRzGroupBox;
    btn_location: TRzButton;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    RzGroupBox4: TRzGroupBox;
    btn_payment: TRzBitBtn;
    esc: TAction;
    RzLabel12: TRzLabel;
    procedure btn_brandClick(Sender: TObject);
    procedure btn_categoryClick(Sender: TObject);
    procedure btn_genericClick(Sender: TObject);
    procedure btn_statusClick(Sender: TObject);
    procedure btn_unitClick(Sender: TObject);
    procedure btn_typeClick(Sender: TObject);
    procedure btn_locationClick(Sender: TObject);
    procedure btn_positionClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_paymentClick(Sender: TObject);
    procedure escExecute(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_attributes: Tfrm_attributes;

implementation

uses procedures, sql_statement, variables, frm_selectattribute,
  frm_addattribute;

{$R *.dfm}

procedure Tfrm_attributes.btn_brandClick(Sender: TObject);
begin
      attribute_temp := 1;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_cancelClick(Sender: TObject);
begin
      Close;
end;

procedure Tfrm_attributes.btn_categoryClick(Sender: TObject);
begin
      attribute_temp := 2;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_genericClick(Sender: TObject);
begin
    attribute_temp := 3;
    frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_statusClick(Sender: TObject);
begin
      attribute_temp := 4;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_paymentClick(Sender: TObject);
begin
      attribute_temp := 9;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_positionClick(Sender: TObject);
begin
      attribute_temp := 8;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_typeClick(Sender: TObject);
begin
      attribute_temp := 6;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.btn_unitClick(Sender: TObject);
begin
      attribute_temp := 5;
      frm_selectatt.Show;
end;

procedure Tfrm_attributes.escExecute(Sender: TObject);
begin
      btn_cancel.Click;
end;

procedure Tfrm_attributes.btn_locationClick(Sender: TObject);
begin
      attribute_temp := 7;
      frm_selectatt.Show;
end;
end.
