module ApplicationHelper
  def nav_item(body, url, options = {})
    content_tag :li, class: 'nav-item' do
      link_to body, url, class: "nav-link #{ 'active' if current_page? url }"
    end
  end

  def week_day(number)
    Date::DAYNAMES[number]
  end

  def show_flash
    flash.collect do |key, body|
      alert key, body
    end.join.html_safe
  end

  def show_errors
    model_name = controller_name.singularize.to_sym
    object = instance_variable_get("@#{model_name}")

    if object and object.errors.any?
      html = "<strong>#{pluralize(object.errors.count, "error")} prohibited this classroom from being saved:</strong>"
      html << '<br>'
      html << object.errors.full_messages.join('<br>')

      alert('danger', html.html_safe, close: true)
    end
  end
end
