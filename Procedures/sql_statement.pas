unit sql_statement;

interface
  uses SysUtils;
  procedure  all_inventory;

implementation

uses variables;

procedure  all_inventory;
begin
    query := ' select* from inventory';
    qwhere := ' where id =' +quotedstr(inttostr(mf_stock_id));
    sql := query + qwhere;
end;
end.
