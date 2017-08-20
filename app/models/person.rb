class Person < ApplicationRecord
  validates :first_name, :last_name, presence: true
  include Contact

  def to_s
    "#{first_name} #{last_name}"
  end
end
