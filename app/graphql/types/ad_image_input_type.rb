module Types
  class AdImageInputType < Types::BaseInputObject
    description "Attributes for creating or updating an item image"

    argument :image, ApolloUploadServer::Upload, required: true
    argument :cover, Boolean, required: true
  end
end
