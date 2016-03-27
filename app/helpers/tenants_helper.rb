module TenantsHelper
  def translate_tenant_category(category)
    I18n.t "enums.tenant.category.#{category}"
  end
end
