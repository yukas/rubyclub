class Article < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  scope :latest, -> { order("created_at desc") }
end
