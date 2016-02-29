class Agreement < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :rent_object
  has_and_belongs_to_many :sessions
end
