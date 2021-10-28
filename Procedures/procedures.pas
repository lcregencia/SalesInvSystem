unit procedures;

interface
  uses AdvGrid, RzCmboBx, classes, Forms, RzDTP, RzEdit, RzLabel, RzRadChk, SysUtils, Windows, Dialogs;
procedure grd_setup(get_grid: TAdvStringGrid);
procedure select_func;
procedure select_court_func;
procedure search_func;
procedure exec_func;
procedure cmb_pop(source_cmb:TRzComboBox; field, db, tb, where: string);
procedure create_fieldlist(get_query, get_db, get_table: string);
procedure search_fieldlist(get_column: string; get_string_list: TStringList);
procedure populate(get_frm: TForm; get_query, get_db, get_table: string);
procedure save(get_frm: TForm; get_query, get_db, get_table, get_where: string);
procedure generate_id(get_db, get_table: string);
procedure generate_trans_id(get_db, get_table: string);
procedure getcomputername;

var string_list: TStringList;
    new_frm:  TForm;
    size: integer;
    result, lpname: string;

implementation

uses datamodule, main, variables;

procedure getcomputername;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if windows.GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

procedure grd_setup(get_grid: TAdvStringGrid);
begin
        { grid initialization }
        get_grid.ClearNormalCells;
        get_grid.RowCount := 2;
        get_grid.SortSettings.Show := true;
        get_grid.FloatingFooter.Visible := false;
        get_grid.MouseActions.DisjunctRowSelect := true;
        get_grid.ColumnSize.Stretch := true;
        get_grid.Objects[0,get_grid.RowCount-1] := pointer(0);
        id := 0;
end;

procedure select_func;
begin
    DM.qselect1.Close;
    DM.qselect1.SQL.Clear;
    DM.qselect1.SQL.Add(sql);
    DM.qselect1.Open;
end;

procedure select_court_func;
begin
    DM.qcourt1.Close;
    DM.qcourt1.SQL.Clear;
    DM.qcourt1.SQL.Add(court_sql);
    DM.qcourt1.Open;
end;

procedure search_func;
begin
    DM.qsearch1.Close;
    DM.qsearch1.SQL.Clear;
    DM.qsearch1.SQL.Add(sql);
    DM.qsearch1.Open;
end;

procedure exec_func;
begin
    DM.qexec1.close;
    DM.qexec1.sql.clear;
    DM.qexec1.sql.Add(sql);
    DM.qexec1.ExecSQL;
end;

procedure cmb_pop(source_cmb:TRzComboBox; field, db, tb, where: string);
var get_cmb:TRzComboBox;
begin
        get_cmb := source_cmb;
        get_cmb.Items.Clear;

        query := ' select ' +field+ ' as alias from ' +db+ '.' +tb;
        qwhere := ' where ' +where;
        //qgroup := ' group by' +group;

        sql := query+qwhere;

        select_func;
        get_cmb.Items.Add('-');
        if DM.qselect1.RecordCount <> 0 then
        begin
                while DM.qselect1.Eof <> true do
                begin
                        get_cmb.Items.AddObject(DM.qselect1.FieldByName('alias').AsString,TObject(DM.qselect1.FieldByName('id').AsInteger));
                        dm.qselect1.Next;
                end;
        end;
        get_cmb.ItemIndex := 0;
end;

procedure generate_id(get_db, get_table: string);
begin
    sql := 'select ifnull(max(id),0) as max_id from ' + get_db + '.' + get_table;
    select_func;
end;

procedure generate_trans_id(get_db, get_table: string);
begin
    sql := 'select ifnull(max(transaction_id),0) as max_id from ' + get_db + '.' + get_table;
    select_func;
end;

procedure create_fieldlist(get_query, get_db, get_table: string);
begin
  //populates the stringlist with the field names of: get_query
  string_list.Free;
  string_list := TStringList.Create;
  if get_query = '' then
  begin
    sql := ' show columns from ' +get_db+'.'+get_table;
    search_func;
    while dm.qsearch1.Eof <> true do
    begin
      string_list.Add(dm.qsearch1.FieldValues['field']);
      dm.qsearch1.Next;
    end;
  end else
  begin
    sql := get_query;
    search_func;
    dm.qsearch1.Fields.GetFieldNames(string_list);
  end;
end;

procedure search_fieldlist(get_column: string; get_string_list: TStringList);
begin
  tag := 0;
  if get_string_list.IndexOf(get_column) >= 0 then
    tag := 1;
end;

procedure populate(get_frm: TForm; get_query, get_db, get_table: string);
var i: integer;
begin
  //initialize/populate all the components inside: get_frm
  new_frm := get_frm;
  cnt_cmp := new_frm.ComponentCount-1;
  cmb_itemindex := 0;

  create_fieldlist(get_query, get_db, get_table);

  for i := 0 to cnt_cmp do
  begin
      //populate TRzDateTimeEdit
      if new_frm.Components[i] is TRzDateTimePicker then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'dtp_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzDateTimePicker(new_frm.Components[i]).DateTime := dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'dtp_','',[rfReplaceAll])]
              else TRzDateTimePicker(new_frm.Components[i]).DateTime := now;
          end;
      end;
      //populate TRzEdit
      if new_frm.Components[i] is TRzEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
              begin
                if TRzEdit(new_frm.Components[i]).Name = 'edt_id' then
                  TRzEdit(new_frm.Components[i]).Text := formatfloat('000000000',dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll])])
                else
                  TRzEdit(new_frm.Components[i]).Text := dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll])]
              end
              else TRzEdit(new_frm.Components[i]).Clear;
          end;
      end;
      //populate TRzComboBox
      if new_frm.Components[i] is TRzComboBox then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
              begin
                if TRzComboBox(new_frm.Components[i]).Name = 'cmb_gender' then
                    TRzComboBox(new_frm.Components[i]).ItemIndex := TRzComboBox(new_frm.Components[i]).Items.IndexOf(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll])])
                else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_inventory_value' then
                    TRzComboBox(new_frm.Components[i]).ItemIndex := TRzComboBox(new_frm.Components[i]).Items.IndexOf(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll])])
                else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_transaction_value' then
                    TRzComboBox(new_frm.Components[i]).ItemIndex := TRzComboBox(new_frm.Components[i]).Items.IndexOf(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll])])
                else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_mi' then
                    TRzComboBox(new_frm.Components[i]).ItemIndex := TRzComboBox(new_frm.Components[i]).Items.IndexOf(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll])])
                else
                    TRzComboBox(new_frm.Components[i]).ItemIndex := TRzComboBox(new_frm.Components[i]).Items.IndexOfObject(TObject(dm.qselect1.FieldByName(StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll])).AsInteger))
              end
              else TRzComboBox(new_frm.Components[i]).ItemIndex := 0;
          end;
      end;
      //populate TRzCheckBox
      if new_frm.Components[i] is TRzCheckBox then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'cb_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzCheckBox(new_frm.Components[i]).Checked := bool(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'cb_','',[rfReplaceAll])])
              else TRzCheckBox(new_frm.Components[i]).Checked := False;
          end;
      end;
      //populate TRzRadioButton
      if new_frm.Components[i] is TRzRadioButton then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'rb_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzCheckBox(new_frm.Components[i]).Checked := bool(dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'rb_','',[rfReplaceAll])])
              else TRzCheckBox(new_frm.Components[i]).Checked := False;
          end;
      end;
      //populate TRzLabel
      if new_frm.Components[i] is TRzLabel then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'lbl_','',[rfReplaceAll]), string_list);
          //showmessage(new_frm.Components[i].Name+', '+inttostr(tag)+', '+inttostr(dm.qselect1.RecordCount));
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzLabel(new_frm.Components[i]).Caption := formatfloat('000000000',dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'lbl_','',[rfReplaceAll])])
              else TRzLabel(new_frm.Components[i]).Caption := '';
          end;
      end;
      //populate TRzMaskEdit
      if new_frm.Components[i] is TRzMaskEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]), string_list);
          //showmessage(new_frm.Components[i].Name+', '+inttostr(tag)+', '+inttostr(dm.qselect1.RecordCount));
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzMaskEdit(new_frm.Components[i]).Text := dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll])]
              else TRzMaskEdit(new_frm.Components[i]).Text := '';
          end;
      end;
      //populate TRzNumericEdit
      if new_frm.Components[i] is TRzNumericEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'nedt_','',[rfReplaceAll]), string_list);
          if tag = 1 then
          begin
              if dm.qselect1.RecordCount <> 0 then
                TRzNumericEdit(new_frm.Components[i]).Text := formatfloat('########0.00',dm.qselect1.fieldvalues[StringReplace(new_frm.Components[i].Name,'nedt_','',[rfReplaceAll])])
              else TRzNumericEdit(new_frm.Components[i]).Text := '0';
          end;
      end;
  end;
end;

procedure save(get_frm: TForm; get_query, get_db, get_table, get_where: string);
var i: integer;
begin
  query := get_query + ' ' +get_db + '.' + get_table + ' set ';
  qwhere := get_where;
  //save all the components inside: get_frm
  new_frm := get_frm;
  cnt_cmp := new_frm.ComponentCount-1;
  cmb_itemindex := 0;

  for i := 0 to cnt_cmp do
  begin
      //save TRzEdit
      if new_frm.Components[i] is TRzEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]), string_list);
          if tag = 1 then
              query := query + StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzEdit(new_frm.Components[i]).Text) + ', ';
      end;
      //save TRzMaskEdit
      if new_frm.Components[i] is TRzMaskEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]), string_list);
          if tag = 1 then
              query := query + StringReplace(new_frm.Components[i].Name,'edt_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzMaskEdit(new_frm.Components[i]).Text) + ', ';
      end;
      //save TRzComboBox
      if new_frm.Components[i] is TRzComboBox then
      begin
          if TRzComboBox(new_frm.Components[i]).Name = 'cmb_gender' then
              query := query + StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzComboBox(new_frm.Components[i]).Text) + ', '
          else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_transaction_value' then
              query := query + StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzComboBox(new_frm.Components[i]).Text) + ', '
          else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_inventory_value' then
              query := query + StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzComboBox(new_frm.Components[i]).Text) + ', '
          else if TRzComboBox(new_frm.Components[i]).Name = 'cmb_mi' then
              query := query + StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzComboBox(new_frm.Components[i]).Text) + ', '
          else
              query := query + StringReplace(new_frm.Components[i].Name,'cmb_','',[rfReplaceAll]) + ' = ' + quotedstr(inttostr(LongInt(TRzComboBox(new_frm.Components[i]).Items.Objects[TRzComboBox(new_frm.Components[i]).ItemIndex]))) + ', ';
      end;
      //save TRzDateTimeEdit
      if new_frm.Components[i] is TRzDateTimePicker then
          query := query + StringReplace(new_frm.Components[i].Name,'dtp_','',[rfReplaceAll]) + ' = ' + quotedstr(formatdatetime('yyyy-mm-dd',(TRzDateTimePicker(new_frm.Components[i]).Date))) + ', ';
      //save TRzCheckBox
      if new_frm.Components[i] is TRzCheckBox then
      begin
          if TRzCheckBox(new_frm.Components[i]).Checked = true then
          begin
              query := query + StringReplace(new_frm.Components[i].Name,'cb_','',[rfReplaceAll]) + ' = 1' + ', ';
          end else
          begin
              query := query + StringReplace(new_frm.Components[i].Name,'cb_','',[rfReplaceAll]) + ' = 0' + ', ';
          end;
      end;
      //save TRzRadioButton
      if new_frm.Components[i] is TRzRadioButton then
      begin
          if TRzRadioButton(new_frm.Components[i]).Checked = true then
          begin
              query := query + StringReplace(new_frm.Components[i].Name,'rb_','',[rfReplaceAll]) + ' = 1' + ', ';
          end else
          begin
              query := query + StringReplace(new_frm.Components[i].Name,'rb_','',[rfReplaceAll]) + ' = 0' + ', ';
          end;
      end;
      //save TRzLabel
      if new_frm.Components[i] is TRzLabel then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'lbl_','',[rfReplaceAll]), string_list);
          if tag = 1 then
              query := query + StringReplace(new_frm.Components[i].Name,'lbl_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzLabel(new_frm.Components[i]).Caption) + ', ';
      end;
      //save TRzNumericEdit
      if new_frm.Components[i] is TRzNumericEdit then
      begin
          search_fieldlist(StringReplace(new_frm.Components[i].Name,'nedt_','',[rfReplaceAll]), string_list);
          if tag = 1 then
              query := query + StringReplace(new_frm.Components[i].Name,'nedt_','',[rfReplaceAll]) + ' = ' + quotedstr(TRzNumericEdit(new_frm.Components[i]).Text) + ', ';
      end;
  end;

  if qwhere <> ' ' then
  begin
      query := query + ' encode_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) + ', encode_id = ' + inttostr(encoder);
  end else
  begin
      query := query + ' update_date = ' + quotedstr(formatdatetime('yyyy-mm-dd',(now))) + ', update_id = ' + inttostr(encoder);
  end;
  query := query + ' ,machine_id = ' + quotedstr(result);
  sql := query + qwhere;
  //showmessage(sql);
  exec_func;
end;

end.
