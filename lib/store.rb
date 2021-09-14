class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validate :must_carry_at_least_one_apparel, on: :create  

  def must_carry_at_least_one_apparel
    if !mens_apparel.present? && !womens_apparel.present?
      errors.add(:mens_apparel,"either mens_apparel or womens_apparel must be present")
    end
  end
end

