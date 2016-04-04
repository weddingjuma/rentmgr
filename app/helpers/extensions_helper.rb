module ExtensionsHelper
  def recent_extension_class(extension)
    'success' if extension.agreement.recent_extension == extension
  end
end
