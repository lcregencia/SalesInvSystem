unit Customer_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  Tfrm_customer_report = class(TForm)
    qr_customer_report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_customer_report: Tfrm_customer_report;

implementation

uses datamodule;

{$R *.dfm}

end.
