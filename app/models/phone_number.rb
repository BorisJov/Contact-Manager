class PhoneNumber < ApplicationRecord
  validates :person_id, :number, presence: true
  belongs_to :person
end
