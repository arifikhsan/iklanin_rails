json.data @ad_images do |ad_image|
  json.id ad_image.id
  json.cover ad_image.cover
  json.image do
    json.filename ad_image.image.blob.filename
    json.url do
      json.small polymorphic_url(ad_image.image.variant(resize: "300x300"))
      json.original rails_blob_url(ad_image.image)
    end
  end
end
json.metadata do
  json.total_page @ad_images.total_pages
  json.total_pages @ad_images.total_pages
  json.current_page @ad_images.current_page
  json.next_page @ad_images.next_page
  json.prev_page @ad_images.prev_page
  json.is_first_page @ad_images.first_page?
  json.is_last_page @ad_images.last_page?
  json.is_out_of_range @ad_images.out_of_range?
end
