module Types
  class CategoryType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :slug, String, null: false
    field :parent, CategoryType, null: true
    field :child, [CategoryType], null: true
  end
end
