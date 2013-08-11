class Deck < ActiveRecord::Base
  attr_accessible :category, :decklist, :description_file, :title

  before_save do
    self.description_file.downcase!
    self.category.upcase!
  end

  validates :title,             presence: true, uniqueness: { case_sensitive: false }
  validates :description_file,  presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }
  validates :decklist,          presence: true
  validates :category,          presence: true
end