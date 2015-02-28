module ApplicationHelper
  def link_sort_by(table, field, sorting) 
    link_to t("#{table}.#{field}"), orders_path({ :order_by => field, :sorting => reverse(sorting) })
  end
end
