unit variables;

interface

var
  stockin_id, trans_code_id, p1, temp, mf_emp_id, stocks_temp, id_temp, temp_time: integer;
  new_id, id, mf_mem_id, mf_stock_id, mf_court_id, tag, cnt_cmp: integer;
  cust_tag, cust_id, cmb_itemindex, tag_stock, max_batch_id, confirmed: integer;
  emp_id, balance, encoder, selectatt_id, attribute_temp, transhist_id: integer;
  type_temp: string;
  sql, query, qwhere, qgroup, qset, reserve_sql, court_sql, qorder, str_time: string;
  temp_category, temp_brand: string;
  //purchase_order
  order_details_id, purchase_tag, purchase_id, net_cost, temp_type, temp_po_id, po_id, check_temp, po_counter, po_id2: integer;
  po_qty  : integer;
  //receiving_report
  rr_edit_qty,rr_tag, rr_batch_id, rr_id, status_tag, rr_status: integer;
  //supplier
  supp_tag, supp_id, supp_temp: integer;
  //login
  encoder_name: string;
  //authentication
  count, confirmed_employee: integer;
  //branch
  branch_id: integer;
  // inventory
  check : integer;
  //sales returns & change quantity(matoy)
  qqqty : integer;
  //sales(dave)

  del_item, sales_stock_id, sales_cus_id, sales_trans_id, quantity_stock_id, next_trans: integer;
  total_price : double;
  change,payment_amount : double;
  discount_value : integer;
  discount_item : integer;
  quantity_item : integer;
  inven_id, return_inven_id : integer;
  units_id,  return_unit_id : integer;
  price_item : double;
  qty : integer;
  qty_id : integer;

  //stock distribution (matoy)
  mf_distribute_id,current_qty,running_qty,distribute_id,dis_id,distribute ,point_qty_id: integer;
  stock_qty : integer;
  return_id : integer;
  //accounts payable( matoy)
  bal,bal1,final_balance,amount,running_cost, amount1,final_balance1: double;

implementation

end.
