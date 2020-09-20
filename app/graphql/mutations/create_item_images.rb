module Mutations
  class CreateItemImages < BaseMutation
    field :message, String, null: false

    argument :item_id, Integer, required: true
    argument :images, [Types::ItemImageInputType], required: true

    def resolve(args)
      args[:images].map do |uploaded_file|
        ai = ItemImage.new
        ai.item_id = args[:item_id]
        ai.image.attach(io: uploaded_file.image.to_io, filename: uploaded_file.image.original_filename)
        ai.cover = uploaded_file.cover
        ai.save
      end

      { message: 'ok' }
    end
  end
end
