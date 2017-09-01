class Message < ApplicationRecord
  belongs_to :user

  validates :body, length: { in: 1..150 }

  #presenter methods, extract these they multiply
  def body_for_timeline
    body.gsub(/\n/, '<br />').html_safe
  end

end
