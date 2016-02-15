class Settlement < ActiveRecord::Base
  enum kind: %w(city willage)
end
