class EmailAdress < ApplicationRecord
  validates :person_id, :adress, presence: true
  belongs_to :person
end
