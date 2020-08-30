module Types
  class AdImageType < Types::BaseObject
    field :id, Integer, null: false
    field :ad, AdType, null: false
    field :name, String, null: true
    field :image, String, null: true
    field :cover, Boolean, null: false
  end
end
