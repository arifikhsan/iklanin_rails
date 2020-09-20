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

    field :paginate_users, UserType.connection_type, null: true#, connection: true
    def paginate_users
      User.all
    end

    field :all_items, [ItemType], null: true
    def all_items
      item.all
    end

    field :all_categories, [CategoryType], null: true
    def all_categories
      Category.all
    end

    field :find_item, ItemType, null: true do
      argument :slug, String, required: true
    end
    def find_item(slug:)
      item.friendly.find(slug)
    end

    field :my_items, [ItemType], null: true
    def my_items
      context[:current_user].items
    end
  end
end
