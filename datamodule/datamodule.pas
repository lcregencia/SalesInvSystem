unit datamodule;

interface

uses
  SysUtils, Classes, DB,  ExtCtrls, RpRave, RpDefine, RpCon, RpConDS, IdBaseComponent,
  IdComponent, IdIPWatch, MemDS, DBAccess, MyAccess, RpBase, RpSystem;

type
  Tdm = class(TDataModule)
    RvDataSetConnection1: TRvDataSetConnection;
    IdIPWatch1: TIdIPWatch;
    RvProject1: TRvProject;
    MyConnection1: TMyConnection;
    qsearch1: TMyQuery;
    qselect1: TMyQuery;
    qexec1: TMyQuery;
    qcourt1: TMyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses Purchasing_order_report, Purchasing_order_details_report,
  Inventory_information_report;

{$R *.dfm}

end.
