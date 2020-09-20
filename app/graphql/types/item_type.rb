module Types
  class ItemType < Types::BaseObject
    field :id, Integer, null: false
    field :user, UserType, null: false
    field :category, CategoryType, null: false
    field :title, String, null: true
    field :detail, String, null: true
    field :price, Integer, null: true
    field :time_start, GraphQL::Types::ISO8601DateTime, null: true
    field :time_end, GraphQL::Types::ISO8601DateTime, null: true
    field :active, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :slug, String, null: true
    field :images, [ItemImageType], null: true
  end
end
