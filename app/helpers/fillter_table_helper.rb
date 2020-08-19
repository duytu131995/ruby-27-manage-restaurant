module FillterTableHelper
  def status_table
    DinnerTable.statuses.map do |key, value|
      [t("table_manage.#{key}"), value]
    end
  end
end
