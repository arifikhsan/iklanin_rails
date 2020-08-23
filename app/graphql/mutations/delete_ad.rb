module Mutations
  class DeleteAd < BaseMutation
    field :message, String, null: false

    argument :slug, String, required: true

    def resolve(slug:)
      begin
        ad = ::Ad.friendly.find(slug)
        ad.destroy
        { message: 'ok' }
      rescue ActiveRecord::RecordNotFound
        { message: 'Not found' }
      end
    end
  end
end
