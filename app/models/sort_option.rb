class SortOption < ActiveHash::Base
  self.data = [
    {id: 1, name: '並び替え', sort_way: 'id desc'},
    {id: 2, name: '価格の安い順', sort_way: 'price asc'},
    {id: 3, name: '価格の高い順', sort_way: 'price desc'},
    {id: 4, name: '出品の古い順', sort_way: 'updated_at asc'},
    {id: 5, name: '出品の新しい順', sort_way: 'updated_at desc'}
  ]
end