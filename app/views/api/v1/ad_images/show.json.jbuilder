json.data do
  json.id @ad_image.id
  json.cover @ad_image.cover
  json.image do
    json.cover @ad_image.cover
    json.filename @ad_image.image.blob.filename
    json.url do
      json.small polymorphic_url(@ad_image.image.variant(resize: "300x300"))
      json.original rails_blob_url(@ad_image.image, disposition: "attachment")
    end
  end
end
