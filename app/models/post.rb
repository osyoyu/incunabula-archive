class Post < ApplicationRecord
  class << self
    def find_by_url_key(url_key)
      matches = url_key.match(/-(\d+)$/)
      return nil if matches.nil?
      find_by(id: matches[1])
    end
  end

  def to_param
    return nil if !persisted?
    "#{created_at.strftime("%Y%m%d")}-#{id}"
  end
end
