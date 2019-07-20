class ItemState < ActiveHash::Base
  self.data = [
    {id: 1, name: '出品中'},
    {id: 2, name: '配達前'},
    {id: 3, name: '配達中'},
    {id: 4, name: '配達済'},
    {id: 5, name: '評価済'}
  ]
end