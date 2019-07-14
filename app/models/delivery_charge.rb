class DeliveryCharge < ActiveHash::Base
  self.data = [
    {id: 1, name: '着払い（購入者負担）', shipping_fee: '送料別'},
    {id: 2, name: '送料込み（出品者負担）', shipping_fee: '送料込み'}
  ]
end