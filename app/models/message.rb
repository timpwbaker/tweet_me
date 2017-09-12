class Message < ApplicationRecord
  belongs_to :user

  validates :body, length: { in: 1..150 }

  has_attached_file :attached_image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attached_image,
                                    content_type: /\Aimage\/.*\z/

  def body_for_timeline
    body.gsub(/\n/, "<br />").html_safe
  end
end
