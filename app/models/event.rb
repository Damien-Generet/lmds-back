class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    CATEGORIES = ["Atelier", "Concert", "Permanence", "Stage", "Scène ouverte"]


    validates :creator, presence: true
    validates :category, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :max_seats, numericality: { greater_than_or_equal_to: 0 }

    def valid_date?
      return errors.add(:La_date, 'doit être renseignée.') && false unless start_date.present?
  
      if start_date < Date.today
        errors.add(:La_date, 'ne peut pas être passée.')
        return false
      end
  
      return true
    end
end
