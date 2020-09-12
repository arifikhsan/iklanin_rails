json.data @ads do |ad|
  json.id ad.id
  json.title ad.title
  json.slug ad.slug
  json.detail ad.detail
  json.price ad.price
  json.time_start ad.time_start
  json.time_end ad.time_end
  json.status ad.status
  json.image ad.images do |ad_image|
    json.filename ad_image.image.blob.filename
    json.cover ad_image.cover
    json.url do
      json.small polymorphic_url(ad_image.image.variant(resize: "300x300"))
      json.original rails_blob_url(ad_image.image)
    end
  end
  json.user do
    json.name ad.user.name
    json.email ad.user.email
  end
  json.category do
    json.name ad.category.name
  end
end
json.metadata do
  json.total_page @ads.total_pages
  json.total_pages @ads.total_pages
  json.current_page @ads.current_page
  json.next_page @ads.next_page
  json.prev_page @ads.prev_page
  json.is_first_page @ads.first_page?
  json.is_last_page @ads.last_page?
  json.is_out_of_range @ads.out_of_range?
end
