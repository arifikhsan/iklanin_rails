module Types
  class UserDetailType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :user, UserType, null: false
  end
end
