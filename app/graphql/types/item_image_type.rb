module Types
  class ItemImageType < Types::BaseObject
    field :id, Integer, null: false
    field :item, ItemType, null: false
    field :name, String, null: true
    field :image, String, null: true
    field :cover, Boolean, null: false
  end
end
