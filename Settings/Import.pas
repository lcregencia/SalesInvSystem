unit Import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPanel, RzButton, ExtCtrls, RzPanel, Grids, AdvObj, BaseGrid,
  AdvGrid;

type
  TForm1 = class(TForm)
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvStringGrid1: TAdvStringGrid;
    procedure Open(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Excel_TLB, Office_TLB;

{$R *.dfm}

procedure TForm1.Open(Sender: TObject);
var
    XLSXReader: Excel_TLB.TExcelApplication;
    newWorkbook: Excel_TLB._Workbook;
    objXLS: Excel_TLB.TExcelWorkbook;
    objSheet: Excel_TLB.TExcelWorksheet;
    objWrapper: TExcelWrapper;
begin
    newWorkbook := XLSXReader.Workbooks.Add('C:\book1.xlsx', GetUserDefaultLCID);
    objXLS := Excel_TLB.TExcelWorkbook.Create(nil);
    objXLS.ConnectTo(newWorkbook);
    objSheet := Excel_TLB.TExcelWorksheet.Create(nil);
    objSheet.ConnectTo(objXLS.Worksheets['sheet1'] as _Worksheet);
    objWrapper := TExcelWrapper.Create(objSheet);
    if cdsExcel.Active then
    begin
        cdsExcel.Close;
    objManager.FillDataSet(cdsExcel);
    cdsExcel.Open;
    cdsExcel.First;
    newWorkbook.Close(false, EmptyParam, EmptyParam, GetUserDefaultLCID);

    end;
end;
end.
