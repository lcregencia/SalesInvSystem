unit frm_transaction_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, AdvPanel, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  StdCtrls, RzLabel, Mask, RzEdit, RzButton;

type
  Tfrm_trans_details = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    AdvStringGrid1: TAdvStringGrid;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    RzEdit7: TRzEdit;
    RzEdit8: TRzEdit;
    RzLabel12: TRzLabel;
    RzBitBtn1: TRzBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_trans_details: Tfrm_trans_details;

implementation

uses procedures, sql_statement, datamodule, variables;

{$R *.dfm}

end.
