module DeviseHelper
  def devise_error_messages!
    
#    return "" if resource.errors.empty?
#    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
#    sentence = I18n.t("errors.messages.not_saved",
#                          :count => resource.errors.count,
#                          :resource => resource_name)
#
#    html = <<-HTML
#    <div id="error_explanation">
#      <h2>#{sentence}</h2>
#      <ul>#{messages}</ul>
#    </div>
#    HTML
#
#    html.html_safe
    
    
    html = <<-HTML
    <div style= 'padding: 10px 0 10px 210px; color:#CC3333'>Senha atual incorreta. Por favor, tente novamente.
    </div>
    HTML
    
    html.html_safe
  end
end
