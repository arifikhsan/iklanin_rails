module Types
  class MutationType < Types::BaseObject
    field :update_ad, mutation: Mutations::UpdateAd
    field :delete_ad, mutation: Mutations::DeleteAd
    field :create_ad, mutation: Mutations::CreateAd
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
