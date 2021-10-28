unit Purchasing_order_details_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_po_details_report = class(TForm)
    qr_po_details_report: TQuickRep;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand3: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel24: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_po_details_report: Tfrm_po_details_report;

implementation

uses datamodule;

{$R *.dfm}

end.
