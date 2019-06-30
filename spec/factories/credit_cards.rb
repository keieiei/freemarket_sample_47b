FactoryBot.define do
  day = Faker::Time.between(Date.today, 10.years.after, :all)
  card_company = Faker::Number.between(1, 6)
  if card_company == 1 then
    # american express card
    security_code_dummy = Faker::Number.number(4).to_s
    rand_prefix = Faker::Number.between(1, 2)
    if rand_prefix == 1 then
      card_number_dummy = '34' + Faker::Number.number(13).to_s
    elsif rand_prefix == 2 then
      card_number_dummy = '37' + Faker::Number.number(13).to_s
    end
  else
    security_code_dummy = Faker::Number.number(3).to_s
    if card_company == 2 then
      # visa card
      card_number_dummy = '4' + Faker::Number.number(15)
    elsif card_company == 3 then
      # master card
      card_number_dummy = '5' + Faker::Number.number(15)
    elsif card_company == 4 then
      # jcb card
      card_number_dummy = Faker::Number.between(3528, 3589).to_s + Faker::Number.number(12).to_s
    elsif card_company == 5 then
      # diners card
      rand_prefix = Faker::Number.between(1, 4)
      if rand_prefix == 1 then
        card_number_dummy = Faker::Number.between(300, 305).to_s + Faker::Number.number(11).to_s
      elsif rand_prefix == 2 then
        card_number_dummy = '3095' + Faker::Number.number(10).to_s
      elsif rand_prefix == 3 then
        card_number_dummy = '36' + Faker::Number.number(12).to_s
      elsif rand_prefix == 4 then
        card_number_dummy = Faker::Number.between(38, 39).to_s + Faker::Number.number(12).to_s
      end
    elsif card_company == 6 then
      # discover card
      rand_prefix = Faker::Number.between(1, 6)
      if rand_prefix == 1 then
        card_number_dummy = '60110' + Faker::Number.number(11).to_s
      elsif rand_prefix == 2 then
        card_number_dummy = Faker::Number.between(60112, 60114).to_s + Faker::Number.number(11).to_s
      elsif rand_prefix == 3 then
        card_number_dummy = Faker::Number.between(601174, 601179).to_s + Faker::Number.number(10).to_s
      elsif rand_prefix == 4 then
        card_number_dummy = Faker::Number.between(601186, 601199).to_s + Faker::Number.number(10).to_s
      elsif rand_prefix == 5 then
        card_number_dummy = Faker::Number.between(644, 649).to_s + Faker::Number.number(13).to_s
      elsif rand_prefix == 6 then
        card_number_dummy = '65' + Faker::Number.number(14).to_s
      end
    end
  end

  factory :credit_card do
    card_number           { card_number_dummy }
    valid_year            { day.to_s[2, 2] }
    valid_month           { day.to_s[5, 2] }
    security_code         { security_code_dummy }
    user
  end

end
