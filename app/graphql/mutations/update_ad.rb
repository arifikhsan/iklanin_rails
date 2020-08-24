module Mutations
  class UpdateAd < BaseMutation
    field :message, String, null: false
    field :slug, String, null: true

    argument :category_id, Integer, required: true
    argument :slug, String, required: true
    argument :title, String, required: true
    argument :price, Integer, required: true
    argument :detail, String, required: true
    argument :time_start, GraphQL::Types::ISO8601DateTime, required: true
    argument :time_end, GraphQL::Types::ISO8601DateTime, required: true

    def resolve(args)
      ad = Ad.find_by(slug: args[:slug])
      return { message: 'Not found' } unless ad

      ad.update(args.except(:slug))
      { message: 'ok', slug: ad.slug }
    end
  end
end
