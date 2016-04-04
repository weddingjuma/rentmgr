module AgreementsHelper
  def count_changes(agreements)
    changes = 0
    if agreements.any?
      agreements.each do |a|
          a.extensions.each { |e| changes += 1 if e.change?}
      end
      changes
    else
      changes
    end
    changes
  end

  def count_extensions(agreements, category)
    extensions = 0
    if agreements.any?
      agreements.each do |a|
        a.extensions.each { |e| extensions += 1 if e.category == category}
      end
      extensions
    else
      extensions
    end
    extensions
  end

  def tenant_categories_uk
    Tenant.categories.transform_keys { |k| I18n.t "enums.tenant.category.#{k}" }
  end

  def label_css_class(agreement)
    days_left = agreement.days_left
    if days_left.between? 1, 30
      'label-warning'
    elsif days_left <= 0
      'label-danger'
    else
      'label-success'
    end
  end

  def table_row_class(agreement)
    return 'warning' if agreement.days_left.between? 1, 30
    'danger' if agreement.days_left <= 0
  end
end
