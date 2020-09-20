module Types
  class MutationType < Types::BaseObject
    field :create_item_image, mutation: Mutations::CreateItemImage
    field :create_item_images, mutation: Mutations::CreateItemImages
    field :update_item, mutation: Mutations::UpdateItem
    field :delete_item, mutation: Mutations::DeleteItem
    field :create_item, mutation: Mutations::CreateItem
  end
end
