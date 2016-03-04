module ApplicationHelper
  def boolean_to_glyph_class(value)
    value ? 'glyphicon glyphicon-plus' : 'glyphicon glyphicon-minus'
  end
end
