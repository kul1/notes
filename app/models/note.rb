# encoding: utf-8
class Note
  include Mongoid::Document
  # jinda begin
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :title, :type => String
  field :body, :type => String
  belongs_to :user
  validates :title, length: { maximum: (MAX_TITLE_LENGTH = 30) }, presence: true
  validates :body, length: { maximum: (MAX_BODY_LENGTH = 1000)}

 #  def title_or_body
 #    error.add(:title, "Title or Body required") unless title.present?
 #  end
  # jinda end
end
