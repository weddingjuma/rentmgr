module StreetsHelper
  def translate_street_kind(street)
    I18n.t "enums.street.kind.#{street.kind}"
  end
end
