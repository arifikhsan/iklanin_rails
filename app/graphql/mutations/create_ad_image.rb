module Mutations
  class CreateAdImage < BaseMutation
    field :message, String, null: false

    argument :ad_id, Integer, required: true
    argument :images, ApolloUploadServer::Upload, required: true
    argument :cover, Boolean, required: true

    def resolve(args)
      ad_image = AdImage.new(args.except(:name, :image))
      ad_image.image.attach(io: args[:image].to_io, filename: args[:image].original_filename)

      { message: ad_image.save ? 'ok' : 'fail' }
    end
  end
end
