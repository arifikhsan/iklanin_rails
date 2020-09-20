module Types
  class ItemImageInputType < Types::BaseInputObject
    description "Attributes for creating or updating an item image"

    argument :image, ApolloUploadServer::Upload, required: true
    argument :cover, Boolean, required: true
  end
end
