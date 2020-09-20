json.data do
  json.id @ad.id
  json.title @ad.title
  json.slug @ad.slug
  json.detail @ad.detail
  json.price @ad.price
  json.time_start @ad.time_start
  json.time_end @ad.time_end
  json.status @ad.status
  json.cover_image_url polymorphic_url(@ad.images.cover.image.variant(resize: "300x300"))
  json.cover_image do
    json.url do
      json.medium polymorphic_url(@ad.images.cover.image.variant(resize: '600x600'))
    end
  end
  json.images @ad.images do |ad_image|
    json.id ad_image.id
    json.filename ad_image.image.blob.filename
    json.cover ad_image.cover
    json.url do
      json.small polymorphic_url(ad_image.image.variant(resize: "150x150"))
      json.medium polymorphic_url(ad_image.image.variant(resize: "600x600"))
      json.original rails_blob_url(ad_image.image)
    end
  end
  json.user do
    json.name @ad.user.name
    json.email @ad.user.email
    json.phone_number @ad.user.user_detail.phone_number
    json.whatsapp_phone_number @ad.user.user_detail.whatsapp_phone_number
  end
  json.category do
    json.name @ad.category.name
  end
end
