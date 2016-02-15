class Street < ActiveRecord::Base
  enum kind: %w(str blvd)
end
