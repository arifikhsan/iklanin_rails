json.data @ads do |ad|
  json.id ad.id
  json.title ad.title
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
