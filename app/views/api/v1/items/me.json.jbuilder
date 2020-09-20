json.data @items do |item|
  json.id item.id
  json.title item.title
  json.slug item.slug
  json.detail item.detail
  json.price item.price
  json.time_start item.time_start
  json.time_end item.time_end
  json.status item.status
  json.category do
    json.name item.category.name
  end
end
json.pagination do
  json.total_pages @items.total_pages
  json.current_page @items.current_page
  json.next_page @items.next_page
  json.prev_page @items.prev_page
  json.is_first_page @items.first_page?
  json.is_last_page @items.last_page?
  json.is_out_of_range @items.out_of_range?
  json.limit @items.limit_value
  json.total_count @items.total_count
end
