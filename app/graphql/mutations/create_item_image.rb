module Mutations
  class CreateItemImage < BaseMutation
    field :message, String, null: false

    argument :item_id, Integer, required: true
    argument :images, ApolloUploadServer::Upload, required: true
    argument :cover, Boolean, required: true

    def resolve(args)
      item_image = ItemImage.new(args.except(:name, :image))
      item_image.image.attach(io: args[:image].to_io, filename: args[:image].original_filename)

      { message: item_image.save ? 'ok' : 'fail' }
    end
  end
end
