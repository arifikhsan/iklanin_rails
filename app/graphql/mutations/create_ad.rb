module Mutations
  class CreateAd < BaseMutation
    field :message, String, null: false
    field :slug, String, null: false

    argument :category_id, Integer, required: true
    argument :title, String, required: true
    argument :price, Integer, required: true
    argument :detail, String, required: true
    argument :time_start, GraphQL::Types::ISO8601DateTime, required: true
    argument :time_end, GraphQL::Types::ISO8601DateTime, required: true

    def resolve(args)
      ad = Ad.create(args.merge(user_id: context[:current_user].id))

      { message: 'ok', slug: ad.slug }
    end
  end
end
