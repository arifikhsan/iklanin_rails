json.data do
  json.id @item.id
  json.title @item.title
  json.slug @item.slug
  json.detail @item.detail
  json.price @item.price
  json.time_start @item.time_start
  json.time_end @item.time_end
  json.status @item.status
  json.category_id @item.category.id
  json.images @item.images do |item_image|
    json.id item_image.id
    json.name item_image.name
    json.detail item_image.detail
    json.cover item_image.cover
    json.image do
      json.name item_image.name
    end
    json.image_display rails_blob_url(item_image.image)
    json.url do
      json.original rails_blob_url(item_image.image)
    end
  end
end
