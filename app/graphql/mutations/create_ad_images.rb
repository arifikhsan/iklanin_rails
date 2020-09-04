module Mutations
  class CreateAdImages < BaseMutation
    field :message, String, null: false

    argument :ad_id, Integer, required: true
    argument :images, [Types::AdImageInputType], required: true

    def resolve(args)
      args[:images].map do |uploaded_file|
        ai = AdImage.new
        ai.ad_id = args[:ad_id]
        ai.image.attach(io: uploaded_file.image.to_io, filename: uploaded_file.image.original_filename)
        ai.cover = uploaded_file.cover
        ai.save
      end

      { message: 'ok' }
    end
  end
end
