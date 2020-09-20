module Types
  class MutationType < Types::BaseObject
    field :create_ad_image, mutation: Mutations::CreateItemImage
    field :create_ad_images, mutation: Mutations::CreateItemImages
    field :update_ad, mutation: Mutations::UpdateItem
    field :delete_ad, mutation: Mutations::DeleteItem
    field :create_ad, mutation: Mutations::CreateItem
  end
end
