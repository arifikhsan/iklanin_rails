module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :find_user, UserType, null: true do
      argument :email, String, required: true
    end
    def find_user(email:)
      User.find_by(email: email)
    end

    field :all_users, [UserType], null: true
    def all_users
      User.all
    end

    field :all_ads, [AdType], null: true
    def all_ads
      Ad.all
    end
  end
end
