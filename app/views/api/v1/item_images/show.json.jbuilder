json.data do
  json.id @item_image.id
  json.cover @item_image.cover
  json.image do
    json.cover @item_image.cover
    json.filename @item_image.image.blob.filename
    json.url do
      json.small polymorphic_url(@item_image.image.variant(resize: "300x300"))
      json.original rails_blob_url(@item_image.image)
    end
  end
end
