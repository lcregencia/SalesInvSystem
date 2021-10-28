unit sales_receipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, StdCtrls, RzLabel;

type
  Tfrm_receipt = class(TForm)
    qr_receipt: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    checked_by: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    quantity: TQRDBText;
    QRDBText1: TQRDBText;
    price: TQRDBText;
    description: TQRDBText;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    total_price: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_receipt: Tfrm_receipt;
  total_price: double;

implementation

uses datamodule, sales_frm, pos_salespayment_frm, variables;

{$R *.dfm}

end.
