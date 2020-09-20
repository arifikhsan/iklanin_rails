json.data @item_images do |item_image|
  json.id item_image.id
  json.cover item_image.cover
  json.image do
    json.cover item_image.cover
    json.filename item_image.image.blob.filename
    json.url do
      json.small polymorphic_url(item_image.image.variant(resize: "300x300"))
      json.original rails_blob_url(item_image.image)
    end
  end
end
json.metadata do
  json.total_page @item_images.total_pages
  json.total_pages @item_images.total_pages
  json.current_page @item_images.current_page
  json.next_page @item_images.next_page
  json.prev_page @item_images.prev_page
  json.is_first_page @item_images.first_page?
  json.is_last_page @item_images.last_page?
  json.is_out_of_range @item_images.out_of_range?
end
