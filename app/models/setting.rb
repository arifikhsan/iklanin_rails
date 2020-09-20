class Setting < ApplicationRecord
  def self.max_duration_free
    find_by(key: 'max_duration_free').value.to_i
  end
end
