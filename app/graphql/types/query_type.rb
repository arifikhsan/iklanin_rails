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
  end
end
