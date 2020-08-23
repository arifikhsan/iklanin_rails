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

    field :all_categories, [CategoryType], null: true
    def all_categories
      Category.all
    end

    field :find_ad, AdType, null: true do
      argument :slug, String, required: true
    end
    def find_ad(slug:)
      Ad.friendly.find(slug)
    end
  end
end
