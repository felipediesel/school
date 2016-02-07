class Level < ActiveRecord::Base
  include SetPosition

  belongs_to :modality

  validates :name, presence: true
end
