class Problem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search != ""
      Problem.where('title LIKE(?)', "%#{search}%")
    else
      Problem.all
    end
  end


  with_options presence: true do
    validates :title, length: { maximum: 20}
    validates :text, length: { minimum: 15, maximum: 200 }
    validates :genre
  end
    validates :genre_id, numericality: { other_than: 1, message:  "を選んで下さい"} 
end
