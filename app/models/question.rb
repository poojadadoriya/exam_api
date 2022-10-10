class Question < ApplicationRecord
  has_one :answer
  has_many :options
  belongs_to :technology
  accepts_nested_attributes_for :options, :allow_destroy => true
  has_one_attached :image
end
