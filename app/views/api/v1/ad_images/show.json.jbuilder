json.data do
  json.id @ad_image.id
  json.cover @ad_image.cover
  json.image_url rails_blob_url(@ad_image.image)
end
