module Mutations
  class CreateAdImages < BaseMutation
    field :message, String, null: false

    argument :ad_id, Integer, required: true
    argument :name, String, required: true
    argument :image, ApolloUploadServer::Upload, required: true
    argument :cover, Boolean, required: true

    def resolve(args)
      ad_image = AdImage.new(args.except(:name, :image))
      ad_image.image.attach(io: args[:image].to_io, filename: args[:name])

      { message: ad_image.save ? 'ok' : 'fail' }
    end
  end
end
