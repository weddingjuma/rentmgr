class Extension < ActiveRecord::Base
  belongs_to :agreement
  has_and_belongs_to_many :sessions

  enum category: %w(change addition)

  validates :code,
            :sign_date,
            :due_date,
            :interest,
            :category,
            :agreement,
            presence: true
end
