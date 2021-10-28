unit Supplier_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  Tfrm_supp_report = class(TForm)
    qr_supp_report: TQuickRep;
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
    QRLabel10: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_supp_report: Tfrm_supp_report;

implementation

uses datamodule;

{$R *.dfm}

end.
