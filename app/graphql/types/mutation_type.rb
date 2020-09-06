module Types
  class MutationType < Types::BaseObject
    field :create_ad_image, mutation: Mutations::CreateAdImage
    field :create_ad_images, mutation: Mutations::CreateAdImages
    field :update_ad, mutation: Mutations::UpdateAd
    field :delete_ad, mutation: Mutations::DeleteAd
    field :create_ad, mutation: Mutations::CreateAd
  end
end
