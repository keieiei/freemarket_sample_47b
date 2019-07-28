module ApplicationHelper
  include CreditCardHelper

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

  def first_add_active_class_name(i, base_name)
    active_name = base_name + '--active'
    class_name = [base_name]
    class_name << active_name if i == 0
    return class_name
  end

  def hide_head_card_number(card_number)
    length = card_number.length - 4
    hide_str = "*" * length
    return card_number.gsub(/\A[0-9]{#{length}}/, hide_str)
  end

  def select_option_add_nil(array)
    return array << ['--', nil]
  end

  def add_first_element(array, add_element)
    return [add_element].concat(array)
  end

  def search_result_title(keyword)
    return "検索結果" if keyword.nil?
    return "#{keyword}の検索結果"
  end

  def search_result_number(items)
    return "該当する商品が見つかりません。検索条件を変えて、再度お試しください。" if items.empty?
    return "1 - #{items.length}件表示"
  end

  def set_option_array(names, ids)
    output_array = []
    if ids == "integer"
      names.each.with_index(0) do |name, i|
        output_array << [name, i]
      end
    else
      names.each.with_index(0) do |name, i|
        id = ids[i]
        output_array << [name, id]
      end
    end
    return output_array
  end
end
