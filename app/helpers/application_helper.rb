module ApplicationHelper
  def valid_month_selection
    selection = []
    [*1..12].each do |i|
      selection << i.to_s.rjust(2, '0')
    end
    return selection
  end

  def progress_bar_item_name(i, page_number, base_name)
    active_name = base_name + "--active"
    item_name = []
    item_name << base_name
    if i == page_number - 1
      item_name << active_name
    end
    return item_name
  end

  def progress_bar_status_name(i, page_number, base_name)
    active_name = base_name + "--active"
    before_name = base_name + "--before"
    first_name = base_name + "--first"
    last_name = base_name + "--last"
    status_name = []
    status_name << base_name
    if i == 0
      status_name << first_name
    end
    if i == 4
      status_name << last_name
    end
    if i == page_number - 1
      status_name << active_name
    end
    if i < page_number - 1
      status_name << before_name
    end
    return status_name
  end
end
