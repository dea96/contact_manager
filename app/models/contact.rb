class Contact < ApplicationRecord
  belongs_to :group

  paginates_per 10

  validates :name, :email, :group_id, presence: true
  validates :name, length: { minimum: 2 }

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
