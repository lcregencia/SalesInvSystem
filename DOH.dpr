program DOH;

uses
  Forms,
  main in 'Main\main.pas' {main_frm},
  inventory_details in 'Inventory\inventory_details.pas' {inventory_frm},
  procedures in 'procedures\procedures.pas',
  datamodule in 'datamodule\datamodule.pas' {dm: TDataModule},
  variables in 'procedures\variables.pas',
  sql_statement in 'procedures\sql_statement.pas',
  stock_in in 'Inventory\stock_in.pas' {inventory_add_frm},
  trans_code in 'Settings\trans_code.pas' {trans_code_frm},
  add_trans_code in 'Settings\add_trans_code.pas' {trans_code_add_frm},
  add_stocks in 'Inventory\add_stocks.pas' {add_stocks_frm},
  authentication_frm in 'Authentication\authentication_frm.pas' {confirmation_frm},
  login in 'Authentication\login.pas' {login_frm},
  settings in 'datamodule\settings.pas' {settings_DM},
  frm_attribute in 'Attributes\frm_attribute.pas' {frm_attributes},
  frm_selectattribute in 'Attributes\frm_selectattribute.pas' {frm_selectatt},
  frm_addattribute in 'Attributes\frm_addattribute.pas' {frm_addatt},
  supplier_masterfile in 'MasterFile\supplier_masterfile.pas' {mf_supplier_frm},
  frm_supplierdetails in 'Supplier\frm_supplierdetails.pas' {frm_supplier_details},
  stock_card in 'Inventory\stock_card.pas' {stock_card_frm},
  customer_masterfile in 'MasterFile\customer_masterfile.pas' {mf_customer_frm},
  frm_customerdetails in 'Customer\frm_customerdetails.pas' {frm_customer_details},
  purchase_order_details in 'Purchase Order\purchase_order_details.pas' {purchase_order_frm},
  purchase_order_additems in 'Purchase Order\purchase_order_additems.pas' {purchase_order_additem},
  purchase_order in 'Purchase Order\purchase_order.pas' {mf_po_frm},
  mf_receiving_report in 'Receiving Report\mf_receiving_report.pas' {mf_receiving_report_frm},
  receiving_report in 'Receiving Report\receiving_report.pas' {receiving_report_frm},
  employee_masterfile in 'MasterFile\employee_masterfile.pas' {mf_employee_frm},
  frm_employeedetails in 'Employee\frm_employeedetails.pas' {frm_employee_details},
  frm_trans_history in 'Settings\frm_trans_history.pas' {frm_transaction_history},
  sales_frm in 'POS\sales_frm.pas' {pos_sales_frm},
  pos_sales_price in 'POS\pos_sales_price.pas' {pos_sales_price_update_frm},
  pos_sales_input_qty_frm in 'POS\pos_sales_input_qty_frm.pas' {pos_sales_qty_frm},
  pos_sales_returns_frm in 'POS\pos_sales_returns_frm.pas' {sales_return},
  pos_salesdiscount_frm in 'POS\pos_salesdiscount_frm.pas' {pos_sales_discount_frm},
  pos_salespayment_frm in 'POS\pos_salespayment_frm.pas' {pos_sales_payment_frm},
  inventory in 'MasterFile\inventory.pas' {mf_inventory_frm},
  Details_distribution in 'Stock_distribution\Details_distribution.pas' {frm_distribution_details},
  frm_qty in 'Stock_distribution\frm_qty.pas' {distribution_qty_frm},
  stocks_distribution in 'Stock_distribution\stocks_distribution.pas' {stock_distribution_frm},
  accounts_pay in 'accounts_payable\accounts_pay.pas' {accounts_payable_frm},
  accounts_p_details in 'accounts_payable\ap_detail\accounts_p_details.pas' {ap_detail_frm},
  pay_accounts in 'accounts_payable\pay\pay_accounts.pas' {payment_frm},
  acc_receivable_details_form in 'accounts_receivable\acc_receivable_details_form.pas' {frm_ar_details},
  acc_receivable_form in 'accounts_receivable\acc_receivable_form.pas' {frm_accounts_receivable},
  frm_control_settings in 'Settings\frm_control_settings.pas' {frm_settings},
  Accounts_payable_report in 'Reports\Accounts_payable_report.pas' {frm_accts_payable},
  Accounts_receivable_report in 'Reports\Accounts_receivable_report.pas' {frm_accts_receivable_report},
  Customer_details_report in 'Reports\Customer_details_report.pas' {frm_cust_det_report},
  Customer_report in 'Reports\Customer_report.pas' {frm_customer_report},
  Employee_details_report in 'Reports\Employee_details_report.pas' {frm_emp_details_report},
  Employee_report in 'Reports\Employee_report.pas' {frm_emp_report},
  Inventory_report in 'Reports\Inventory_report.pas' {frm_inv_report},
  RR_report in 'Reports\RR_report.pas' {frm_rr_report},
  sales_receipt in 'Reports\sales_receipt.pas' {frm_receipt},
  Stock_card_report in 'Reports\Stock_card_report.pas' {frm_stock_card_report},
  Supplier_detail_report in 'Reports\Supplier_detail_report.pas' {frm_supp_det_report},
  Supplier_report in 'Reports\Supplier_report.pas' {frm_supp_report},
  Transaction_code_report in 'Reports\Transaction_code_report.pas' {frm_trans_code_report},
  Transaction_history_report in 'Reports\Transaction_history_report.pas' {frm_trans_hist_report},
  Purchasing_order_report in 'Reports\Purchasing_order_report.pas' {frm_po_report},
  Purchasing_order_details_report in 'Reports\Purchasing_order_details_report.pas' {frm_po_details_report},
  Inventory_information_report in 'Reports\Inventory_information_report.pas' {frm_inv_info_report};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlogin_frm, login_frm);
  Application.CreateForm(Tmain_frm, main_frm);
  Application.CreateForm(Tinventory_frm, inventory_frm);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tinventory_add_frm, inventory_add_frm);
  Application.CreateForm(Ttrans_code_frm, trans_code_frm);
  Application.CreateForm(Ttrans_code_add_frm, trans_code_add_frm);
  Application.CreateForm(Tadd_stocks_frm, add_stocks_frm);
  Application.CreateForm(Tconfirmation_frm, confirmation_frm);
  Application.CreateForm(Tsettings_DM, settings_DM);
  Application.CreateForm(Tfrm_attributes, frm_attributes);
  Application.CreateForm(Tfrm_selectatt, frm_selectatt);
  Application.CreateForm(Tfrm_addatt, frm_addatt);
  Application.CreateForm(Tmf_supplier_frm, mf_supplier_frm);
  Application.CreateForm(Tfrm_supplier_details, frm_supplier_details);
  Application.CreateForm(Tstock_card_frm, stock_card_frm);
  Application.CreateForm(Tmf_customer_frm, mf_customer_frm);
  Application.CreateForm(Tfrm_customer_details, frm_customer_details);
  Application.CreateForm(Tpurchase_order_frm, purchase_order_frm);
  Application.CreateForm(Tpurchase_order_additem, purchase_order_additem);
  Application.CreateForm(Tmf_po_frm, mf_po_frm);
  Application.CreateForm(Tmf_receiving_report_frm, mf_receiving_report_frm);
  Application.CreateForm(Treceiving_report_frm, receiving_report_frm);
  Application.CreateForm(Tmf_employee_frm, mf_employee_frm);
  Application.CreateForm(Tfrm_employee_details, frm_employee_details);
  Application.CreateForm(Tfrm_transaction_history, frm_transaction_history);
  Application.CreateForm(Tpos_sales_frm, pos_sales_frm);
  Application.CreateForm(Tpos_sales_payment_frm, pos_sales_payment_frm);
  Application.CreateForm(Tpos_sales_price_update_frm, pos_sales_price_update_frm);
  Application.CreateForm(Tpos_sales_qty_frm, pos_sales_qty_frm);
  Application.CreateForm(Tsales_return, sales_return);
  Application.CreateForm(Tpos_sales_discount_frm, pos_sales_discount_frm);
  Application.CreateForm(Tpos_sales_payment_frm, pos_sales_payment_frm);
  Application.CreateForm(Tmf_inventory_frm, mf_inventory_frm);
  Application.CreateForm(Tfrm_distribution_details, frm_distribution_details);
  Application.CreateForm(Tdistribution_qty_frm, distribution_qty_frm);
  Application.CreateForm(Tstock_distribution_frm, stock_distribution_frm);
  Application.CreateForm(Taccounts_payable_frm, accounts_payable_frm);
  Application.CreateForm(Tap_detail_frm, ap_detail_frm);
  Application.CreateForm(Tpayment_frm, payment_frm);
  Application.CreateForm(Tfrm_ar_details, frm_ar_details);
  Application.CreateForm(Tfrm_accounts_receivable, frm_accounts_receivable);
  Application.CreateForm(Tfrm_settings, frm_settings);
  Application.CreateForm(Tfrm_accts_payable, frm_accts_payable);
  Application.CreateForm(Tfrm_accts_receivable_report, frm_accts_receivable_report);
  Application.CreateForm(Tfrm_cust_det_report, frm_cust_det_report);
  Application.CreateForm(Tfrm_customer_report, frm_customer_report);
  Application.CreateForm(Tfrm_emp_details_report, frm_emp_details_report);
  Application.CreateForm(Tfrm_emp_report, frm_emp_report);
  Application.CreateForm(Tfrm_inv_report, frm_inv_report);
  Application.CreateForm(Tfrm_rr_report, frm_rr_report);
  Application.CreateForm(Tfrm_receipt, frm_receipt);
  Application.CreateForm(Tfrm_stock_card_report, frm_stock_card_report);
  Application.CreateForm(Tfrm_supp_det_report, frm_supp_det_report);
  Application.CreateForm(Tfrm_supp_report, frm_supp_report);
  Application.CreateForm(Tfrm_trans_code_report, frm_trans_code_report);
  Application.CreateForm(Tfrm_trans_hist_report, frm_trans_hist_report);
  Application.CreateForm(Tfrm_po_report, frm_po_report);
  Application.CreateForm(Tfrm_po_details_report, frm_po_details_report);
  Application.CreateForm(Tfrm_inv_info_report, frm_inv_info_report);
  Application.Run;
end.
