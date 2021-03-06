module Mutations
  class CreateItem < BaseMutation
    field :message, String, null: false
    field :slug, String, null: false

    argument :category_id, Integer, required: true
    argument :title, String, required: true
    argument :price, Integer, required: true
    argument :detail, String, required: true
    argument :time_start, GraphQL::Types::ISO8601DateTime, required: true
    argument :time_end, GraphQL::Types::ISO8601DateTime, required: true

    argument :images, [Types::ItemImageInputType], required: false

    def resolve(args)
      item = item.create(args.except(:images).merge(user_id: context[:current_user].id))

      if args[:images].present?
        args[:images].map do |uploaded_file|
          ai = ItemImage.new
          ai.item_id = item.id
          ai.image.attach(io: uploaded_file.image.to_io, filename: uploaded_file.image.original_filename)
          ai.cover = uploaded_file.cover
          ai.save
        end
      end

      { message: 'ok', slug: item.slug }
    end
  end
end
