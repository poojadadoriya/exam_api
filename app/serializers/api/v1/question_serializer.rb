class QuestionSerializer < ActiveModel::Serializer
  attributes :id
  has_many :options
end