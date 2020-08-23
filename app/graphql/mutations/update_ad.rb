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


      begin
        ad = ::Ad.friendly.find(args[:slug])
        ad.update(args.except(:slug, :category_id))
        { message: 'ok', slug: ad.slug }
      rescue ActiveRecord::RecordNotFound
        { message: 'Not found' }
      end
    end
  end
end
