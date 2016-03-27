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
end
