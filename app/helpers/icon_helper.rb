module IconHelper
  def icon(kind, text = nil)
    options = { class: "fa fa-#{kind}" }
    "#{content_tag(:span, nil, options)} #{h text}".strip.html_safe
  end

  def icon_for(action, text = nil)
    icons = {
      destroy: :times,
      edit: :pencil
    }
    kind = icons[action] || action

    icon kind, text
  end
end
