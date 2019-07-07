module CreditCardHelper
  extend ActiveSupport::Concern

  def visa_criteria(number)
    return number[0, 1] == '4' && number.length == 16
  end

  def master_card_criteria(number)
    return number[0, 1] == '5' && number.length == 16
  end

  def jcb_criteria(number)
    return [3528..3589].to_s.include?(number[0, 4]) && number.length == 16
  end

  def american_express_criteria(number)
    return (number[0, 2] == '34' || number[0, 2] == '37') && number.length == 15
  end

  def dinersclub_criteria(number)
    if number.length == 14
      return [300..305].to_s.include?(number[0, 3])
      return number[0, 4] == '3095'
      return number[0, 2] == '36'
      return [38..39].to_s.include?(number[0, 2])
    end
  end

  def discover_criteria(number)
    if number.length == 16
      return number[0, 5] == '60110'
      return [60112..60114].to_s.include?(number[0, 5])
      return [601174..601179].to_s.include?(number[0, 6])
      return [601186..601199].to_s.include?(number[0, 6])
      return [644..649].to_s.include?(number[0, 3])
      return number[0, 2] == '65'
    end
  end

  def credit_card_campany(number)
    return 0 if self.visa_criteria(number)
    return 1 if self.master_card_criteria(number)
    return 3 if self.jcb_criteria(number)
    return 4 if self.american_express_criteria(number)
    return 5 if self.dinersclub_criteria(number)
    return 6 if self.discover_criteria(number)
  end

  def credit_card_logo(number)
    company_number = credit_card_campany(number)
    return Settings.credit_card_logos[company_number]
  end
end