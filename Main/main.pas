unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, AdvPanel, ToolWin, ActnMan, ActnCtrls, Ribbon,
  RibbonLunaStyleActnCtrls, ExtCtrls, RzPanel, Buttons, ActnMenus,
  RibbonActnMenus, RzButton, pngimage, StdCtrls, RzLabel, IdBaseComponent,
  IdComponent, IdIPWatch, AeroButtons, System.Actions;

type
  Tmain_frm = class(TForm)
    RzPanel1: TRzPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    ActionList1: TActionList;
    ActionManager1: TActionManager;
    Ribbon1: TRibbon;
    rb_home: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    btn_transaction: TSpeedButton;
    tb_masterfile: TRibbonPage;
    RibbonGroup4: TRibbonGroup;
    btn_mf_inventory: TSpeedButton;
    rb_inventory: TRibbonPage;
    RibbonGroup2: TRibbonGroup;
    btn_inventory_details: TSpeedButton;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    AdvPanel1: TAdvPanel;
    rb_purchase: TRibbonPage;
    RibbonGroup6: TRibbonGroup;
    btn_stock_in: TSpeedButton;
    lbl_time: TRzLabel;
    Image1: TImage;
    btn_query: TRzBitBtn;
    lbl_date: TRzLabel;
    btn_logout: TRzBitBtn;
    btn_quit: TRzBitBtn;
    RibbonGroup7: TRibbonGroup;
    btn_stock_card: TSpeedButton;
    RibbonGroup10: TRibbonGroup;
    btn_mf_supplier: TSpeedButton;
    rb_supplier: TRibbonPage;
    rb_customer: TRibbonPage;
    rb_employee: TRibbonPage;
    RibbonGroup9: TRibbonGroup;
    btn_supplier_details: TSpeedButton;
    RibbonGroup11: TRibbonGroup;
    btn_mf_customer: TSpeedButton;
    RibbonGroup12: TRibbonGroup;
    btn_customer_details: TSpeedButton;
    RibbonGroup13: TRibbonGroup;
    btn_purchase_order: TSpeedButton;
    btn_user: TRzBitBtn;
    btn_position: TRzBitBtn;
    btn_ipaddress: TRzBitBtn;
    btn_computer_name: TRzBitBtn;
    RibbonGroup14: TRibbonGroup;
    btn_mf_employee: TSpeedButton;
    Timer1: TTimer;
    RibbonGroup16: TRibbonGroup;
    btn_receiving_report: TSpeedButton;
    RibbonGroup15: TRibbonGroup;
    btn_mf_purchase_order: TSpeedButton;
    RibbonGroup17: TRibbonGroup;
    btn_rr_masterfile: TSpeedButton;
    rb_settings: TRibbonPage;
    RibbonGroup8: TRibbonGroup;
    btn_attributes: TSpeedButton;
    RibbonGroup5: TRibbonGroup;
    btn_transcode: TSpeedButton;
    RibbonGroup18: TRibbonGroup;
    SpeedButton1: TSpeedButton;
    RibbonGroup19: TRibbonGroup;
    btn_history: TSpeedButton;
    RibbonGroup3: TRibbonGroup;
    btn_settings: TSpeedButton;
    rb_account: TRibbonPage;
    RibbonGroup21: TRibbonGroup;
    RibbonGroup22: TRibbonGroup;
    btn_ar: TAeroSpeedButton;
    btn_ap: TAeroSpeedButton;
    rb_sd: TRibbonPage;
    RibbonGroup23: TRibbonGroup;
    AeroSpeedButton1: TAeroSpeedButton;
    RibbonGroup24: TRibbonGroup;
    SpeedButton2: TSpeedButton;
    procedure btn_inventory_detailsClick(Sender: TObject);
    procedure btn_mf_inventoryClick(Sender: TObject);
    procedure btn_transcodeClick(Sender: TObject);
    procedure btn_stock_inClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btn_queryClick(Sender: TObject);
    procedure btn_attributesClick(Sender: TObject);
    procedure btn_mf_supplierClick(Sender: TObject);
    procedure btn_supplier_detailsClick(Sender: TObject);
    procedure btn_stock_cardClick(Sender: TObject);
    procedure btn_mf_customerClick(Sender: TObject);
    procedure btn_customer_detailsClick(Sender: TObject);
    procedure btn_purchase_orderClick(Sender: TObject);
    procedure btn_quitClick(Sender: TObject);
    procedure btn_logoutClick(Sender: TObject);
    procedure btn_mf_purchase_orderClick(Sender: TObject);
    procedure btn_rr_masterfileClick(Sender: TObject);
    procedure btn_receiving_reportClick(Sender: TObject);
    procedure btn_mf_employeeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_transactionClick(Sender: TObject);
    procedure btn_historyClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_apClick(Sender: TObject);
    procedure btn_arClick(Sender: TObject);
    procedure AeroSpeedButton1Click(Sender: TObject);
    procedure btn_settingsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_frm: Tmain_frm;

implementation

uses inventory_details, stock_in, inventory, trans_code, variables, login,
  datamodule, procedures, frm_attribute, supplier_masterfile,
  frm_supplierdetails, stock_card, customer_masterfile, frm_customerdetails,
  purchase_order_details, purchase_order, mf_receiving_report, receiving_report,
  employee_masterfile, frm_employeedetails, sales_frm, frm_trans_history,
  Details_distribution, accounts_pay, acc_receivable_form, stocks_distribution,
  frm_control_settings;

{$R *.dfm}

procedure Tmain_frm.AeroSpeedButton1Click(Sender: TObject);
begin
  stock_distribution_frm.ShowModal;
end;

procedure Tmain_frm.btn_apClick(Sender: TObject);
begin
  accounts_payable_frm.ShowModal;
end;

procedure Tmain_frm.btn_arClick(Sender: TObject);
begin
  frm_accounts_receivable.ShowModal;
end;

procedure Tmain_frm.btn_attributesClick(Sender: TObject);
begin
    frm_attributes.ShowModal;
end;

procedure Tmain_frm.btn_customer_detailsClick(Sender: TObject);
begin
//    frm_customer_details.btn_delete.Enabled := false;
    frm_customer_details.ShowModal;
end;

procedure Tmain_frm.btn_historyClick(Sender: TObject);
begin
      frm_transaction_history.ShowModal;
end;

procedure Tmain_frm.btn_inventory_detailsClick(Sender: TObject);
begin
  mf_stock_id := 0;
  inventory_frm.ShowModal;
end;

procedure Tmain_frm.btn_logoutClick(Sender: TObject);
begin
 {   btn_user.Caption := '';
    btn_position.Caption := '';
    main_frm.Close;
    login_frm.ShowModal;}
if MessageDlg('Log-off?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      login_frm.Visible := true;
      main_frm.close;
   end;
end;

procedure Tmain_frm.btn_mf_customerClick(Sender: TObject);
begin
    cust_tag := 0;
    mf_customer_frm.ShowModal;
end;

procedure Tmain_frm.btn_mf_employeeClick(Sender: TObject);
begin
    mf_employee_frm.ShowModal;
end;

procedure Tmain_frm.btn_mf_inventoryClick(Sender: TObject);
begin
    tag_stock := 0;
    mf_inventory_frm.ShowModal;
end;

procedure Tmain_frm.btn_mf_purchase_orderClick(Sender: TObject);
begin
    mf_po_frm.ShowModal;
end;

procedure Tmain_frm.btn_queryClick(Sender: TObject);
begin
  btn_user.Caption := dm.qselect1.FieldValues['fname'];
  btn_position.Caption := dm.qselect1.FieldValues['position'];

  if btn_position.Caption = 'Administrator' then
    begin
     frm_settings.rd_free.Checked := true;
    end
  else
  if btn_position.Caption = 'Manager' then
    begin
     frm_settings.rd_free.Checked := true;
    end
  else
  if btn_position.Caption = 'Cashier' then
    begin
     frm_settings.rd_strict.Checked := true;
    end;

end;

procedure Tmain_frm.btn_quitClick(Sender: TObject);
begin
   // close;
  application.Terminate;
end;

procedure Tmain_frm.btn_receiving_reportClick(Sender: TObject);
begin
    purchase_id := 0;
    receiving_report_frm.ShowModal;
end;

procedure Tmain_frm.btn_rr_masterfileClick(Sender: TObject);
begin
    mf_receiving_report_frm.ShowModal;
end;

procedure Tmain_frm.btn_settingsClick(Sender: TObject);
begin
  frm_settings.ShowModal;
end;

procedure Tmain_frm.btn_stock_cardClick(Sender: TObject);
begin
    stock_card_frm.ShowModal;
end;

procedure Tmain_frm.btn_stock_inClick(Sender: TObject);
begin
    inventory_add_frm.ShowModal;
end;

procedure Tmain_frm.btn_supplier_detailsClick(Sender: TObject);
begin
//    frm_supplier_details.btn_delete.Enabled := false;
    frm_supplier_details.ShowModal;
end;

procedure Tmain_frm.btn_mf_supplierClick(Sender: TObject);
begin
    supp_tag := 0;
    mf_supplier_frm.ShowModal;
end;

procedure Tmain_frm.btn_purchase_orderClick(Sender: TObject);
begin
    //mf_po_frm.ShowModal;
    purchase_id := 0;
    purchase_order_frm.ShowModal;
end;

procedure Tmain_frm.btn_transactionClick(Sender: TObject);
begin
    pos_sales_frm.ShowModal;
end;

procedure Tmain_frm.btn_transcodeClick(Sender: TObject);
begin
    trans_code_frm.ShowModal;
end;

procedure Tmain_frm.FormActivate(Sender: TObject);
begin
    login_frm.Hide;
    procedures.getcomputername;
    btn_computer_name.Caption := result;
    btn_ipaddress.Caption := dm.IdIPWatch1.LocalIP;
    btn_query.Click;
end;

procedure Tmain_frm.SpeedButton1Click(Sender: TObject);
begin
    emp_id := 0;
//    frm_employee_details.btn_delete.Enabled := false;
    frm_employee_details.ShowModal;
end;

procedure Tmain_frm.SpeedButton2Click(Sender: TObject);
begin
  frm_distribution_details.btn_new_distribution.Click;
  frm_distribution_details.ShowModal;
end;

procedure Tmain_frm.Timer1Timer(Sender: TObject);
begin
  lbl_time.Caption := timetostr(time);
  lbl_date.Caption := datetostr(date);
end;

end.
