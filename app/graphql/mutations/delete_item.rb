module Mutations
  class DeleteItem < BaseMutation
    field :message, String, null: false

    argument :slug, String, required: true

    def resolve(slug:)
      begin
        item = ::Item.friendly.find(slug)
        item.destroy
        { message: 'ok' }
      rescue ActiveRecord::RecordNotFound
        { message: 'Not found' }
      end
    end
  end
end
