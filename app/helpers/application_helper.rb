module ApplicationHelper
  def valid_month_selection
    selection = []
    [*1..12].each do |i|
      selection << i.to_s.rjust(2, '0')
    end
    return selection
  end
end
