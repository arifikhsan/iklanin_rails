module Mutations
  class UpdateAd < BaseMutation
    field :message, String, null: false
    field :slug, String, null: true

    argument :category_ids, [Integer], required: true
    argument :slug, String, required: true
    argument :title, String, required: true
    argument :price, Integer, required: true
    argument :detail, String, required: true
    argument :time_start, GraphQL::Types::ISO8601DateTime, required: true
    argument :time_end, GraphQL::Types::ISO8601DateTime, required: true

    def resolve(args)
      begin
        ad = Ad.friendly.find(args[:slug])
        ad.update(args.except(:slug, :category_ids))

        input_category_ids = args[:category_ids].sort
        old_category_ids = ad.category_ids.sort

        new_category_ids = input_category_ids - old_category_ids
        remove_category_ids = old_category_ids - input_category_ids

        ad.ad_categories.create(new_category_ids.map { |id| {category_id: id} }) if new_category_ids.present?
        ad.ad_categories.where(category_id: remove_category_ids).delete_all if remove_category_ids.present?

        { message: 'ok', slug: ad.slug }
      rescue ActiveRecord::RecordNotFound
        { message: 'Not found' }
      end
    end
  end
end
