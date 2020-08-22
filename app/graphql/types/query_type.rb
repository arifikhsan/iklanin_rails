module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :find_user, UserType, null: true do
      argument :email, String, required: true
    end
    def find_user(email:)
      User.find_by(email: email)
    end
  end
end
