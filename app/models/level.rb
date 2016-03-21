class Level < ApplicationRecord
  include SetPosition

  belongs_to :modality

  validates :name, presence: true
end
