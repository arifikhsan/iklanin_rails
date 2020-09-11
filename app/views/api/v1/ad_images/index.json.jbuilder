json.data @ad_images do |ad|
  json.id ad.id
  json.image ad.image
  json.cover ad.cover
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
