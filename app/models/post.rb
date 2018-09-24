class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 20}
  validates :summary, length: {maximum: 200}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if title && !title.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
      errors.add(:title, "need clickbait")
    end
  end

end
