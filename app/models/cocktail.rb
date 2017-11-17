class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
