class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :validate_clickbait

  def validate_clickbait
    self.title.included_in?(["Won't Believe", "Secret", "Top #{/[0-9]*/}", "Guess"])
  end
end
